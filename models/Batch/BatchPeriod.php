<?php

namespace App\Batch;
use App\Database\Database;

Class BatchPeriod{

    private $id;
    private $period;
    private $startTime;
    private $expandStartTime;
    private $endTime;
    private $exapndEndTime;
    private $chainFunction;

    /* Setter getter for all variables */

        // ID setter getter
    function setId($id){
        $this->id = intval($id);
    }
    function getId(){
        return $this->id;
    }

        // Type setter getter
    function setPeriod($period){
       $this->period = ucwords($period);
    }
    function getPeriod(){
        return $this->period;
    }

    	// Start Time Setter Getter
    function setStartTime($startTime){
        $this->startTime = $startTime;
    }	    
    function getStartTime(){
        return $this->startTime;
    }

        // Start Time Exapnd Setter Getter
    function setExpandStartTime($expandStartTime){
        $this->expandStartTime = intval($expandStartTime);
    }       
    function getExpandStartTime(){
        return $this->expandStartTime;
    }

        // End Time Setter Getter
    function setEndTime($endTime){
        $this->endTime = $endTime;
    }       
    function getEndTime(){
        return $this->endTime;
    }

       // End Time Exapnd Setter Getter
    function setExpandEndTime($exapndEndTime){
        $this->exapndEndTime = intval($exapndEndTime);
    }       
    function getExpandEndTime(){
        return $this->exapndEndTime;
    }

       // Chain Function Setter Getter
    function setChainFunction($chainFunction){
        $this->chainFunction = $chainFunction;
    }       
    function getChainFunction(){
        return $this->chainFunction;
    }

    /* Setter getter for all variables */

      // Setting all the data
    public function setData($data = ''){
		if (isset($data['id'])){
			$this->setId($data['id']);
		}
        else{
            $this->setId(0);
        }
		if (isset($data['period'])){
			$this->setPeriod($data['period']);
		}
		if(isset($data['start_time'])){
			$this->setStartTime($data['start_time']);
		}
        if(isset($data['expandStartTime'])){
            $this->setExpandStartTime($data['expandStartTime']);
        }
        else{
            $this->setExpandStartTime(0);    
        }
        if(isset($data['end_time'])){
            $this->setEndTime($data['end_time']);
        }
        if(isset($data['exapndEndTime'])){
            $this->setExpandEndTime($data['exapndEndTime']);
        }
        else{
            $this->setExpandEndTime(0);
        }
      	return $this;
    }

    	// Function for showing Batch Periods
    public function allBatchPeriods() {
		$pdo = Database::getInstance();
		$query = $pdo->prepare('SELECT * FROM batch_periods_view');  
		$query->execute();
		$data=$query->fetchAll();
		return $data;
    }

        // Function for showing Batch Periods
    public function checkPeriodName() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM batch_periods_view WHERE period = :period AND id != :id');  
        $query->execute(array(':id'=> $this->getId(), ':period'=>$this->getPeriod()));
        $total = $query->rowCount();
        if($total == 0 && $this->getPeriod() != 'Xpunged'){
            return TRUE;
        }
    }

        // Function for showing Batch Periods
    public function checkPeriodTime() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM batch_periods_view WHERE id != :id');  
        $query->execute(array(':id'=>$this->getId()));
        $periods = $query->fetchAll();
        foreach($periods as $period){
            if(strtotime($this->getStartTime()) < strtotime($period['start_time']) && strtotime($this->getEndTime()) > strtotime($period['start_time']) || strtotime($this->getEndTime()) > strtotime($period['end_time']) && strtotime($this->getStartTime()) < strtotime($period['end_time']) || strtotime($this->getStartTime()) >= strtotime($period['start_time']) && strtotime($this->getEndTime()) <= strtotime($period['end_time'])){
                return FALSE;
            }
        }
        return TRUE;  
    }

    	// Function for storing Batch Period
    public function storeBatchPeriod() {   
        if(!empty($this->getPeriod()) && !empty($this->getStartTime()) && !empty($this->getEndTime())){
           if($this->checkPeriodName() && $this->checkPeriodTime()){
                $pdo = Database::getInstance();
                $query = $pdo->prepare('INSERT INTO batch_periods (period, start_time, expand_start_Time, end_time, expand_end_time) VALUES (:period, :start_time, :expandStartTime, :end_time, :expandEndTime)');        
                $status = $query->execute(array(':period'=>$this->getPeriod(), ':start_time'=>$this->getStartTime(), ':expandStartTime'=>$this->getExpandStartTime(), ':end_time'=>$this->getEndTime(), ':expandEndTime'=>$this->getExpandEndTime()));
                if($status){
                    $find = $pdo->prepare('SELECT max(id) as id FROM  batch_periods');
                    $find->execute();
                    $lastId=$find->fetchAll();
                    if($lastId){
                        $this->setId($lastId['0']['id']);
                        $this->setChainFunction('continue');
                    } 
                }
            }
        }
        return $this;
    }

        // Function for updating batch periods
    public function updatePeriodOfBatches() {
        if($this->getChainFunction() == 'continue'){
            $startTime = strtotime($this->getStartTime()) - $this->getExpandStartTime()* 60;
            $endTime = strtotime($this->getEndTime()) + $this->getExpandEndTime()* 60;
            $pdo = Database::getInstance();
            $query = $pdo->prepare('SELECT * FROM batches_view');  
            $query->execute();
            $data = $query->fetchAll();
            foreach($data as $batch){
                if(strtotime($batch['start_time']) >= $startTime && strtotime($batch['end_time']) <= $endTime){
                    $query = $pdo->prepare('UPDATE batches SET period = :period WHERE id = :id');  
                    $query->execute(array(':id'=>$batch['id'], ':period' => $this->getId()));
                }
            }
            return $this->getId();   
        }
    }

        // Function for finding Batch Period
    public function findBatchPeriod() {
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM batch_periods WHERE id = :id');  
        $find->execute(array(':id' => $this->getId()));
        $data=$find->fetchAll();
        return $data;
    }

    	// Function for Editing Batch Period
    public function updateBatchPeriod() {
        if(!empty($this->getPeriod()) && !empty($this->getStartTime()) && !empty($this->getEndTime())){
            if($this->checkPeriodName() && $this->checkPeriodTime()){
                $pdo = Database::getInstance();
                $query = $pdo->prepare('UPDATE batch_periods SET period = :period, start_time = :start_time, expand_start_Time = :expand_start_Time, end_time = :end_time, expand_end_time = :expand_end_time WHERE id = :id');        
                $status = $query->execute(array(':id'=>$this->getId(), ':period'=>$this->getPeriod(), ':start_time'=>$this->getStartTime(), ':expand_start_Time'=>$this->getExpandStartTime(), ':end_time'=>$this->getEndTime(), ':expand_end_time'=>$this->getExpandEndTime()));
                if($status){
                    $this->setChainFunction('continue');
                }
            } 
        }
        return $this;
    }

    	// Function for deleting Batch Period
    public function deleteBatchPeriod() {   
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE batch_periods SET period = :period, delete_date = :delete_date WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':period' => 'Xpunged', ':delete_date' => time()));
        return $status;
    }
}
?>