<?php

namespace App\Student;
use App\Database\Database;

class Family extends Student{

    private $occupation;
    private $residence_with_student;
    private $school_employment;
    private $residence_card_status;
    private $residence_card_number;

      // Occupation setter getter
    function setOccupation($occupation){
      $this->occupation = $occupation;
    }
    function getOccupation(){
        return $this->occupation;
    }

      // Residence With Student Status setter getter
    function setResidenceWithStudent($residence_with_student){
      $this->residence_with_student = $residence_with_student;
    }
    function getResidenceWithStudent(){
        return $this->residence_with_student;
    }

      // School Employment Status setter getter
    function setSchoolEmployment($school_employment){
      $this->school_employment = $school_employment;
    }
    function getSchoolEmployment(){
        return $this->school_employment;
    }

      // Residence Card Status setter getter
    function setResidenceCardStatus($residence_card_status){
      $this->residence_card_status = $residence_card_status;
    }
    function getResidenceCardStatus(){
        return $this->residence_card_status;
    }

      // Residence With Student Status setter getter
    function setResidenceCardNumber($residence_card_number){
      $this->residence_card_number = $residence_card_number;
    }
    function getResidenceCardNumber(){
        return $this->residence_card_number;
    }

      // Setting all the Education data
    public function setFamilyData($data = ''){
      if (isset($data['id'])){
        $this->setId($data['id']);
      }
      else{
        $this->setId('');
      }
      if(isset($data['uname'])){
          $this->setUsername($data['uname']);
      }
      if(isset($data['name'])){
          $this->setName($data['name']);
      }
      if(isset($data['relationship'])){
          $this->setRelationship($data['relationship']);
      }
      if(isset($data['dob'])){
          $this->setDateOfBirth($data['dob']);
      }
      if(isset($data['nationality'])){
          $this->setNationality($data['nationality']);
      }
      if(isset($data['occupation'])){
          $this->setOccupation($data['occupation']);
      }
      if(isset($data['presentAddress'])){
          $this->setPresentAddress($data['presentAddress']);
      }
      if(isset($data['permanentAddress'])){
          $this->setPermanentAddress($data['permanentAddress']);
      }
      if(isset($data['residence_with_applicant'])){
          $this->setResidenceWithStudent($data['residence_with_applicant']);
      }
      else{
        $this->setResidenceWithStudent('0');
      }
      if(isset($data['school_employment_place'])){
          $this->setSchoolEmployment($data['school_employment_place']);
      }
      else{
        $this->setSchoolEmployment('');
      }
      if(isset($data['residence_card_status'])){
          $this->setResidenceCardStatus($data['residence_card_status']);
      }
      else{
        $this->setResidenceCardStatus('');
      }
      if (isset($data['residence_card_number'])){
          $this->setResidenceCardNumber($data['residence_card_number']);
      }
      else{
        $this->setResidenceCardNumber('');
      }
      return $this;
    }


        /* Function for checking educational record */
    private function checkFamily(){
        $pdo = Database::getInstance();
        $relationshipQuery = $pdo->prepare("SELECT type FROM relationships WHERE id = :relationship");
        $relationshipQuery->execute(array(':relationship' => $this->getRelationship()));
        $relationship = $relationshipQuery->fetchAll();
        $type = $relationship['0']['type'];           
        $studentQuery = $pdo->prepare("SELECT * FROM student_family_view WHERE relationship = :relationship and user_id = :user_id and id != :id");
        $studentQuery->execute(array(':id' => $this->getId(), ':user_id'=> $this->findUserID(), ':relationship' => $this->getRelationship()));
        $total = $studentQuery->rowCount();
        if($type == 1 && $total > 0){
          return FALSE;
        }
        return TRUE;
    }

        /* Function for storing education record */
    public function storeFamily(){
        if(!empty($this->getName()) && !empty($this->getDateOfBirth()) && !empty($this->getNationality()) && !empty($this->getOccupation()) && !empty($this->getPresentAddress()) && !empty($this->getPermanentAddress())){
            $checkFamily = $this->checkFamily();
            if($checkFamily){
              $pdo = Database::getInstance();
              $query = $pdo->prepare('INSERT INTO student_family (user_id, relationship, name, dob, nationality, occupation, present_address, permanent_address, residence_with_applicant, school_employment_place, residence_card_status, residence_card_number) VALUES (:user_id, :relationship, :name, :dob, :nationality, :occupation, :present_address, :permanent_address, :residence_with_applicant, :school_employment_place, :residence_card_status, :residence_card_number)');
              $status = $query->execute(array(':user_id'=> $this->findUserID(), ':relationship' => $this->getRelationship(), ':name' => $this->getName(), ':dob' => $this->getDateOfBirth(), ':nationality' => $this->getNationality(), ':occupation' => $this->getOccupation(), ':present_address' => $this->getPresentAddress(), ':permanent_address' => $this->getPermanentAddress(), ':residence_with_applicant' => $this->getResidenceWithStudent(), ':school_employment_place' => $this->getSchoolEmployment(), ':residence_card_status' => $this->getResidenceCardStatus(), ':residence_card_number' => $this->getResidenceCardNumber()));
              return $status;
            }
        }
    }

      /* Function for finding family record */
    public function findFamilyMember(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('SELECT * FROM student_family_view WHERE id = :id AND user_id = :user_id');
      $query->execute(array(':id'=> $this->getId(), ':user_id'=>$this->findUserID()));
      $record = $query->fetchAll();
      $relationships = $this->getRelationships();
      if($record && $relationships){
        return array('record' => $record, 'relationships' => $relationships);
      }
    }

        /* Function for updating family member */
    public function updateFamilyMember(){
        if(!empty($this->getName()) && !empty($this->getDateOfBirth()) && !empty($this->getNationality()) && !empty($this->getOccupation()) && !empty($this->getPresentAddress()) && !empty($this->getPermanentAddress())){
          $checkFamily = $this->checkFamily();
            if($checkFamily){
              $pdo = Database::getInstance();
              $query = $pdo->prepare('UPDATE student_family SET relationship = :relationship, name = :name, dob = :dob, nationality = :nationality, occupation = :occupation, present_address = :present_address, permanent_address = :permanent_address, residence_with_applicant = :residence_with_applicant, school_employment_place = :school_employment_place, residence_card_status = :residence_card_status, residence_card_number = :residence_card_number WHERE id = :id');
               $status = $query->execute(array(':id'=> $this->getId(), ':relationship' => $this->getRelationship(), ':name' => $this->getName(), ':dob' => $this->getDateOfBirth(), ':nationality' => $this->getNationality(), ':occupation' => $this->getOccupation(), ':present_address' => $this->getPresentAddress(), ':permanent_address' => $this->getPermanentAddress(), ':residence_with_applicant' => $this->getResidenceWithStudent(), ':school_employment_place' => $this->getSchoolEmployment(), ':residence_card_status' => $this->getResidenceCardStatus(), ':residence_card_number' => $this->getResidenceCardNumber()));
              return $status;
            }
        }
    }

        /* Function for deleting family member */
    public function deleteFamilyMember(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('UPDATE student_family SET delete_date = :delete_date WHERE id = :id AND user_id = :user_id');
      $status = $query->execute(array(':id'=> $this->getId(), ':user_id'=>$this->findUserID(), ':delete_date' => time()));
      if($status){  
        return $this->getUsername(); 
      }
    }

}


?>