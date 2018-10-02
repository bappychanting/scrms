<?php

namespace App\Batch;
use App\Database\Database;
use App\User\Notification;

Class Exam extends Batch {

    private $exam;
    private $title;
    private $score;
    private $date;
    private $time;
    private $description;

    /* Setter getter for all variables */

      // Exam setter getter
    function setExam($exam){
        $this->exam = $exam;
    }
    function getExam(){
        return $this->exam;
    }

      // Title setter getter
    function setTitle($title){
        $this->title = $title;
    }
    function getTitle(){
        return $this->title;
    }

      // Score setter getter
    function setScore($score){
        $this->score = $score;
    }
    function getScore(){
        return $this->score;
    }

        // Date setter getter
    function setTime($time){
        $this->time = $time;
    }
    function getTime(){
        return $this->time;
    }

        // Date setter getter
    function setDate($date){
        if(strtotime($date) > time()){
            $this->date = strtotime($date);   
        }
    }
    function getDate(){
        return $this->date;
    }

        // Description setter getter
    function setDescription($description){
        $this->description = $description;
    }
    function getDescription(){
        return $this->description;
    }


    /* Setter getter for all variables */

      // Setting all the data days
    public function setExamData($data = ''){
        if (isset($data['id'])){
            $this->setId($data['id']);
        }
        if(isset($data['exam'])){
            $this->setExam($data['exam']);
        }
        else{
            $this->setExam('');   
        }
        if (isset($data['title'])){
            $this->setTitle($data['title']);
        }
        if (isset($data['score'])){
            $this->setScore($data['score']);
        }
        if (isset($data['exam_time'])){
            $this->setTime($data['exam_time']);
        }
        if(isset($data['exam_date'])){
            $this->setDate($data['exam_date']);
        }
        if(isset($data['description'])){
            $this->setDescription($data['description']);
        }
        return $this;
    }


	    // Function for validating exam teacher
    public function checkExamTakerValidity() {
        $findBatch = $this->findBatch();
        if($findBatch){
            foreach($findBatch as $batch){
                if($_SESSION['role'] < 3 || $batch['teacher_username'] == $_SESSION['uname']){
                    return $findBatch;
                }
            }
        }
    }

        // Function for getting all Exams
    public function allExams() {
        if($this->checkExamTakerValidity()){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('SELECT * FROM exams_view WHERE batch = :id');  
            $query->execute(array(':id' => $this->getId()));
            $data = $query->fetchAll();
            return $data; 
        }
    }

        // Function for validating exam teacher
    private function checkExamDateAvailability() {
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM exams_view WHERE exam_date = :exam_date and id != :exam');  
        $find->execute(array(':exam' => $this->getExam(), ':exam_date' => $this->getDate()));
        $total = $find->rowCount();
        if($total == 0){
            return TRUE;
        }
    }

            // Function for storing participants
    private function storeParticipants() {
        $pdo = Database::getInstance();
        $lastExam = $pdo->prepare('SELECT max(id) as id FROM  exams');
        $lastExam->execute();
        $lastExamId=$lastExam->fetchAll();
        $participantsQuery = $pdo->prepare('SELECT * FROM batch_assigned_students_view WHERE batch = :id');  
        $participantsQuery->execute(array(':id' => $this->getId()));
        $participants = $participantsQuery->fetchAll();
        $this->setExam($lastExamId['0']['id']);
        foreach($participants as $participant){
            $query = $pdo->prepare('INSERT INTO exam_marks (exam, student) VALUES (:exam, :student)');        
            $query->execute(array(':exam'=>$this->getExam(), ':student'=>$participant['id']));
        }  
    }

        // Function for adding new exam
    public function storeExam() {
        if($this->checkExamDateAvailability() && !empty($this->getTitle()) && !empty($this->getScore()) && !empty($this->getDate()) && !empty($this->getTime())){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('INSERT INTO exams (batch, title, max_score, description, exam_date, exam_time) VALUES (:id, :title, :score, :description, :exam_date, :exam_time)');        
            $status = $query->execute(array(':id'=>$this->getId(), ':title'=>$this->getTitle(), ':score'=>$this->getScore(), ':description'=>$this->getDescription(), ':exam_date'=>$this->getDate(), ':exam_time'=>$this->getTime()));
            $this->storeParticipants();
            Notification::insertExam();
            return $status;  
        }
    }

        // Function for getting all Exams
    public function findExam() {
        if($this->checkExamTakerValidity()){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('SELECT * FROM exams_view WHERE id = :exam');  
            $query->execute(array(':exam' => $this->getExam()));
            $data = $query->fetchAll();
            return $data;
        }
    }

        // Function for getting all Exams
    public function getAllParticipants() {
        if($this->findExam()){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('SELECT * FROM exam_marks_view WHERE exam = :exam');  
            $query->execute(array(':exam' => $this->getExam()));
            $participants = $query->fetchAll();
            return $participants;
        }
    }

        // Function for storing student scores
    public function storeScores() {
        $pdo = Database::getInstance();
        for ($i = 0; $i < count($this->getExam()); $i++) {
            $query = $pdo->prepare('UPDATE exam_marks SET score = :score, exam_comment = :description WHERE id = :exam');        
            $query->execute(array(':exam'=>$this->getExam()[$i], ':score'=>$this->getScore()[$i], ':description'=>$this->getDescription()[$i]));
            Notification::insertExamMarks($this->getExam()[$i]);
        }
    }

        // Function for getting all Exams
    public function updateExam() {
        if($this->checkExamDateAvailability() && !empty($this->getTitle()) && !empty($this->getScore()) && !empty($this->getDate()) && !empty($this->getTime())){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('UPDATE exams SET title = :title, max_score = :score, description = :description, exam_date = :exam_date, exam_time = :exam_time WHERE id = :exam');        
            $status = $query->execute(array(':exam'=> $this->getExam(), ':title'=>$this->getTitle(), ':score'=>$this->getScore(), ':description'=>$this->getDescription(), ':exam_date'=>$this->getDate(), ':exam_time'=>$this->getTime()));
            return $status;
        }
    }

        // Function for getting all Exams
    public function deleteExam() {
        if($this->checkExamTakerValidity()){
            $pdo = Database::getInstance();
            $participantsQuery = $pdo->prepare('UPDATE exam_marks SET delete_date = :delete_date WHERE exam = :exam');        
            $participantsQuery->execute(array(':exam'=>$this->getExam(), ':delete_date' => time()));
            $query = $pdo->prepare('UPDATE exams SET delete_date = :delete_date WHERE id = :exam');        
            $status = $query->execute(array(':exam'=>$this->getExam(), ':delete_date' => time()));
            return $status; 
        }
    }

	
}

?>