<?php

namespace App\Student;
use App\Database\Database;
use App\User\Notification;

class Entry extends Student{

    private $residence_status;
    private $entry_purpose;

      // Institude setter getter
    function setResidenceStatus($residence_status){
      $this->residence_status = $residence_status;
    }
    function getResidenceStatus(){
        return $this->residence_status;
    }

      // Degree setter getter
    function setEntryPurpose($entry_purpose){
      $this->entry_purpose = $entry_purpose;
    }
    function getEntryPurpose(){
        return $this->entry_purpose;
    }

      // Setting all the Past Entry data
    public function setEntryData($data = ''){
      if (isset($data['id'])){
        $this->setId($data['id']);
      }
      else{
        $this->setId('');
      }
      if (isset($data['uname'])){
          $this->setUsername($data['uname']);
      }
      if (isset($data['residence_status'])){
          $this->setResidenceStatus($data['residence_status']);
      }
      if (isset($data['entry_purpose'])){
          $this->setEntryPurpose($data['entry_purpose']);
      }
      if(isset($data['start_date'])){
          $this->setStartDate($data['start_date']);
      }
      if(isset($data['end_date'])){
          $this->setEndDate($data['end_date']);
      }
      return $this;
    }


        // Function for finding Past Entry
    public function findPastEntry() {
      $pdo = Database::getInstance();
      $query = $pdo->prepare('SELECT * FROM student_past_entry_view WHERE id = :id AND user_id = :userId');  
      $query->execute(array(':id' => $this->getID(), ':userId' => $this->findUserID()));
      $data=$query->fetchAll();
      return $data;
    }

        /* Function for checking past entry */
    private function checkPastEntry(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM student_past_entry_view WHERE id != :id AND user_id = :user_id AND ((:start_date BETWEEN start_date AND end_date) OR (:end_date BETWEEN start_date AND end_date) OR (:start_date < start_date AND :end_date > end_date))");
      $query->execute(array(':id' => $this->getID(), ':user_id'=> $this->findUserID(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
      $total=$query->rowCount();
      if($total == 0 && $this->getStartDate() < time() && $this->getEndDate() < time()){
        return TRUE;
      }
    }

            /* Function for storing past entry */
    public function storePastEntry(){
        if(!empty($this->getResidenceStatus()) && !empty($this->getEntryPurpose()) && !empty($this->getStartDate()) && !empty($this->getEndDate())){
            $checkPastEntry = $this->checkPastEntry();
            if($checkPastEntry){
              $pdo = Database::getInstance();
              $query = $pdo->prepare('INSERT INTO student_past_entry (user_id, residence_status, entry_purpose, start_date, end_date) VALUES (:id, :residence_status, :entry_purpose, :start_date, :end_date)');
              $status = $query->execute(array(':id'=> $this->findUserID(), ':residence_status' => $this->getResidenceStatus(), ':entry_purpose' => $this->getEntryPurpose(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
              Notification::updateStudent($this->findUserID(), $this->getUsername()); 
              return $status;
            }
        }
    }

        /* Function for updating past entry */
    public function updatePastEntry(){
        if(!empty($this->getResidenceStatus()) && !empty($this->getEntryPurpose()) && !empty($this->getStartDate()) && !empty($this->getEndDate())){
          $checkPastEntry = $this->checkPastEntry();
          if($checkPastEntry){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('UPDATE student_past_entry SET residence_status = :residence_status, entry_purpose = :entry_purpose, start_date = :start_date, end_date = :end_date WHERE id = :id');
            $status = $query->execute(array(':id'=> $this->getID(),  ':residence_status' => $this->getResidenceStatus(), ':entry_purpose' => $this->getEntryPurpose(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
            Notification::updateStudent($this->findUserID(), $this->getUsername()); 
            return $status;
          }
        }
    }

        /* Function for deleting past entry */
    public function deletePastEntry(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('UPDATE student_past_entry SET delete_date = :delete_date WHERE id = :id AND user_id = :user_id');
      $status = $query->execute(array(':id'=> $this->getID(), ':user_id'=>$this->findUserID(), ':delete_date' => time()));
      if($status){ 
        Notification::updateStudent($this->findUserID(), $this->getUsername()); 
        return $this->getUsername(); 
      }
    }

}


?>