<?php

namespace App\Batch;
use App\Database\Database;

Class Batch{

    private $id;
    private $number;
    private $type;
    private $teacher;
    private $class;
    private $period;
    private $days;
    private $start_time;
    private $end_time;
    private $start_date;
    private $end_date;
    private $chainFunction;

    /* Setter getter for all variables */

      // ID setter getter
    function setId($id){
        $this->id = intval($id);
    }
    function getId(){
        return $this->id;
    }

      // Number setter getter
    function setNumber($number){
        $this->number = intval($number);
    }
    function getNumber(){
        return $this->number;
    }

        // Type setter getter
    function setType($type){
        $this->type = intval($type);
    }
    function getType(){
        return $this->type;
    }

        // Teacher setter getter
    function setTeacher($teacher){
        $this->teacher = intval($teacher);
    }
    function getTeacher(){
        return $this->teacher;
    }

        // Class setter getter
    function setClass($class){
        $this->class = intval($class);
    }
    function getClass(){
        return $this->class;
    }

        // Period setter getter
    function setPeriod($period){
        $this->period = intval($period);
    }
    function getPeriod(){
        return $this->period;
    }

        // day setter getter
    function setDays($days){
        $this->days = $days;
    }
    function getDays(){
        return $this->days;
    }

        // Start Time setter getter
    function setStartTime($start_time){
        $this->start_time = $start_time;
    }
    function getStartTime(){
        return $this->start_time;
    }

        // End Time setter getter
    function setEndTime($end_time){
        $this->end_time = $end_time;
    }
    function getEndTime(){
        return $this->end_time;
    }

        // Start Date setter getter
    function setStartDate($start_date){
        $this->start_date = strtotime($start_date);
    }
    function getStartDate(){
        return $this->start_date;
    }

        // End Date setter getter
    function setEndDate($end_date){
        $this->end_date = strtotime($end_date);
    }
    function getEndDate(){
        return $this->end_date;
    }

       // Chain Function Setter Getter
    function setChainFunction($chainFunction){
        $this->chainFunction = $chainFunction;
    }       
    function getChainFunction(){
        return $this->chainFunction;
    }

    /* Setter getter for all variables */

      // Setting all the data days
    public function setData($data = ''){
        if (isset($data['id'])){
            $this->setId($data['id']);
        }
        else{
            $this->setId('');   
        }
        if (isset($data['number'])){
            $this->setNumber($data['number']);
        }
        if (isset($data['type'])){
            $this->setType($data['type']);
        }
        if(isset($data['teacher'])){
            $this->setTeacher($data['teacher']);
        }
        if(isset($data['classroom'])){
            $this->setClass($data['classroom']);
        }
        if(isset($data['days'])){
            $this->setDays($data['days']);
        }
        if(isset($data['period'])){
            $this->setPeriod($data['period']);
        }
        if(isset($data['start_time'])){
            $this->setStartTime($data['start_time']);
        }
        if(isset($data['end_time'])){
            $this->setEndTime($data['end_time']);
        }
        if(isset($data['start_date'])){
            $this->setStartDate($data['start_date']);
        }
        if(isset($data['end_date'])){
            $this->setEndDate($data['end_date']);
        }
        return $this;
    }

            // Function for showing Batches
    public function allBatches() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM  batches_view');  
        $query->execute();
        $data=$query->fetchAll();
        return $data;
    }

        // Function for getting Batch Data
    public function allBatchData() {
        $pdo = Database::getInstance();
        $typeQuery = $pdo->prepare("SELECT * FROM batch_types_view");  
        $typeQuery->execute();
        $types= $typeQuery->fetchAll();
        $daysQuery = $pdo->prepare("SELECT * FROM days_in_week");  
        $daysQuery->execute();
        $days = $daysQuery->fetchAll();
        $periodQuery = $pdo->prepare("SELECT * FROM batch_periods_view");  
        $periodQuery->execute();
        $periods = $periodQuery->fetchAll();
        if($types && $days && $periods){
            return array("types"=>$types, "days"=>$days, "periods"=>$periods);  
        } 
    }

        // Get teachers and classes
    public function getTeachersAndClasses() {
        $pdo = Database::getInstance();
        $teacherQuery = $pdo->prepare("SELECT * FROM users_view WHERE designation LIKE CONCAT('%', 'teacher', '%') OR designation LIKE CONCAT('%', 'instructor', '%') ORDER BY create_date DESC");  
        $teacherQuery->execute();
        $teachers= $teacherQuery->fetchAll();
        $classQuery = $pdo->prepare("SELECT * FROM classes_view");  
        $classQuery->execute();
        $classes= $classQuery->fetchAll();
        $currentBatchQuery = $pdo->prepare('SELECT * FROM batches_view WHERE id = :id');  
        $currentBatchQuery->execute(array(':id' => $this->getId()));
        $currentBatchDetails=$currentBatchQuery->fetchAll();
        foreach($currentBatchDetails as $batch){
            $startTime = strtotime($batch['start_time']);
            $endTime = strtotime($batch['end_time']);
            $startDate = $batch['start_date'];
            $endDate = $batch['end_date'];
        }
        $findDays = $pdo->prepare('SELECT * from batch_days_view WHERE batch = :id');  
        $findDays->execute(array(':id' => $this->getId()));
        $days=$findDays->fetchAll();
        foreach($days as $day){
            $currentBatchInfo[] = array('day'=> $day['day_id'], 'batch'=>$this->getId(), 'start_time'=>$startTime, 'end_time'=>$endTime, 'start_date'=>$startDate, 'end_date'=>$endDate);
        }
        $batchdetailedQuery = $pdo->prepare('SELECT * FROM batches_detailed_view WHERE id != :id');
        $batchdetailedQuery->execute(array(':id' => $this->getId()));
        $batchDetails=$batchdetailedQuery->fetchAll();
        if($batchDetails){
            foreach($batchDetails as $batch){
                $findDays = $pdo->prepare('SELECT * from batch_days_view WHERE batch = :id');  
                $findDays->execute(array(':id' => $batch['id']));
                $days=$findDays->fetchAll();
                foreach($days as $day){
                    $batchDetailedInfo[] = array('day'=> $day['day_id'], 'batch'=> $batch['id'], 'teacher' => $batch['teacher_id'], 'class' => $batch['class_id'], 'start_time'=> strtotime($batch['start_time']), 'end_time'=>strtotime($batch['end_time']), 'start_date'=>$batch['start_date'], 'end_date'=>$batch['end_date']);
                }
            }
            foreach ($batchDetailedInfo as $batchDetail) {
                foreach($currentBatchInfo as $currentBatch){
                    if($currentBatch['start_date'] < $batchDetail['start_date'] && $currentBatch['end_date'] > $batchDetail['start_date'] || $currentBatch['end_date'] > $batchDetail['end_date'] && $currentBatch['start_date'] < $batchDetail['end_date'] || $currentBatch['start_date'] >= $batchDetail['start_date'] && $currentBatch['end_date'] <= $batchDetail['end_date']){
                        if($currentBatch['day'] == $batchDetail['day']){
                            if($currentBatch['start_time'] < $batchDetail['start_time'] && $currentBatch['end_time'] > $batchDetail['start_time'] || $currentBatch['end_time'] > $batchDetail['end_time'] && $currentBatch['start_time'] < $batchDetail['end_time'] || $currentBatch['start_time'] >= $batchDetail['start_time'] && $currentBatch['end_time'] <= $batchDetail['end_time']){
                                $assignedTeachers[] = $batchDetail['teacher'];
                                $assignedClasses[] = $batchDetail['class'];    
                            }
                        }
                    }
                }
            }
        }
        if(!empty($assignedTeachers) && !empty($assignedClasses)){
            foreach ($teachers as $teacher) {
                if(!in_array($teacher['id'], $assignedTeachers)){
                    $availableTeachers[] = array('id'=>$teacher['id'], 'family_name'=>$teacher['family_name'], 'given_name'=>$teacher['given_name']);
                }
            }
            foreach ($classes as $class) {
                if(!in_array($class['id'], $assignedClasses)){
                    $availableClasses[] = array('id'=>$class['id'], 'name'=>$class['name']);
                }
            }
            if(!empty($availableTeachers) && !empty($availableClasses)){
                return array("batch"=>$currentBatchDetails, "teachers"=>$availableTeachers, "classes"=>$availableClasses);  
            }
        }
        else{
            if(!empty($teachers) && !empty($classes)){
                return array("batch"=>$currentBatchDetails, "teachers"=>$teachers, "classes"=>$classes);  
            }
        }
    }

        // Check batch availability
    public function checkBatchAvailability(){
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM  batches_view WHERE type_id = :type AND batch_number = :batch_number AND id != :id');  
        $find->execute(array(':id' => $this->getId(), ':type' => $this->getType(), ':batch_number' => $this->getNumber()));
        $total = $find->rowCount();
        if($total == 0){
            return TRUE;
        }
    }

        // Function for searching by batch period
    public function searchByPeriod() {
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM  batches_view WHERE period_id = :period');  
        $find->execute(array(':period' => $this->getPeriod()));
        $data = $find->fetchAll();
        return $data;
    }

        // Function for searching by batch type
    public function searchByType() {
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM  batches_view WHERE type_id = :type');  
        $find->execute(array(':type' => $this->getType()));
        $data = $find->fetchAll();
        return $data;
    }

        // Function for searching by batch classroom
    public function searchByClassroom() {
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM  batches_view WHERE class = :class');  
        $find->execute(array(':class' => $this->getClass()));
        $data = $find->fetchAll();
        return $data;
    }

        // Function for storing Batch Types
    public function storeBatch() {
        if(!empty($this->getNumber()) && !empty($this->getStartTime()) && !empty($this->getEndTime()) && !empty($this->getStartDate()) && !empty($this->getEndDate())){
            if($this->checkBatchAvailability()){
                $pdo = Database::getInstance();
                $query = $pdo->prepare('INSERT INTO batches (batch_number, type, teacher, period, class, start_time, end_time, start_date, end_date) VALUES (:batch_number, :type, :teacher, :period, :class, :start_time, :end_time, :start_date, :end_date)');        
                $query->execute(array(':batch_number'=>$this->getNumber(), ':type'=>$this->getType(), ':teacher'=>$this->getTeacher(), ':period'=>$this->getPeriod(), ':class'=>$this->getClass(), ':start_time'=>$this->getStartTime(), ':end_time'=>$this->getEndTime(), ':start_date'=>$this->getStartDate(), ':end_date'=>$this->getEndDate()));
                $find = $pdo->prepare('SELECT max(id) as id FROM  batches');
                $find->execute();
                $lastId=$find->fetchAll();
                if($lastId){
                    $this->setId($lastId['0']['id']);
                    $this->setChainFunction('continue');
                } 
            } 
        }
        return $this;   
    }

        // Function for Editing Batch Types
    public function findBatch($action="view") {
        $pdo = Database::getInstance();
        $check = $pdo->prepare('SELECT * FROM batches_view WHERE id = :id');  
        $check->execute(array(':id' => $this->getId()));
        $checkData=$check->fetchAll();
        $findDays = $pdo->prepare('SELECT * from batch_days_view WHERE batch = :id');  
        $findDays->execute(array(':id' => $this->getId()));
        $days=$findDays->fetchAll();
        foreach($days as $day){
            $day_ids[] = $day['day_id'];
        }
        if($action!="view"){
            $checkData['0']['days'] = $days;
            $checkData['0']['day_ids'] = $day_ids;
            return $checkData;                  
        }
        else{
            foreach($checkData as $data){
                if(!empty($data['teacher']) && !empty($data['class'])){
                    $findBatch = $pdo->prepare('SELECT * FROM batches_detailed_view WHERE id = :id');  
                    $findBatch->execute(array(':id' => $this->getId()));
                    $batch=$findBatch->fetchAll();                            
                    $batch['0']['days'] = $days;
                    $batch['0']['day_ids'] = $day_ids;
                    return $batch;
                }
            } 
        }
    }

        // Assign Teacher and Clasroom
    public function assignTeacherAndClassroom() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE batches SET teacher = :teacher, class = :class WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':teacher' => $this->getTeacher(), ':class' => $this->getClass()));
        return $status;
    }

        // Function for editing batch days
    public function updateBatchDay() {
        if($this->getChainFunction() == 'continue'){
            $pdo = Database::getInstance();
            $deleteQuery = $pdo->prepare('DELETE FROM batch_days WHERE batch = :id');
            $deleteQuery->execute(array('id' => $this->getId()));
            for ($i = 0; $i < count($this->getDays()); $i++) {
                $query = $pdo->prepare('INSERT INTO batch_days (batch, weekday) VALUES (:batch, :day)');        
                $query->execute(array(':batch'=>$this->getId(), ':day'=>$this->getDays()[$i]));
            }
            return $this->getId();
        }
    }


        // Function for Unassigning Teacher and Classroom
    public function unassignTeacherClassroom() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE batches SET teacher = NULL, class = NULL WHERE id = :id');        
        $query->execute(array(':id'=> $this->getId())); 
        return $this; 
    }

        // Function for Editing Batch
    public function updateBatch() {
        if(!empty($this->getNumber()) && !empty($this->getStartTime()) && !empty($this->getEndTime()) && !empty($this->getStartDate()) && !empty($this->getEndDate())){
            if($this->checkBatchAvailability()){
                $pdo = Database::getInstance();
                $query = $pdo->prepare('UPDATE batches SET batch_number = :batch_number, type = :type, period = :period, start_time = :start_time, end_time = :end_time, start_date = :start_date, end_date = :end_date WHERE id = :id');        
                $status = $query->execute(array(':id'=> $this->getId(), ':batch_number'=>$this->getNumber(), ':type'=>$this->getType(), ':period'=>$this->getPeriod(), ':start_time'=>$this->getStartTime(), ':end_time'=>$this->getEndTime(), ':start_date'=>$this->getStartDate(), ':end_date'=>$this->getEndDate()));
                if($status){
                    $this->setChainFunction('continue');
                }
            } 
        }
        return $this; 
    }

        // Function for Editing Batch Types
    public function deleteBatch() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE batches SET delete_date = :delete_date WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':delete_date' => time()));
        return $status;
    }

}

?>