<?php

namespace App\Batch;
use App\Database\Database;
use App\User\Notification;

Class Attendance extends Exam {

      // overload ID setter getter
    function setId($id){
        $this->id = $id;
    }
    function getId(){
        return $this->id;
    }

        // Overload Date setter getter
    function setDate($date){
        $this->date = strtotime($date);   
    }
    function getDate(){
        return $this->date;
    }

      // Setting all the data days
    public function setData($data = ''){
        if (isset($data['id'])){
            $this->setId($data['id']);
        }
        else{
            $this->setId('');   
        }
        if (isset($data['attendance'])){
            $this->setScore($data['attendance']);
        }
        if(isset($data['attendance_date'])){
            $this->setDate($data['attendance_date']);
        }
        return $this;
    }

       // Function for validating attendance availability
    private function checkAttendanceDateAvailability() {
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM attendance_dates WHERE attendance_date = :attendance_date and batch = :id');  
        $find->execute(array(':id' => $this->getId(), ':attendance_date' => $this->getDate()));
        $total = $find->rowCount();
        if($total == 0){
            return TRUE;
        }
    }

        // Function for getting last attendance
    public function getLastAttendance() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT max(id) as id FROM  attendance_dates');
        $query->execute();
        $lastDate=$query->fetchAll();
        return $lastDate['0']['id'];

    }

            // Function for storing participants
    private function storeClassParticipants() {
        $attendance_date = $this->getLastAttendance();
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM batch_assigned_students_view WHERE batch = :id');  
        $query->execute(array(':id' => $this->getId()));
        $participants = $query->fetchAll();
        foreach($participants as $participant){
            $query = $pdo->prepare('INSERT INTO attendance (student, attendance_date) VALUES (:student, :attendance_date)');        
            $query->execute(array(':student'=>$participant['id'], ':attendance_date'=>$attendance_date));
        }  
    }

        // Function for adding new exam
    public function storeAttendance() {
        if($this->checkAttendanceDateAvailability() && !empty($this->getDate())){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('INSERT INTO attendance_dates (batch, attendance_date) VALUES (:id, :attendance_date)');        
            $status = $query->execute(array(':id'=>$this->getId(), ':attendance_date'=>$this->getDate()));
            $this->storeClassParticipants();
            return $status;  
        }
    }

        // Function for getting all attendance
    public function getAllAttendance() {
        if($this->checkExamTakerValidity()){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('SELECT * FROM attendance_view WHERE batch_id = :id');        
            $query->execute(array(':id' => $this->getID()));
            $data = $query->fetchAll();
            return $data;
        }
    }

        // Function for getting specific attendance
    public function getAttendance() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM attendance_view WHERE attendance_date_id = :id');        
        $query->execute(array(':id' => $this->getID()));
        $data = $query->fetchAll();
        foreach($data as $val){
            $this->setId($val['batch_id']);
            if($this->checkExamTakerValidity()){
                return $data;
            }
        }
    }

        // Function for adding new exam
    public function updateAttendance() {
        $pdo = Database::getInstance();
        for ($i = 0; $i < count($this->getId()); $i++) {
            $query = $pdo->prepare('UPDATE attendance SET attendance_status = :attendance WHERE id = :id');        
            $query->execute(array(':id'=>$this->getId()[$i], ':attendance'=>$this->getScore()[$i]));
        }
    }

        // Function for adding new exam
    public function deleteAttendance() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT batch FROM attendance_dates WHERE id = :id');        
        $query->execute(array(':id'=>$this->getId()));
        $data = $query->fetchAll();
        $query = $pdo->prepare('UPDATE attendance_dates SET delete_date = :delete_date WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':delete_date'=> time()));
        if($status)
            return $data['0']['batch'];
    }
	
}

?>