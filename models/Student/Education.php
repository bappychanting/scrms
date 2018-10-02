<?php

namespace App\Student;
use App\Database\Database;
use App\User\Notification;

class Education extends Student{

    private $institude;
    private $degree;
    private $study_status;

      // Institude setter getter
    function setInstitude($institude){
      $this->institude = $institude;
    }
    function getInstitude(){
        return $this->institude;
    }

      // Degree setter getter
    function setDegree($degree){
      $this->degree = $degree;
    }
    function getDegree(){
        return $this->degree;
    }

      // Study Status setter getter
    function setStudyStatus($study_status){
      $this->study_status = $study_status;
    }
    function getStudyStatus(){
        return $this->study_status;
    }

      // Setting all the Education data
    public function setEducationData($data = ''){
      if (isset($data['id'])){
        $this->setId($data['id']);
      }
      else{
        $this->setId('');
      }
      if (isset($data['uname'])){
          $this->setUsername($data['uname']);
      }
      if(isset($data['institude'])){
          $this->setInstitude($data['institude']);
      }
      if(isset($data['degree'])){
          $this->setDegree($data['degree']);
      }
      if(isset($data['address'])){
          $this->setPermanentAddress($data['address']);
      }
      if(isset($data['start_date'])){
          $this->setStartDate($data['start_date']);
      }
      if(isset($data['end_date'])){
          $this->setEndDate($data['end_date']);
      }
      if (isset($data['study_status'])){
          $this->setStudyStatus($data['study_status']);
      }
      return $this;
    }


        /* get initial education data */
    public function getInitialStudentEducationData(){
      $studentData = $this->getInitialStudentData();
      if($studentData){
        $degrees = $this->degrees();
        if($degrees){
          $studentData['degrees'] = $degrees;
          return $studentData;
        }
      }
    }

        /* get initial education data */
    public function getStudentStudyStatus(){
      $study_status = "<b><span class='col-red'>Not addressed!</a></span></b>";
      $studentData = $this->getInitialStudentData();
      if($studentData){
        foreach ($studentData['student'] as $student) {
          foreach ($studentData['study_statuses'] as $status) {
            if($status['id'] == $student['study_status']){
               $study_status = $status['name'];
            }
          }
        }
      }
      return $study_status;
    }


        /* Function for checking educational record */
    private function checkEducationalRecord(){
        $pdo = Database::getInstance();
        $degrees = $this->degrees();
        if ($this->getDegree() < count($degrees) - 1){
          $query = $pdo->prepare("SELECT * FROM education_record_view WHERE id != :id AND user_id = :user_id AND (degree = :degree OR (:start_date BETWEEN start_date AND end_date) OR (:end_date BETWEEN start_date AND end_date) OR (:start_date < start_date AND :end_date > end_date))");
          $query->execute(array(':id' => $this->getID(), ':user_id'=> $this->findUserID(), ':degree' => $this->getDegree(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
        } 
        else{
          $query = $pdo->prepare("SELECT * FROM education_record_view WHERE id != :id AND user_id = :user_id AND ((:start_date BETWEEN start_date AND end_date) OR (:end_date BETWEEN start_date AND end_date) OR (:start_date < start_date AND :end_date > end_date))");
          $query->execute(array(':id' => $this->getID(), ':user_id'=> $this->findUserID(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
        }
        $total=$query->rowCount();
        if($total == 0){
          return TRUE;
        }
    }

        /* Function for storing education record */
    public function storeEducationalRecord(){
        if(!empty($this->getInstitude()) && !empty($this->getPermanentAddress()) && !empty($this->getStartDate()) && !empty($this->getEndDate())){
          $checkEducationalRecord = $this->checkEducationalRecord();
          if($checkEducationalRecord){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('INSERT INTO education_record (user_id, institude, degree, address, start_date, end_date) VALUES (:id, :institude, :degree, :address, :start_date, :end_date)');
            $status = $query->execute(array(':id'=> $this->findUserID(), ':institude' => $this->getInstitude(), ':degree' => $this->getDegree(), ':address' => $this->getPermanentAddress(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
            Notification::updateStudent($this->findUserID(), $this->getUsername());
            return $status;
          }
        }
    }

      /* Function for finding education record */
    public function findEducationalRecord(){
        $pdo = Database::getInstance();
        $degrees = $this->degrees();
        $query = $pdo->prepare('SELECT * FROM education_record_view WHERE id = :id AND user_id = :user_id');
        $query->execute(array(':id'=> $this->getID(), ':user_id'=>$this->findUserID()));
        $record = $query->fetchAll();
        return array('record' => $record, 'degrees' => $degrees);
    }

        /* Function for updating education record */
    public function updateEducationalRecord(){
        if(!empty($this->getInstitude()) && !empty($this->getPermanentAddress()) && !empty($this->getStartDate()) && !empty($this->getEndDate())){
          $checkEducationalRecord = $this->checkEducationalRecord();
          if($checkEducationalRecord){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('UPDATE education_record SET institude = :institude, address = :address, degree = :degree, start_date = :start_date, end_date = :end_date WHERE id = :id');
            $status = $query->execute(array(':id'=> $this->getID(), ':institude' => $this->getInstitude(), ':degree' => $this->getDegree(), ':address' => $this->getPermanentAddress(), ':start_date' => $this->getStartDate(), ':end_date' => $this->getEndDate()));
            Notification::updateStudent($this->findUserID(), $this->getUsername());
            return $status;
          }
        }
    }

        /* Function for updating study status */
    public function updateStudyStatus(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('UPDATE students SET study_status = :study_status WHERE user_id = :id');
      $status = $query->execute(array(':id'=> $this->findUserID(), ':study_status' => $this->getStudyStatus()));
      Notification::updateStudent($this->findUserID(), $this->getUsername());
      return $status;
    }

        /* Function for deleting education record */
    public function deleteEducationalRecord(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('UPDATE education_record SET delete_date = :delete_date WHERE id = :id AND user_id = :user_id');
      $status = $query->execute(array(':id'=> $this->getID(), ':user_id'=>$this->findUserID(), ':delete_date' => time()));
      if($status){ 
        Notification::updateStudent($this->findUserID(), $this->getUsername()); 
        return $this->getUsername(); 
      }
    }

}


?>