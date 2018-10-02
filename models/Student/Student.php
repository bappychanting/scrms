<?php

namespace App\Student;
use App\User\User;
use App\User\Notification;
use App\Database\Database;
use App\Batch\Batch;

Class Student extends User {
		
		/* Initial student data */

	private $fatherName;
	private $motherName;
	private $nationality;
	private $dob;
	private $sex;
	private $contact1;
	private $contact2;
	private $contact3;
	private $presentAddress;
	private $permanentAddress;
	private $passport_no;
	private $batch;
	private $roll;
	private $school_to_enroll;
	private $study_subject;
	private $study_plan_details;
	private $supporterName;
	private $relationship;
	private $supporterAddress;
	private $supporterContact;
	private $supporterIncome;
	private $supporterExpense;
	private $supporterMethodofPayment;
	private $supporterSupportOtherStudent;
	private $study_purpose;
	private $additional;
	private $start_date;
	private $end_date;

		/* Initial student data */

	  	/* Initial student setter getter */

	  // Father name setter getter
    function setFatherName($fatherName){
        $this->fatherName = ucwords($fatherName);
    }
    function getFatherName(){
        return $this->fatherName;
    }

      // Mother name setter getter
    function setMotherName($motherName){
      $this->motherName = ucwords($motherName);
    }
    function getMotherName(){
        return $this->motherName;
    }

      // Nationality name setter getter
    function setNationality($nationality){
      $this->nationality = ucwords($nationality);
    }
    function getNationality(){
        return $this->nationality;
    }

      // Date of Birth name setter getter
    function setDateOfBirth($dob){
      $minAge = strtotime('-18 years');
      if($minAge > strtotime($dob)){
      		$this->dob = strtotime($dob);	
      }
    }
    function getDateOfBirth(){
        return $this->dob;
    }

      // Sex name setter getter
    function setSex($sex){
      $this->sex = intval($sex);
    }
    function getSex(){
        return $this->sex;
    }

      // Personal Contact setter getter
    function setContact1($contact1){
      $this->contact1 = $contact1;
    }
    function getContact1(){
        return $this->contact1;
    }

      // Guardian Contact setter getter
    function setContact2($contact2){
      $this->contact2 = $contact2;
    }
    function getContact2(){
        return $this->contact2;
    }

      // Home Contact setter getter
    function setContact3($contact3){
      $this->contact3 = $contact3;
    }
    function getContact3(){
        return $this->contact3;
    }

      // Present Address setter getter
    function setPresentAddress($presentAddress){
      $this->presentAddress = $presentAddress;
    }
    function getPresentAddress(){
        return $this->presentAddress;
    }

      // Permanent Address setter getter
    function setPermanentAddress($permanentAddress){
      $this->permanentAddress = $permanentAddress;
    }
    function getPermanentAddress(){
        return $this->permanentAddress;
    }

      // Passport Number setter getter
    function setPassportNumber($passportNo){
      $this->passportNo = $passportNo;
    }
    function getPassportNumber(){
        return $this->passportNo;
    }

		// Batch setter getter
    function setBatch($batch){
        $this->batch = intval($batch);
    }
    function getBatch(){
        return $this->batch;
    }

    	// Student Roll setter getter
    function setRoll($roll){
        $this->roll = intval($roll);
    }
    function getRoll(){
        return $this->roll;
    }

    	// School Enrollment setter getter
    function setSchoolToEnroll($school_to_enroll){
        $this->school_to_enroll = $school_to_enroll;
    }
    function getSchoolToEnroll(){
        return $this->school_to_enroll;
    }

    	// Study subject setter getter
    function setStudySubject($study_subject){
        $this->study_subject = $study_subject;
    }
    function getStudySubject(){
        return $this->study_subject;
    }

    	// Study plan details setter getter
    function setStudyPlanDetails($study_plan_details){
        $this->study_plan_details = $study_plan_details;
    }
    function getStudyPlanDetails(){
        return $this->study_plan_details;
    }

    	// Supporter Name setter getter
    function setSupporterName($supporterName){
        $this->supporterName = $supporterName;
    }
    function getSupporterName(){
        return $this->supporterName;
    }

    	// Supporter Relation setter getter
    function setRelationship($relationship){
        $this->relationship = $relationship;
    }
    function getRelationship(){
        return $this->relationship;
    }

    	// Supporter Address setter getter
    function setSupporterAddress($supporterAddress){
        $this->supporterAddress = $supporterAddress;
    }
    function getSupporterAddress(){
        return $this->supporterAddress;
    }

    	// Supporter Contact setter getter
    function setSupporterContact($supporterContact){
        $this->supporterContact = $supporterContact;
    }
    function getSupporterContact(){
        return $this->supporterContact;
    }

    	// Supporter Income setter getter
    function setSupporterIncome($supporterIncome){
        $this->supporterIncome = $supporterIncome;
    }
    function getSupporterIncome(){
        return $this->supporterIncome;
    }

    	// Supporter Expense setter getter
    function setSupporterExpense($supporterExpense){
        $this->supporterExpense = $supporterExpense;
    }
    function getSupporterExpense(){
        return $this->supporterExpense;
    }

    	// Supporter Method of Payment setter getter
    function setSupporterMethodofPayment($supporterMethodofPayment){
        $this->supporterMethodofPayment = $supporterMethodofPayment;
    }
    function getSupporterMethodofPayment(){
        return $this->supporterMethodofPayment;
    }

    	// Supporter support other students setter getter
    function setSupportOtherStudent($supporterSupportOtherStudent){
        $this->supporterSupportOtherStudent = $supporterSupportOtherStudent;
    }
    function getSupportOtherStudent(){
        return $this->supporterSupportOtherStudent;
    }

      // Study Purpose setter getter
    function setStudyPurpose($study_purpose){
      $this->study_purpose = $study_purpose;
    }
    function getStudyPurpose(){
        return $this->study_purpose;
    }

      // Additional setter getter
    function setAdditional($additional){
      $this->additional = $additional;
    }
    function getAdditional(){
        return $this->additional;
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

    	/* Initial student setter getter */


	  // Setting all the student data
    public function setStudentData($data = ''){
        if (isset($data['uname'])){
            $this->setUsername($data['uname']);
        }
        if (isset($data['fatherName'])){
            $this->setFatherName($data['fatherName']);
        }
        if (isset($data['motherName'])){
            $this->setMotherName($data['motherName']);
        }
        if (isset($data['nationality'])){
            $this->setNationality($data['nationality']);
        }
        if(isset($data['dob'])){
            $this->setDateOfBirth($data['dob']);
        }
        if(isset($data['sex'])){
            $this->setSex($data['sex']);
        }
        if(isset($data['contact1'])){
            $this->setContact1($data['contact1']);
        }
        if(isset($data['contact2'])){
            $this->setContact2($data['contact2']);
        }
        if(isset($data['contact3'])){
            $this->setContact3($data['contact3']);
        }
        if(isset($data['presentAddress'])){
            $this->setPresentAddress($data['presentAddress']);
        }
        if(isset($data['permanentAddress'])){
            $this->setPermanentAddress($data['permanentAddress']);
        }
        if(isset($data['passport_no'])){
            $this->setPassportNumber($data['passport_no']);
        }
        if(isset($data['batch'])){
            $this->setBatch($data['batch']);
        }
        if(isset($data['roll'])){
            $this->setRoll($data['roll']);
        }
        if(isset($data['school_to_enroll'])){
            $this->setSchoolToEnroll($data['school_to_enroll']);
        }
        if(isset($data['study_subject'])){
            $this->setStudySubject($data['study_subject']);
        }
        if(isset($data['study_plan_details'])){
            $this->setStudyPlanDetails($data['study_plan_details']);
        }
        if(isset($data['supporterName'])){
            $this->setSupporterName($data['supporterName']);
        }
        if(isset($data['relationship'])){
            $this->setRelationship($data['relationship']);
        }
        if(isset($data['supporterAddress'])){
            $this->setSupporterAddress($data['supporterAddress']);
        }
        if(isset($data['supporterContact'])){
            $this->setSupporterContact($data['supporterContact']);
        }
        if(isset($data['supporterIncome'])){
            $this->setSupporterIncome($data['supporterIncome']);
        }
        if(isset($data['supporterExpense'])){
            $this->setSupporterExpense($data['supporterExpense']);
        }
        if(isset($data['supporterMethodofPayment'])){
            $this->setSupporterMethodofPayment($data['supporterMethodofPayment']);
        }
        if(isset($data['support_other_students'])){
            $this->setSupportOtherStudent($data['support_other_students']);
        }
        else{
        	 $this->setSupportOtherStudent('');
        }
        if(isset($data['study_purpose'])){
            $this->setStudyPurpose($data['study_purpose']);
        }
        if(isset($data['additional'])){
            $this->setAdditional($data['additional']);
        }
        if(isset($data['start_date'])){
            $this->setStartDate($data['start_date']);
        }
        if(isset($data['end_date'])){
            $this->setEndDate($data['end_date']);
        }
        return $this;
    }

      	/* Function for listing all pending students */
    public function pendingStudents(){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('SELECT * FROM profile_pending_students_view');  
            $query->execute();
            $data=$query->fetchAll();
            return $data;
    }

      	/* Function for listing all students */
    public function allStudents(){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('SELECT * FROM students_view LIMIT 2000');  
            $query->execute();
            $data=$query->fetchAll();
            return $data;
    }

      	/* Function for listing all students with unassigned batches */
    public function unassignedStudents(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM students_view WHERE batch is NULL LIMIT 2000');  
        $query->execute();
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for listing all students with assigned batches */
    public function assignedStudents(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM batch_assigned_students_view LIMIT 2000');  
        $query->execute();
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for listing all students of a specific batch */
    public function sortbyBatch(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM batch_assigned_students_view WHERE batch = :batch');  
        $query->execute(array(':batch' => $this->getBatch()));
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for searching students */
    public function searchStudent(){
        $pdo = Database::getInstance();
        if($this->getName() != ""){
			$query = $pdo->prepare("SELECT * FROM students_view WHERE username = :name OR email = :name OR family_name LIKE CONCAT('%', :name, '%') OR given_name LIKE CONCAT('%', :name, '%') OR fatherName LIKE CONCAT('%', :name, '%') OR motherName LIKE CONCAT('%', :name, '%') ORDER BY create_date DESC LIMIT 2000");  
			$query->execute(array(':name' => $this->getName())); 
			$data=$query->fetchAll();
			return $data;
        }
    }

      	/* Function for searching user based on date */
    public function searchStudentbyDate($fromDate='', $toDate=''){
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM students_view WHERE (create_date BETWEEN :fromDate AND :toDate)");  
      $query->execute(array(':fromDate' => date("Y-m-d H:i:s", strtotime($fromDate)), ':toDate' => date("Y-m-d H:i:s", strtotime($toDate)))); 
      $data=$query->fetchAll();
      return $data;
    }

      	/* Function for verifying whether student profile can be created for said user */
    private function verifyUser(){
        $pdo = Database::getInstance();
        $checkUserQuery = $pdo->prepare('SELECT * FROM users_view WHERE id = :id');  
        $checkUserQuery->execute(array(':id' => $this->findUserID()));
        $userData=$checkUserQuery->fetchAll();
        foreach($userData as $user){
        	if($user['role'] == 4){
        		$studentQuery = $pdo->prepare('SELECT * FROM students WHERE user_id = :id and delete_date is NULL');  
	            $studentQuery->execute(array(':id' => $this->findUserID()));
	            $total=$studentQuery->rowCount();
	            if($total == 0){
	            	return $userData;
	            }
        	}
        }
    }

      	/* Function for verifying whether student profile has been created */
    private function verifyStudent(){
        $pdo = Database::getInstance();
        $checkStudentQuery = $pdo->prepare('SELECT * FROM students_view WHERE id = :id');  
        $checkStudentQuery->execute(array(':id' => $this->findUserID()));
        $studentData=$checkStudentQuery->fetchAll();
        return $studentData;
    }

    	/* get all sexes */
    private function getSexes(){
        $pdo = Database::getInstance();
	    $sexQuery = $pdo->prepare('SELECT * FROM sexes');  
        $sexQuery->execute();
        $sexes = $sexQuery->fetchAll();
        return $sexes;
    }

      	/* Function for fetching all data */
    private function study_statuses(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM study_statuses');  
        $query->execute();
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching all data */
    private function language_tests(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM japanese_language_tests');  
        $query->execute();
        $data=$query->fetchAll();
        return $data;
    }

	     /* get all relationships */
    protected function getRelationships(){
    	$pdo = Database::getInstance();
    	$relationshipQuery = $pdo->prepare('SELECT * FROM relationships');  
        $relationshipQuery->execute();
        $relationships = $relationshipQuery->fetchAll();
        return $relationships;
    }

      	/* get User data */
    public function getInitialUserData(){
        $userData = $this->verifyUser();
        if($userData){
        	$pdo = Database::getInstance();
            $sexes = $this->getSexes();
        	if($sexes){
        		return array('sexes'=>$sexes, 'user'=>$userData);
        	}
        }
    }

    	/* get Student data */
    public function getInitialStudentData(){
        $studentData = $this->verifyStudent();
        if($studentData){
            $batch = new Batch();  
            $allBatches = $batch->allBatches();
            $sexes = $this->getSexes();
            $study_statuses = $this->study_statuses();
            $relationships = $this->getRelationships();
        	if($allBatches && $sexes && $study_statuses && $relationships){
        		return array('sexes'=>$sexes, 'batches'=>$allBatches, 'study_statuses'=>$study_statuses, 'relationships' => $relationships, 'student'=>$studentData);
        	}
        }
    }

    	/* generate foldername */
    public function setFoldername(){
        $getStudent = $this->getUser();
        foreach ($getStudent as $student) {
        	$studentFolder = $student['id'].'_'.$student['username'].'_'.$student['family_name'].' '.$student['given_name'];
        }
        return $studentFolder;
    }


      	/* Create Student Folder */
    private function createStudentFolder(){
		$foldername = 'all_student_files';
		$studentFolder = $this->setFoldername();
		if (!file_exists($foldername)){
			mkdir($foldername, 0777, true);
		}
		if (!file_exists($foldername.'/'.$studentFolder)){
			$create = mkdir($foldername.'/'.$studentFolder, 0777, true);	
			return $create;
		}
    }

      	/* Function for storing student language certificate record */
    private function createLanguageCertification(){
        $pdo = Database::getInstance();
        $tests = $this->language_tests();
        foreach($tests as $test){
        	$query = $pdo->prepare('INSERT INTO student_langauge_certificates (user_id, test_id) VALUES (:userId, :test_id)');        
        	$status = $query->execute(array(':userId'=> $this->findUserID(), ':test_id' => $test['id']));
        }
        return $status;
    }

      	/* Function for storing student information */
    public function storeStudent(){
      	if(!empty($this->getUsername()) && !empty($this->getFatherName()) && !empty($this->getMotherName()) && !empty($this->getNationality()) && !empty($this->getDateOfBirth()) && !empty($this->getSex()) && !empty($this->getContact1()) && !empty($this->getContact2()) && !empty($this->getContact3()) && !empty($this->getPresentAddress()) && !empty($this->getPermanentAddress())){
            $userData = $this->verifyUser();
            $createFolder = $this->createStudentFolder();
            $createLanguageCertification = $this->createLanguageCertification();
            if($userData && $createFolder && $createLanguageCertification){
	            $pdo = Database::getInstance();
    	        $query = $pdo->prepare('INSERT INTO students (user_id, fatherName, motherName, nationality, dob, sex, contact1, contact2, contact3, presentAddress, permanentAddress) VALUES (:userId, :fatherName, :motherName, :nationality, :dob, :sex, :contact1, :contact2, :contact3, :presentAddress, :permanentAddress)');        
            	$status = $query->execute(array(':userId'=> $this->findUserID(), ':fatherName' => $this->getFatherName(), ':motherName' => $this->getMotherName(), ':nationality' => $this->getNationality(), ':dob' => $this->getDateOfBirth(), ':sex' => $this->getSex(), ':contact1' => $this->getContact1(), ':contact2' => $this->getContact2(), ':contact3' => $this->getContact3(), ':presentAddress'=> $this->getPresentAddress(), ':permanentAddress'=> $this->getPermanentAddress()));
            	Notification::createStudent($this->createStudent($this->getUsername()));
                return $status;
            }
      	}
    }

      	/* Function for creating profile without adding details */
    public function skipStoreStudent(){
      	if(!empty($this->getUsername())){
            $userData = $this->verifyUser();
            $createFolder = $this->createStudentFolder();
            $createLanguageCertification = $this->createLanguageCertification();
            if($userData && $createFolder && $createLanguageCertification){
	            $pdo = Database::getInstance();
    	        $query = $pdo->prepare('INSERT INTO students (user_id) VALUES (:userId)');        
            	$status = $query->execute(array(':userId'=> $this->findUserID()));
            	Notification::createStudent($this->getUsername());
                return $status;
            }
      	}
    }

    	/* Function for calculating student roll number according to his batch */
    public function calculateRoll(){
        $pdo = Database::getInstance();
        $studentQuery = $pdo->prepare('SELECT * FROM students_view WHERE id = :id');
        $studentQuery->execute(array(':id' => $this->findUserID()));
        $studentData=$studentQuery->fetchAll();
        foreach($studentData as $student){
    		if($student['batch'] == $this->getBatch()){
    			$roll = $student['roll'];
    		}
    		else{
    			$rollQuery = $pdo->prepare('SELECT max(roll) as roll FROM students WHERE batch = :batch');  
	            $rollQuery->execute(array(':batch' => $this->getBatch()));
	            $maxRoll=$rollQuery->fetchAll();
	            $roll = $maxRoll[0]['roll'] + 1;
    		}
        }
        return $roll;
    }

      	/* Function for verifying whether roll exists */
    public function verifyRoll(){
        $pdo = Database::getInstance();
        $rollQuery = $pdo->prepare('SELECT * FROM students WHERE batch = :batch and roll = :roll and user_id != :id');  
        $rollQuery->execute(array(':roll' => $this->getRoll(), ':batch' => $this->getBatch(), ':id'=>$this->findUserID()));
        $matchedRolls=$rollQuery->rowCount();
        if($matchedRolls == 0){
        	return TRUE;
        }
    }

      	/* Function for saving batch change record */
    private function saveBatchChangeRecord(){
        $pdo = Database::getInstance();
		$query = $pdo->prepare('SELECT * FROM auth_users WHERE username = :username');  
        $query->execute(array(':username' => $_SESSION['uname']));
        $getCurrentUser=$query->fetchAll();
        $changed_by = $getCurrentUser['0']['id']; 
        $query = $pdo->prepare('INSERT INTO batch_changes (batch, student, roll, changed_by_user) VALUES (:batch, :student, :roll, :changed_by)');        
        $query->execute(array(':batch'=> $this->getBatch(), ':roll'=>$this->getRoll(), ':student'=> $this->findUserID(), ':changed_by'=> $changed_by));
    }

      	/* Function for assigning batch to a student */
    public function assignBatch(){
      	if(!empty($this->getBatch()) && !empty($this->getRoll())){
  			$this->saveBatchChangeRecord();
            $verify = $this->verifyRoll();
            if($verify){
	            $pdo = Database::getInstance();
	            $query = $pdo->prepare('UPDATE students SET batch = :batch, roll = :roll WHERE user_id = :id');  
	            $status = $query->execute(array(':roll' => $this->getRoll(), ':batch' => $this->getBatch(), ':id'=>$this->findUserID()));
	            Notification::assignStudentBatch($this->findUserID());
	            return $status;	
            }
      	}
    }

        /* Function for fetching all degrees */
    protected function degrees(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM degrees');  
        $query->execute();
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching student batch change record */
    private function getBatchChangeRecord(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM batch_changes_view WHERE student_id = :id');  
        $query->execute(array(':id' => $this->findUserID()));
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching student educational record */
    private function getEucationalRecord(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM education_record_view WHERE user_id = :id');  
        $query->execute(array(':id' => $this->findUserID()));
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching student language certificates */
    private function getLanguageCertificateRecord(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM student_language_certificates_view WHERE user_id = :id');  
        $query->execute(array(':id' => $this->findUserID()));
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching carrer record */
    private function getCarrerRecord(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM student_carrer_records_view WHERE user_id = :id');  
        $query->execute(array(':id' => $this->findUserID()));
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching Past Entry in Japan */
    private function getPastEntry(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM student_past_entry_view WHERE user_id = :id');  
        $query->execute(array(':id' => $this->findUserID()));
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching family in Bangladesh */
    private function getFamilyInBangladesh(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM student_family_in_bangladesh_view WHERE user_id = :id');  
        $query->execute(array(':id' => $this->findUserID()));
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching family in Japan */
    private function getFamilyInJapan(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM student_family_in_japan_view WHERE user_id = :id');  
        $query->execute(array(':id' => $this->findUserID()));
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for fetching all images in student folder */
    private function getImages(){
      	$directory = 'all_student_files/'.$this->setFoldername().'/';
      	$studentPhotograph = 'http://via.placeholder.com/350x200?text=No+Photograph+Found';
		$studentSignature = 'http://via.placeholder.com/350x200?text=No+Signature+Found';
		$supporterSignature = 'http://via.placeholder.com/350x200?text=No+Supporter+Signature+Found';
      	$images = glob($directory . "*jpg");
		foreach($images as $image){
			if(strpos($image, 'student_photograph') !== false) $studentPhotograph = $image;
			if(strpos($image, 'student_signature') !== false) $studentSignature = $image;
			if(strpos($image, 'supporter_signature') !== false) $supporterSignature = $image;
		}
		return array('studentPhotograph'=>$studentPhotograph, 'studentPhotographAlt'=>'Student Photograph', 'studentSignature'=>$studentSignature, 'studentSignatureAlt'=>'Student Signature', 'supporterSignature'=>$supporterSignature, 'supporterSignatureAlt'=>'Supporter Signature',);
    }

            /* Function for fetching all the documents in student folder */
    private function getAttachments(){
      $directory = 'all_student_files/'.$this->setFoldername().'/';
      $attachments = glob($directory . "*{pdf,doc,docx}", GLOB_BRACE);
      if($attachments){
	      for($i=0; $i<sizeof($attachments); $i++){
	          // Extract required data
	        $ext = explode('.', $attachments[$i]);
	        $file_extension = end($ext); 
	        $getName = str_replace($directory, "", $attachments[$i]);
	        $getUploadDate = substr($getName, 0, strpos($getName, "_"));
	          
	          // Change Data for Viewing
	        $attchmentName = substr($getName, 44);
	        if(empty($getUploadDate)){
	          $uploadDate = 'Not Found';
	        } 
	        else{
	          $uploadDate =  date("F d (l), Y", $getUploadDate);
	        }
	        if($file_extension == 'pdf'){
	          $attchmentThumbnail = 'all_images/pdf_preview.png'; 
	        }
	        else{
	          $attchmentThumbnail = 'all_images/word_preview.png'; 
	        }
	        $attchmentLink = $attachments[$i]; 
	        $allAttachments[] = array('name'=>$attchmentName, 'thumbnail'=>$attchmentThumbnail, 'link'=>$attchmentLink, 'upload_date' => $uploadDate);
	      }
	      return $allAttachments;
      }
    }

      	/* Function for creating student id */
    private function formatStudentId($batch, $id){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT max(roll) as roll, batch_number FROM batch_assigned_students_view WHERE batch = 93');  
        $query->execute();
        $data = $query->fetchAll();
        $maxRoll = $data[0]['roll'];
        $batch_number = $data[0]['batch_number'];
        if(strlen($maxRoll) > 1){
        	if(strlen($id) < strlen($maxRoll)){
        		for($i = 1; $i<strlen($maxRoll); $i++){
                	$id = "0".$id;
                }
        	}
        }
        else{
        	$id = "0".$id;
        }
        $id = $batch_number.$id;
        return $id;
    }

      	/* Function for getting student performance */
    private function getPerformance(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM exam_marks_view WHERE student = :id AND score IS NOT NULL'); 
        $query->execute(array(':id' => $this->findUserID())); 
        $data=$query->fetchAll();
        return $data;
    }

      	/* Function for getting student upcoming exams */
    private function getExams(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM exam_marks_view WHERE student = :id AND score IS NULL'); 
        $query->execute(array(':id' => $this->findUserID())); 
        $data=$query->fetchAll();
        return $data;
    }

        /* Function for getting student upcoming exams */
    private function getAttendances(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM attendance_view WHERE user_id = :id'); 
        $query->execute(array(':id' => $this->findUserID())); 
        $data=$query->fetchAll();
        return $data;
    }


      	/* Function for checking existance of student profile */
    public function getStudentProfile(){
        $pdo = Database::getInstance();
        $student = $this->verifyStudent();
        $sexes = $this->getSexes();
        $batch = new Batch(); 
        $batches = $batch->allBatches();
        $study_statuses = $this->study_statuses();
        $images = $this->getImages();
        $educational_record = $this->getEucationalRecord();
        $certificate_record = $this->getLanguageCertificateRecord(); 
        $carrer_record = $this->getCarrerRecord();
        $past_entry = $this->getPastEntry();
        $relationships = $this->getRelationships();
        $familyInBangladesh = $this->getFamilyInBangladesh();
        $familyInJapan = $this->getFamilyInJapan();
        $attachments = $this->getAttachments();
        $performance = $this->getPerformance();
        $exams = $this->getExams();
        $attendances = $this->getAttendances();
        $batchChange = $this->getBatchChangeRecord();
        $notaddressed = "<b><span class='col-red'>Not addressed!</a></span></b>";
  		foreach($student as $key => $value){
	  		$student[$key]['studentPhotograph'] = $images['studentPhotograph'];
	  		$student[$key]['studentPhotographAlt'] = $images['studentPhotographAlt'];
	  		$student[$key]['studentSignature'] = $images['studentSignature'];
	  		$student[$key]['studentSignatureAlt'] = $images['studentSignatureAlt'];
	  		$student[$key]['supporterSignature'] = $images['supporterSignature'];
	  		$student[$key]['supporterSignatureAlt'] = $images['supporterSignatureAlt'];
			if(empty($student[$key]['fatherName'])){
		  		$student[$key]['fatherName'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['motherName'])){
		  		$student[$key]['motherName'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['nationality'])){
		  		$student[$key]['nationality'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['presentAddress'])){
		  		$student[$key]['presentAddress'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['permanentAddress'])){
		  		$student[$key]['permanentAddress'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['contact1'])){
		  		$student[$key]['contact1'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['contact2'])){
		  		$student[$key]['contact2'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['contact3'])){
		  		$student[$key]['contact3'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['passport_no'])){
		  		$student[$key]['passport_no'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['school_to_enroll'])){
		  		$student[$key]['school_to_enroll'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['study_subject'])){
		  		$student[$key]['study_subject'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['study_plan_details'])){
		  		$student[$key]['study_plan_details'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['supporter_name'])){
		  		$student[$key]['supporter_name'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['supporter_relationship'])){
		  		$student[$key]['supporter_relationship'] = $notaddressed;
	  		}
	  		else{
	  			foreach ($relationships as $relationship) {
	  				if( $student[$key]['supporter_relationship'] == $relationship['id']){
	  					$student[$key]['supporter_relationship'] = $relationship['name'];
	  				}
	  			}
	  		}
	  		if(empty($student[$key]['supporter_address'])){
		  		$student[$key]['supporter_address'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['supporter_contact'])){
		  		$student[$key]['supporter_contact'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['mothod_of_payment'])){
		  		$student[$key]['mothod_of_payment'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['support_other_students'])){
		  		$student[$key]['support_other_students'] = $notaddressed;
		  		$student[$key]['support_other_students_yes_no'] = 'No';
	  		}
	  		else{
	  			$student[$key]['support_other_students_yes_no'] = 'Yes';
	  		}
	  		if(empty($educational_record)){
		  		$student[$key]['educational_record'] = $notaddressed;
		  		$student[$key]['final_institude'] = $notaddressed;
	  		}
	  		else{
	  			$student[$key]['educational_record'] = $educational_record;
	  			$max_date = 0;
	  			foreach ($educational_record as $education) {
	  				if($education['end_date'] > $max_date){
	  					$max_date = $education['end_date'];
	  					$student[$key]['final_institude'] = $education['institude'];
	  				}
	  			}
	  		}
	  		if(empty($past_entry)){
		  		$student[$key]['past_entry'] = $notaddressed;
	  		}
	  		else{
	  			$student[$key]['past_entry'] = $past_entry;
	  		}
	  		if(empty($batchChange)){
		  		$student[$key]['batchChange'] = 'No Batch Change Record Found!';
	  		}
	  		else{
	  			$student[$key]['batchChange'] = $batchChange;
	  		}
  			$student[$key]['certificate_record'] = $certificate_record;
	  		if(empty($carrer_record)){
		  		$student[$key]['carrer_record'] = $notaddressed;
	  		}
	  		else{
	  			$student[$key]['carrer_record'] = $carrer_record;
	  		}
	  		if(empty($familyInBangladesh)){
		  		$student[$key]['familyInBangladesh'] = $notaddressed;
	  		}
	  		else{
	  			$student[$key]['familyInBangladesh'] = $familyInBangladesh;
	  		}
	  		if(empty($familyInJapan)){
		  		$student[$key]['familyInJapan'] = $notaddressed;
	  		}
	  		else{
	  			$student[$key]['familyInJapan'] = $familyInJapan;
	  		}
	  		if(!empty($student[$key]['supporter_income']) && !empty($student[$key]['supporter_expense'])){
	  			$student[$key]['supporter_annual_income'] = $student[$key]['supporter_income']*12;
	  			$student[$key]['supporter_annual_expense'] = $student[$key]['supporter_expense']*12;
	  			$student[$key]['annual_save'] = ($student[$key]['supporter_income']*12) - ($student[$key]['supporter_expense']*12);
	  		}
	  		else{
		  		$student[$key]['annual_save'] =  $notaddressed;
		  		if(empty($student[$key]['supporter_income'])){
			  		$student[$key]['supporter_income'] = $notaddressed;
			  		$student[$key]['supporter_annual_income'] = $notaddressed;
		  		}
		  		if(empty($student[$key]['supporter_expense'])){
			  		$student[$key]['supporter_expense'] = $notaddressed;
			  		$student[$key]['supporter_annual_expense'] = $notaddressed;
		  		}	
	  		}
	  		if(!empty($student[$key]['study_status'])){
		  		foreach ($study_statuses as $status) {
		  			if($status['id'] == $student[$key]['study_status']){
		  				$student[$key]['study_status'] = $status['name'];
		  			}
		  		}
	  		}
	  		else{
	  			$student[$key]['study_status'] = $notaddressed;
	  		}
	  		if(!empty($student[$key]['passport_issue'])){
		  		$student[$key]['passport_issue'] = date("F d (l), Y", $student[$key]['passport_issue']);
	  		}
	  		else{
	  			$student[$key]['passport_issue'] = $notaddressed;
	  		}
	  		if(!empty($student[$key]['passport_expiration'])){
		  		$student[$key]['passport_expiration'] = date("F d (l), Y", $student[$key]['passport_expiration']);
	  		}
	  		else{
	  			$student[$key]['passport_expiration'] = $notaddressed;
	  		}
	  		if(!empty($student[$key]['dob'])){
		  		$calculeAge = date('Y') - date('Y', $student[$key]['dob']);
		  		$student[$key]['dob'] = date("F d (l), Y", $student[$key]['dob']);
		  		$student[$key]['age'] = $calculeAge." years old";
	  		}
	  		else{
	  			$student[$key]['dob'] = $notaddressed;
	  			$student[$key]['age'] = $notaddressed;
	  		}
			if(!empty($student[$key]['sex'])){
		  		foreach ($sexes as $sex) {
		  			if($sex['id'] == $student[$key]['sex']){
		  				$student[$key]['sex'] = $sex['name'];
		  			}
		  		}
	  		}
	  		else{
	  			$student[$key]['sex'] = $notaddressed;
	  		}
		  	if(!empty($attachments)){
		  		$student[$key]['attachments'] = $attachments;
	  		}
			if(!empty($student[$key]['batch'])){
		  		foreach ($batches as $batch) {
		  			if($batch['id'] == $student[$key]['batch']){
		  				$batchinfo = $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number'];
		  				$period = $batch['period']." (".date('h:i A', strtotime($batch['start_time']))."-".date('h:i A', strtotime($batch['end_time'])).")";
				  		$student[$key]['batch'] = "<a href='?controller=batches&action=viewBatch&id=".$student[$key]['batch']."'>".$batchinfo."</a>";
				  		$student[$key]['period'] = $period;
				  		$student[$key]['roll'] = $this->formatStudentId($student[$key]['batch'], $student[$key]['roll']);
		  			}
		  		}
	  		}
	  		else{
	  			$student[$key]['batch'] = $notaddressed;
	  			$student[$key]['period'] = $notaddressed;
	  			$student[$key]['roll'] = $notaddressed;
	  		}
	  		if(!empty($performance)){
	  			$student[$key]['performance'] = $performance;
	  		}
	  		if(!empty($exams)){
	  			$student[$key]['exams'] = $exams;
	  		}
            if(!empty($attendances)){
                $student[$key]['attendances'] = $attendances;
            }
	  		if(empty($student[$key]['study_purpose'])){
		  		$student[$key]['study_purpose'] = $notaddressed;
	  		}
	  		if(empty($student[$key]['additional'])){
		  		$student[$key]['additional'] = $notaddressed;
		  	}
		}
        return $student;
    }

      	/* Function for updating initial student information */
    public function updateStudentDetails(){
      	if(!empty($this->getUsername()) && !empty($this->getFatherName()) && !empty($this->getMotherName()) && !empty($this->getNationality()) && !empty($this->getDateOfBirth()) && !empty($this->getSex()) && !empty($this->getContact1()) && !empty($this->getContact2()) && !empty($this->getContact3()) && !empty($this->getPresentAddress()) && !empty($this->getPermanentAddress())){
            $pdo = Database::getInstance();
	        $query = $pdo->prepare('UPDATE students SET fatherName = :fatherName, motherName = :motherName, nationality = :nationality, dob = :dob, sex = :sex, contact1 = :contact1, contact2 = :contact2, contact3 = :contact3, presentAddress = :presentAddress, permanentAddress = :permanentAddress WHERE user_id = :id');        
        	$status = $query->execute(array(':id'=> $this->findUserID(), ':fatherName' => $this->getFatherName(), ':motherName' => $this->getMotherName(), ':nationality' => $this->getNationality(), ':dob' => $this->getDateOfBirth(), ':sex' => $this->getSex(), ':contact1' => $this->getContact1(), ':contact2' => $this->getContact2(), ':contact3' => $this->getContact3(), ':presentAddress'=> $this->getPresentAddress(), ':permanentAddress'=> $this->getPermanentAddress()));
            Notification::updateStudent($this->findUserID(), $this->getUsername());
        	return $status;
      	}
    }

      	/* Function for updating initial student information */
    public function updateStudentPassport(){
      	if(!empty($this->getUsername()) && !empty($this->getPassportNumber()) && !empty($this->getStartDate()) && !empty($this->getEndDate()) && ($this->getEndDate() > $this->getStartDate())){
            $pdo = Database::getInstance();
	        $query = $pdo->prepare('UPDATE students SET passport_no = :passport_no, passport_issue = :passport_issue, passport_expiration = :passport_expiration WHERE user_id = :id');        
        	$status = $query->execute(array(':id'=> $this->findUserID(), ':passport_no' => $this->getPassportNumber(), ':passport_issue' => $this->getStartDate(), ':passport_expiration' => $this->getEndDate()));
            Notification::updateStudent($this->findUserID(), $this->getUsername());
        	return $status;
      	}
    }

      	/* Function for updating student study plan */
    public function updateStudyPlan(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE students SET school_to_enroll = :school_to_enroll, study_subject = :study_subject, study_plan_details = :study_plan_details WHERE user_id = :id');     
    	$status = $query->execute(array(':id'=> $this->findUserID(), ':school_to_enroll' => $this->getSchoolToEnroll(), ':study_subject' => $this->getStudySubject(), ':study_plan_details' => $this->getStudyPlanDetails()));
        Notification::updateStudent($this->findUserID(), $this->getUsername());
    	return $status;
    }
    
      	/* Function for updating student supporter */
    public function updateStudentSupporter(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE students SET supporter_name = :supporter_name, supporter_relationship = :supporter_relationship, supporter_address = :supporter_address, supporter_contact = :supporter_contact, supporter_income = :supporter_income, supporter_expense = :supporter_expense, mothod_of_payment = :mothod_of_payment, support_other_students = :support_other_students WHERE user_id = :id');        
    	$status = $query->execute(array(':id'=> $this->findUserID(), ':supporter_name' => $this->getSupporterName(), ':supporter_relationship' => $this->getRelationship(), ':supporter_address' => $this->getSupporterAddress(), ':supporter_contact' => $this->getSupporterContact(), ':supporter_income' => $this->getSupporterIncome(), ':supporter_expense' => $this->getSupporterExpense(), ':mothod_of_payment' => $this->getSupporterMethodofPayment(), ':support_other_students' => $this->getSupportOtherStudent()));
    	Notification::updateStudent($this->findUserID(), $this->getUsername());
        return $status;
    }


      	/* Function for updating initial student information */
    public function updateStudentStudyPurpose(){
      	if(!empty($this->getUsername()) && !empty($this->getStudyPurpose())){
            $pdo = Database::getInstance();
	        $query = $pdo->prepare('UPDATE students SET study_purpose = :study_purpose WHERE user_id = :id');        
        	$status = $query->execute(array(':id'=> $this->findUserID(), ':study_purpose' => $this->getStudyPurpose()));
            Notification::updateStudent($this->findUserID(), $this->getUsername());
        	return $status;
      	}
    }

      	/* Function for deleting additional student information */
    public function updateStudentAdditionalInfo(){
      	if(!empty($this->getUsername()) && !empty($this->getAdditional())){
            $pdo = Database::getInstance();
	        $query = $pdo->prepare('UPDATE students SET additional = :additional WHERE user_id = :id');        
        	$status = $query->execute(array(':id'=> $this->findUserID(), ':additional' => $this->getAdditional()));
            Notification::updateStudent($this->findUserID(), $this->getUsername());
        	return $status;
      	}
    }

      	/* delete Student Folder */
    private function deleteStudentFolder(){
		$foldername = 'all_student_files';
		$studentFolder = $this->setFoldername();
		if (file_exists($foldername.'/'.$studentFolder)){
			$delete =  rename($foldername.'/'.$studentFolder, $foldername.'/'.$studentFolder.'_deleted_at-'.time());	
			return $delete;
		}
    }

        /* delete Student Folder */
    private function deleteStudentLanguage(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('DELETE FROM student_langauge_certificates WHERE user_id = :id');  
        $query->execute(array(':id'=>$this->findUserID()));
    }

      	/* Function for deleting a student */
    public function deleteStudent(){
      	if(!empty($this->getUsername())){
            $delete = $this->deleteStudentFolder();
            if($delete){
	            $pdo = Database::getInstance();
	            $query = $pdo->prepare('UPDATE students SET delete_date = :delete_date WHERE user_id = :id');  
	            $status = $query->execute(array(':delete_date' => time(), ':id'=>$this->findUserID()));
                $this->deleteStudentLanguage();
	            return $status;		
            }
      	}
    }

      	/* Function for creating record backup */
    public function studentBackup(){
	    $pdo = Database::getInstance();
	    $educationQuery = $pdo->prepare('SELECT * FROM education_record');
	    $educationQuery->execute();
        $education=$educationQuery->fetchAll();  
	    $languageCertificateQuery = $pdo->prepare('SELECT * FROM student_langauge_certificates'); 
	    $languageCertificateQuery->execute();
        $languageCertificate=$languageCertificateQuery->fetchAll();   
	    $carrerRecordsQuery = $pdo->prepare('SELECT * FROM student_carrer_records');
	    $carrerRecordsQuery->execute();
        $carrer=$carrerRecordsQuery->fetchAll();   
	    $pastEntryQuery = $pdo->prepare('SELECT * FROM student_past_entry');
	    $pastEntryQuery->execute();
        $pastEntry=$pastEntryQuery->fetchAll();  
	    $familyQuery = $pdo->prepare('SELECT * FROM student_family');
	    $familyQuery->execute();
        $family=$familyQuery->fetchAll();    
	    if($education && $languageCertificate && $carrer && $pastEntry && $family){
		    return array('education'=> $education, 'languageCertificate'=> $languageCertificate, 'carrer'=> $carrer, 'pastEntry'=>$pastEntry, 'family'=> $family);	
	    }	
    }

      	/* Function for deleting all students */
    public function deleteAllStudents(){
	    $pdo = Database::getInstance();
	    $studentQuery = $pdo->prepare('UPDATE students SET delete_date = :delete_date');  
	    $studentQueryStatus = $studentQuery->execute(array(':delete_date' => time()));
	    $educationQuery = $pdo->prepare('UPDATE education_record SET delete_date = :delete_date');  
	    $educationQueryStatus = $educationQuery->execute(array(':delete_date' => time()));
	    $studentLanguageCertificateQuery = $pdo->prepare('DELETE FROM student_langauge_certificates');  
	    $studentLanguageCertificateStatus = $studentLanguageCertificateQuery->execute();
	    $studentCarrerQuery = $pdo->prepare('UPDATE student_carrer_records SET delete_date = :delete_date');  
	    $studentCarrerQueryStatus = $studentCarrerQuery->execute(array(':delete_date' => time()));
	    $studentPastEntryQuery = $pdo->prepare('UPDATE student_past_entry SET delete_date = :delete_date');  
	    $studentPastEntryStatus = $studentPastEntryQuery->execute(array(':delete_date' => time()));
	    $studentFamilyQuery = $pdo->prepare('UPDATE student_family SET delete_date = :delete_date');  
	    $studentFamilyStatus = $studentFamilyQuery->execute(array(':delete_date' => time()));
	    if($studentQueryStatus && $educationQueryStatus && $studentLanguageCertificateStatus && $studentCarrerQueryStatus && $studentPastEntryStatus && $studentFamilyStatus){
		    return TRUE;	
	    }	
    }

      /* Function for importing database */
    public function importExcel() {
        $pdo = Database::getInstance();
        $i=0;
        $stored = 0;
        $studentsquery = $pdo->prepare('SELECT * FROM students_view');  
        $studentsquery->execute();
        $students=$studentsquery->fetchAll();
        $usersquery = $pdo->prepare('SELECT * FROM users_view');  
        $usersquery->execute();
        $users=$usersquery->fetchAll();
        $filename=$_FILES["file"]["tmp_name"];
        if($_FILES["file"]["size"] > 0){
          $file = fopen($filename, "r");
          $query = $pdo->prepare('INSERT INTO students (user_id, batch, roll, fatherName, motherName, nationality, dob, sex, contact1, contact2, contact3, presentAddress, permanentAddress, passport_no, passport_issue, passport_expiration, study_status, school_to_enroll, study_subject, study_plan_details, supporter_name, supporter_relationship, supporter_address, supporter_contact, supporter_income, supporter_expense, mothod_of_payment, support_other_students, study_purpose, additional, create_date, update_date) VALUES (:user_id, :batch, :roll, :fatherName, :motherName, :nationality, :dob, :sex, :contact1, :contact2, :contact3, :presentAddress, :permanentAddress, :passport_no, :passport_issue, :passport_expiration, :study_status, :school_to_enroll, :study_subject, :study_plan_details, :supporter_name, :supporter_relationship, :supporter_address, :supporter_contact, :supporter_income, :supporter_expense, :mothod_of_payment, :support_other_students, :study_purpose, :additional, :create_date, :update_date)');
          while (($data = fgetcsv($file, 10000, ",")) !== FALSE){   
            if($i>0) {   
				foreach($students as $student){
					$studentChecked = TRUE;
					if($data[0] == $student['user_id']){
					  $studentChecked = FALSE;
					}
				} 
				foreach($users as $user){
					if($data[0] == $user['id'] && $user['role'] == 4){
					  $userChecked = TRUE;
					  $folderName = $user['id'].'_'.$user['username'].'_'.$user['family_name'].' '.$user['given_name'];
					}
				}
				if($studentChecked && $userChecked){
					$status = $query->execute(array(':user_id' => $data[0], ':batch' => $data[1], ':roll' => $data[2], ':fatherName' => $data[3], ':motherName' => $data[4], ':nationality' => $data[5], ':dob' => $data[6], ':sex' => $data[7], ':contact1' => $data[8], ':contact2' => $data[9], ':contact3' => $data[10], ':presentAddress' => $data[11], ':permanentAddress' => $data[12], ':passport_no' => $data[13], ':passport_issue' => $data[14], ':passport_expiration' => $data[15], ':study_status' => $data[16], ':school_to_enroll' => $data[17], ':study_subject' => $data[18], ':study_plan_details' => $data[19], ':supporter_name' => $data[20], ':supporter_relationship' => $data[21], ':supporter_address' => $data[22], ':supporter_contact' => $data[23], ':supporter_income' => $data[24], ':supporter_expense' => $data[25], ':mothod_of_payment' => $data[26], ':support_other_students' => $data[27], ':study_purpose' => $data[28], ':additional' => $data[29], ':create_date' => $data[30], ':update_date' => $data[31]));
					if($status){
						$directory = 'all_student_files';
						if (!file_exists($directory)){
							mkdir($directory, 0777, true);
						}
						if (!file_exists($directory.'/'.$folderName)){
							mkdir($directory.'/'.$folderName, 0777, true);	
						}
					 	$stored++;
					}
				}  
            }
            $i++;
          }
          fclose($file);
          $i = $i-1;
          return  array('stored'=>$stored, 'total'=>$i); 
        }
    }

      	/* Function for downloading databases */
    public function studentDatabases(){
	    $pdo = Database::getInstance();
        $tests = $this->language_tests();
        $relationships = $this->getRelationships();
        $study_statuses = $this->study_statuses(); 
        $degrees=$this->degrees();
        $query = $pdo->prepare('SELECT * FROM japanese_language_levels');  
        $query->execute();
        $levels=$query->fetchAll();
	    if($tests && $relationships && $study_statuses && $degrees && $levels){
		    return array('japanese_language_tests'=> $tests, 'relationships'=> $relationships, 'study_statuses'=> $study_statuses, 'degrees'=>$degrees, 'japanese_language_levels'=> $levels);	
	    }
    }

      /* Function for importing Japanese Language Levels Database */
    public function importStudentDatabases($command) {
        $pdo = Database::getInstance();
        $i=0;
        $stored = 0;
        $database=$this->studentDatabases();
        $filename=$_FILES["file"]["tmp_name"];
        if($_FILES["file"]["size"] > 0){
          $file = fopen($filename, "r");
          while (($data = fgetcsv($file, 10000, ",")) !== FALSE){   
            if($i>0) {    
              $check = TRUE;
              foreach($database[$command] as $cData){
                if($data[0] == $cData['name'] || empty($data[0])){
                  $check = FALSE;
                }
              }
              if($check){
                if($command == 'relationships'){
          			$query = $pdo->prepare('INSERT INTO relationships (name, type) VALUES (:name, :type)');
                	$status = $query->execute(array(':name' => $data[0], ':type' => $data[1]));
                }
		        else{
          			$query = $pdo->prepare("INSERT INTO $command (name) VALUES (:name)");
                	$status = $query->execute(array(':name' => $data[0]));
		        }
                if($status){
                  $stored++;
                }
              }  
            }
            $i++;
          }
          fclose($file);
          $i = $i-1;
          return  array('stored'=>$stored, 'total'=>$i); 
        }
    }

}


?>