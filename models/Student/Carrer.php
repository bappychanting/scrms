<?php

namespace App\Student;
use App\Database\Database;
use App\User\Notification;

class Carrer extends Student{

    private $organization;
    private $occupation;

      // Organization setter getter
    function setOrganization($organization){
      $this->organization = $organization;
    }
    function getOrganization(){
        return $this->organization;
    }

      // Occupation setter getter
    function setOccupation($occupation){
      $this->occupation = $occupation;
    }
    function getOccupation(){
        return $this->occupation;
    }

      // Setting all the Carrer data
    public function setCarrerData($data = ''){
      if (isset($data['id'])){
        $this->setId($data['id']);
      }
      else{
        $this->setId('');
      }
      if (isset($data['uname'])){
          $this->setUsername($data['uname']);
      }
      if(isset($data['organization'])){
          $this->setOrganization($data['organization']);
      }
      if(isset($data['address'])){
          $this->setPermanentAddress($data['address']);
      }
      if(isset($data['occupation'])){
          $this->setOccupation($data['occupation']);
      }
      if(isset($data['start_date'])){
          $this->setStartDate($data['start_date']);
      }
      if(isset($data['end_date'])){
          $this->setEndDate($data['end_date']);
      }
      return $this;
    }


        /* Function for checking carrer record */
    private function checkCarrerRecord(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM student_carrer_records_view WHERE id != :id AND user_id = :user_id AND ((:start_date BETWEEN start_date AND end_date) OR (:end_date BETWEEN start_date AND end_date) OR (:start_date < start_date AND :end_date > end_date))");
      $query->execute(array(':id' => $this->getID(), ':user_id'=> $this->findUserID(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
      $total=$query->rowCount();
      if($total == 0){
        return TRUE;
      }
    }

        /* Function for storing carrer record */
    public function storeCarrerRecord(){
      if(!empty($this->getOrganization()) && !empty($this->getPermanentAddress()) && !empty($this->getOccupation()) && !empty($this->getStartDate()) && !empty($this->getEndDate())){
          $checkCarrerRecord = $this->checkCarrerRecord();
          if($checkCarrerRecord){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('INSERT INTO student_carrer_records (user_id, organization, address, occupation, start_date, end_date) VALUES (:id, :organization, :address, :occupation, :start_date, :end_date)');
            $status = $query->execute(array(':id'=> $this->findUserID(), ':organization' => $this->getOrganization(), ':address' => $this->getPermanentAddress(), ':occupation' => $this->getOccupation(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
            Notification::updateStudent($this->findUserID(), $this->getUsername());
            return $status;
          }
      }
    }

      /* Function for finding carrer record */
    public function findCarrerRecord(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM student_carrer_records_view WHERE id = :id AND user_id = :user_id');
        $query->execute(array(':id'=> $this->getID(), ':user_id'=>$this->findUserID()));
        $record = $query->fetchAll();
        return $record;
    }

        /* Function for updating carrer record */
    public function updateCarrerRecord(){
        if(!empty($this->getOrganization()) && !empty($this->getPermanentAddress()) && !empty($this->getOccupation()) && !empty($this->getStartDate()) && !empty($this->getEndDate())){
            $checkCarrerRecord = $this->checkCarrerRecord();
            if($checkCarrerRecord){
              $pdo = Database::getInstance();
              $query = $pdo->prepare('UPDATE student_carrer_records SET organization = :organization, address = :address, occupation = :occupation, start_date = :start_date, end_date = :end_date WHERE id = :id');
              $status = $query->execute(array(':id'=> $this->getID(), ':organization' => $this->getOrganization(), ':address' => $this->getPermanentAddress(), ':occupation' => $this->getOccupation(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
              Notification::updateStudent($this->findUserID(), $this->getUsername());
              return $status;
            }
        }
    }

        /* Function for deleting carrer record */
    public function deleteCarrerRecord(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('UPDATE student_carrer_records SET delete_date = :delete_date WHERE id = :id AND user_id = :user_id');
      $status = $query->execute(array(':id'=> $this->getID(), ':user_id'=>$this->findUserID(), ':delete_date' => time()));
      if($status){ 
        Notification::updateStudent($this->findUserID(), $this->getUsername());
        return $this->getUsername(); 
      }
    }

}


?>