<?php

namespace App\Student;
use App\Database\Database;
use App\User\Notification;

class Language extends Student{

      // Setting all the Language data
    public function setLanguageData($data = ''){
      if (isset($data['id'])){
        $this->setId($data['id']);
      }
      else{
        $this->setId('');
      }
      if (isset($data['uname'])){
          $this->setUsername($data['uname']);
      }
      if(isset($data['start_date'])){
          $this->setStartDate($data['start_date']);
      }
      if(isset($data['end_date'])){
          $this->setEndDate($data['end_date']);
      }
      return $this;
    }


        // Function for updating language
    public function findLanguageRecord() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM student_language_certificates_view WHERE id = :id AND user_id = :userId');  
        $query->execute(array(':id' => $this->getID(), ':userId' => $this->findUserID()));
        $data=$query->fetchAll();
        return $data;
    }

        /* Function for checking carrer record */
    private function checkLanguageRecord(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT * FROM student_language_certificates_view WHERE id != :id AND user_id = :user_id AND ((:start_date BETWEEN start_date AND end_date) OR (:end_date BETWEEN start_date AND end_date) OR (:start_date < start_date AND :end_date > end_date))");
        $query->execute(array(':id' => $this->getID(), ':user_id'=> $this->findUserID(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
        $total=$query->rowCount();
        if($total == 0){
          return TRUE;
        }
    }

        // Function for updating language
    public function updateLanguage() {
        if(!empty($this->getStartDate()) && !empty($this->getEndDate())){
          $checkLanguageRecord = $this->checkLanguageRecord();
          if($checkLanguageRecord){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('UPDATE student_langauge_certificates SET start_date = :start_date, end_date = :end_date WHERE id = :id');
            $status = $query->execute(array(':id' => $this->getID(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
            return $status;
          }
        }
    }

}


?>