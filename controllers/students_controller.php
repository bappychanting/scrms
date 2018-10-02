<?php

  use App\Student\Student;
  use App\Student\Education;
  use App\Student\Language;
  use App\Student\Carrer;
  use App\Student\Entry;
  use App\Student\Family;
  use App\Student\Attachment;
  use App\Student\PDF;
  use App\User\Message;
  use App\User\Notification;
  use App\User\Auth;
  use App\Misc\Misc;
  
  class StudentsController { 

    public function __construct() {
      Auth::authenticate();
      $userImage = Misc::checkImage('all_images/user_images/', $_SESSION["photo"]);
      $notifcation = new Notification();
      $newNotifcations = $notifcation->setData($_SESSION)->newNotifications();
      $message = new Message();
      $getNewMessages = $message->setMessageData()->getNewMessages();
      require_once('views/layout/header.php');
      require_once('views/layout/sidebar_'.$_SESSION["role_name"].'.php');
    }

    private function student(){
      $student = new Student();
      return $student;
    }

    private function education(){
      $education = new Education();
      return $education;
    }

    private function language(){
      $language = new Language();
      return $language;
    }

    private function carrer(){
      $carrer = new Carrer();
      return $carrer;
    }

    private function entry(){
      $entry = new Entry();
      return $entry;
    }

    private function family(){
      $family = new Family();
      return $family;
    }

    private function attachment(){
      $attachment = new Attachment();
      return $attachment;
    }

    public function pendingStudents(){
      Auth::accessControl(array(4));
      $students = $this->student()->pendingStudents();
      Misc::showResult($students, 'views/students/pending_students.php');  
    }

    public function allStudents(){
      Auth::accessControl(array(4));
      $students = $this->student()->allStudents();
      Misc::showResult($students, 'views/students/index.php');  
    }

    public function unassignedStudents(){
      Auth::accessControl(array(4));
      $students = $this->student()->unassignedStudents();
      Misc::showResult($students, 'views/students/unassigned_students.php');  
    }

    public function assignedStudents(){
      Auth::accessControl(array(4));
      $students = $this->student()->assignedStudents();
      Misc::showResult($students, 'views/students/assigned_students.php');  
    }

    public function sortByBatch(){
      Auth::accessControl(array(4));
      $students = $this->student()->setStudentData($_GET)->sortbyBatch();
      Misc::showResult($students, 'views/students/assigned_students.php');  
    }

    public function searchStudent() {
      $students = $this->student()->setData($_POST)->searchStudent();
      Misc::showResult($students, 'views/students/index.php');  
    }

    public function searchStudentbyDate() { 
      if(empty($_POST['start_date']) || empty($_POST['end_date'])){
        $_POST['start_date'] = ''; $_POST['end_date'] = '';
      }
      $students = $this->student()->searchStudentbyDate($_POST['start_date'], $_POST['end_date']); 
      Misc::showResult($students, 'views/students/index.php');
    }

    public function createStudentProfile(){
      Auth::profileAccess($_GET['uname'], 3);
      $verify = $this->student()->setStudentData($_GET)->getInitialUserData();
      if($verify){
        $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "fatherName"=>"", "motherName"=>"", "nationality"=>"", "dob"=>"", "sex"=>"", "contact1"=>"", "contact2"=>"", "contact3"=>"", "presentAddress"=>"", "permanentAddress"=>""));
        foreach ($allData as $data) {
          foreach($verify['user'] as $user){
              require_once('views/students/add_student_detail.php'); 
          }
        } 
      }
      else{
        $errorMessage = "Not available for this user!";
        require_once('views/auth/view_error_message.php');
      }     
    }

    public function storeStudent() {
      $store = $this->student()->setStudentData($_POST)->storeStudent();
      if($store){
        $_SESSION['success'] = "Profile has been created";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']);
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem creating profile! Please double check the user! Is the user an student?";
        header("Location:?controller=students&action=createStudentProfile&uname=".$_POST['uname']);
      }
    }

    public function skipProfile() {
      Auth::profileAccess($_GET['uname'], 3);
      $create = $this->student()->setStudentData($_GET)->skipStoreStudent();
      if($create){
        $_SESSION['success'] = "Profile has been created";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_GET['uname']);
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem creating profile! Please double check the user! Is the user an student?";
        header("Location:?controller=students&action=createStudentProfile&uname=".$_GET['uname']);
      }
    }

    public function showStudentProfile(){
      Auth::profileAccess($_GET['uname'], 3);
      $findStudent = $this->student()->setStudentData($_GET)->getStudentProfile();
      if($findStudent){
          foreach($findStudent as $student){
            require_once('views/students/view_profile.php');
          }
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }    
    }

    public function assignBatch() {
      Auth::accessControl(array(3,4));
      $verify = $this->student()->setStudentData($_GET)->getInitialStudentData();
      if($verify){
        foreach($verify['student'] as $student){
             require_once('views/students/enroll_in_batch.php'); 
        }
      }
      else{
        $errorMessage = "Student not available!";
        require_once('views/auth/view_error_message.php');
      }  
    }

    public function updateBatch() {
      $update = $this->student()->setStudentData($_POST)->assignBatch();
      if($update){
        $_SESSION['success'] = "Batch has been assigned";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']);
      }
      else{
        $_SESSION['error'] = "There was a problem assigning this batch! Please try again with another batch and roll combination. Is there any field left empty?";
        header("Location:?controller=students&action=assignBatch&uname=".$_POST['uname']);
      }  
    }

    public function editStudentDetails(){
      Auth::profileAccess($_GET['uname'], 3);
      $studentData = $this->student()->setStudentData($_GET)->getInitialStudentData();
      if($studentData){
          foreach($studentData['student'] as $student){
            require_once('views/students/edit_student_detail.php');
          }
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }    
    }

    public function updateStudentImage(){
      if(isset($_POST['uname'])){
        $foldername = 'all_student_files/'.$this->student()->setStudentData($_POST)->setFoldername();
        $getFilename = str_replace("Update", "", $_POST['submit']);
        $getFilename = str_replace(" ", "_", $getFilename);
        $filename = $this->student()->setStudentData($_POST)->setFoldername().strtolower($getFilename);;
        $handle = new upload($_FILES['file']);
        if ($handle->uploaded) {
          $handle->file_new_name_body   = $filename;
          $handle->image_resize         = true;
          $handle->image_x              = 600;
          $handle->image_ratio_y        = true;
          $handle->process($foldername);
          if ($handle->processed) {
            $handle->clean();
            $_SESSION['success'] = "Image has been updated.";
            header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']);
          } else {
            $_SESSION['error'] = "There was a problem updating the Image. Please try again!";
            header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']);
          }
        }
      }
      else{
        $errorMessage = "Something went wrong! Please make sure you have followed the instructions properly and try again!";
        require_once('views/auth/view_error_message.php');
      } 
    }

    public function updateStudentDetails() {
      $update = $this->student()->setStudentData($_POST)->updateStudentDetails();
      if($update){
        $_SESSION['success'] = "Student details has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']);
      }
      else{
        $_SESSION['error'] = "There was a problem updating details! Please try again with correct inputs. Is there any field left empty?";
        header("Location:?controller=students&action=editStudentDetails&uname=".$_POST['uname']);
      }  
    }

    public function editStudentPassport(){
      Auth::profileAccess($_GET['uname'], 3);
      $studentData = $this->student()->setStudentData($_GET)->getInitialStudentData();
      if($studentData){
          foreach($studentData['student'] as $student){
            require_once('views/students/update_passport.php');
          }
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }    
    }

    public function updateStudentPassport() {
      $update = $this->student()->setStudentData($_POST)->updateStudentPassport();
      if($update){
        $_SESSION['success'] = "Passport details has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']);
      }
      else{
        $_SESSION['error'] = "There was a problem updating passport details! Please try again with correct inputs. Is there any field left empty?";
        header("Location:?controller=students&action=editStudentPassport&uname=".$_POST['uname']);
      }  
    }

    public function addEducationRecord(){
      Auth::profileAccess($_GET['uname'], 3);
      $studentData = $this->education()->setStudentData($_GET)->getInitialStudentEducationData();
      if($studentData){
          $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "degree"=>"", "institude"=>"", "address"=>"", "start_date"=>"", "end_date"=>""));
          foreach ($allData as $data) {
            foreach($studentData['student'] as $student){
              require_once('views/students/add_education_record.php');  
            }
          }  
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }  
    }

    public function storeEducationRecord(){
      $store = $this->education()->setEducationData($_POST)->storeEducationalRecord();
      if($store){
        $_SESSION['success'] = "Education record has been added";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#educational_record");
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding education record! Please check if there is any field left empty! Is the degree or timeframe already mentioned in anonther education record?";
        header("Location:?controller=students&action=addEducationRecord&uname=".$_POST['uname']);
      } 
    }

    public function editEducationRecord(){
      Auth::profileAccess($_GET['uname'], 3);
      $educationRecord = $this->education()->setEducationData($_GET)->findEducationalRecord();
      if($educationRecord){
        foreach($educationRecord['record'] as $record){
          require_once('views/students/update_education_record.php');  
        } 
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }  
    }

    public function updateEducationRecord(){
      $update = $this->education()->setEducationData($_POST)->updateEducationalRecord();
      if($update){
        $_SESSION['success'] = "Education record has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#educational_record");
      }
      else{
        $_SESSION['error'] = "There was a problem updating education record! Please check if there is any field left empty! Is the degree or timeframe already mentioned in anonther education record?";
        header("Location:?controller=students&action=editEducationRecord&uname=".$_POST['uname']."&id=".$_POST['id']);
      } 
    }

    public function deleteEducationRecord(){
      Auth::profileAccess($_GET['uname'], 3);
      $delete = $this->education()->setEducationData($_GET)->deleteEducationalRecord();
      if($delete){
        $_SESSION['success'] = "Education record has been deleted";
        header("Location:?controller=students&action=showStudentProfile&uname=".$delete."#educational_record");
      }
      else{
        $_SESSION['error'] = "There was a problem deleting education record! Please try again!";
        header("Location:?controller=students&action=showStudentProfile&uname=".$delete."#educational_record");
      } 
    }

    public function editLanguageCertification(){
      Auth::profileAccess($_GET['uname'], 3);
      $languageRecord = $this->language()->setLanguageData($_GET)->findLanguageRecord();
      Misc::showResult($languageRecord, 'views/students/update_language_certification.php'); 
    }

    public function updateLanguageCertification(){
      $update = $this->language()->setLanguageData($_POST)->updateLanguage();
      if($update){
        $_SESSION['success'] = "Certificate record has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#language_certification");
      }
      else{
        $_SESSION['error'] = "There was a problem updating certificate record! Please check if there is any field left empty! Are the given dates within timeframe of another test?";
        header("Location:?controller=students&action=editLanguageCertification&uname=".$_POST['uname']."&id=".$_POST['id']);
      } 
    }

    public function addCarrerRecord(){
      Auth::profileAccess($_GET['uname'], 3);
      $studentData = $this->carrer()->setCarrerData($_GET)->getInitialStudentData();
      if($studentData){
          $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "organization"=>"", "occupation"=>"", "address"=>"", "start_date"=>"", "end_date"=>""));
          foreach ($allData as $data) {
            foreach($studentData['student'] as $student){
              require_once('views/students/add_carrer_record.php');  
            }
          }  
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }  
    }

    public function storeCarrerRecord(){
      $store = $this->carrer()->setCarrerData($_POST)->storeCarrerRecord();
      if($store){
        $_SESSION['success'] = "Carrer record has been added";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#carrer_record");
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding education record! Please check if there is any field left empty! Is the degree or timeframe already mentioned in anonther education record?";
        header("Location:?controller=students&action=addCarrerRecord&uname=".$_POST['uname']);
      } 
    }

    public function editCarrerRecord(){
      Auth::profileAccess($_GET['uname'], 3);
      $carrerRecord = $this->carrer()->setCarrerData($_GET)->findCarrerRecord();
      Misc::showResult($carrerRecord, 'views/students/update_carrer_record.php', "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile."); 
    }

    public function updateCarrerRecord(){
      $update = $this->carrer()->setCarrerData($_POST)->updateCarrerRecord();
      if($update){
        $_SESSION['success'] = "Carrer record has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#carrer_record");
      }
      else{
        $_SESSION['error'] = "There was a problem updating carrer record! Please check if there is any field left empty! Is the degree or timeframe already mentioned in anonther education record?";
        header("Location:?controller=students&action=editCarrerRecord&uname=".$_POST['uname']."&id=".$_POST['id']);
      } 
    }

    public function deleteCarrerRecord(){
      Auth::profileAccess($_GET['uname'], 3);
      $delete = $this->carrer()->setCarrerData($_GET)->deleteCarrerRecord();
      if($delete){
        $_SESSION['success'] = "Carrer record has been deleted";
        header("Location:?controller=students&action=showStudentProfile&uname=".$delete."#carrer_record");
      }
      else{
        $_SESSION['error'] = "There was a problem deleting carrer record! Please try again!";
        header("Location:?controller=students&action=showStudentProfile&uname=".$delete."#carrer_record");
      } 
    }

    public function addPastEntry(){
      Auth::profileAccess($_GET['uname'], 3);
      $studentData = $this->entry()->setEntryData($_GET)->getInitialStudentData();
      if($studentData){
          $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "residence_status"=>"", "entry_purpose"=>"", "start_date"=>"", "end_date"=>""));
          foreach ($allData as $data) {
            foreach($studentData['student'] as $student){
              require_once('views/students/add_past_entry.php');  
            }
          }  
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }  
    }

    public function storePastEntry(){
      $store = $this->entry()->setEntryData($_POST)->storePastEntry();
      if($store){
        $_SESSION['success'] = "Past Entry has been added";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#past_entry");
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding past entry! Please check if there is any field left empty! Is the timeframe already in another past entry?";
        header("Location:?controller=students&action=addPastEntry&uname=".$_POST['uname']);
      } 
    }

    public function editPastEntry(){
      Auth::profileAccess($_GET['uname'], 3);
      $pastEntry = $this->entry()->setEntryData($_GET)->findPastEntry();
      Misc::showResult($pastEntry, 'views/students/update_past_entry.php', "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile."); 
    }

    public function updatePastEntry(){
      $update = $this->entry()->setEntryData($_POST)->updatePastEntry();
      if($update){
        $_SESSION['success'] = "Past entry has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#past_entry");
      }
      else{
        $_SESSION['error'] = "There was a problem updating Past entry! Please check if there is any field left empty! Is the timeframe already in another past entry?";
        header("Location:?controller=students&action=editPastEntry&uname=".$_POST['uname']."&id=".$_POST['id']);
      } 
    }

    public function deletePastEntry(){
      Auth::profileAccess($_GET['uname'], 3);
      $delete = $this->entry()->setEntryData($_GET)->deletePastEntry();
      if($delete){
        $_SESSION['success'] = "Past entry has been deleted";
        header("Location:?controller=students&action=showStudentProfile&uname=".$delete."#past_entry");
      }
      else{
        $_SESSION['error'] = "There was a problem deleting past entry! Please try again!";
        header("Location:?controller=students&action=showStudentProfile&uname=".$delete."#past_entry");
      } 
    }

    public function addFamilyMember(){
      Auth::profileAccess($_GET['uname'], 3);
      $studentData = $this->student()->setStudentData($_GET)->getInitialStudentData();
      if($studentData){
          $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "name"=>"", "relationship"=>"", "dob"=>"", "nationality"=>"", "occupation"=>"", "presentAddress"=>"", "permanentAddress"=>"", "residence_with_applicant"=>"", "school_employment_place"=>"", "residence_card_status"=>"", "residence_card_number"=>""));
          foreach ($allData as $data) {
            foreach($studentData['student'] as $student){
              require_once('views/students/add_family_member.php');  
            }
          }  
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }  
    }

    public function storeFamilyMember(){
      $store = $this->family()->setFamilyData($_POST)->storeFamily();
      if($store){
        $_SESSION['success'] = "Family member has been added";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#family_information");
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding family member! Please check if there is any field left empty! Is multiple family member possible in this relationship?";
        header("Location:?controller=students&action=addFamilyMember&uname=".$_POST['uname']);
      } 
    }

    public function editFamilyMember(){
      Auth::profileAccess($_GET['uname'], 3);
      $familymember = $this->family()->setFamilyData($_GET)->findFamilyMember();
      if($familymember){
        foreach($familymember['record'] as $record){
          require_once('views/students/update_family_member.php');  
        } 
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }  
    }

    public function updateFamilyMember(){
      $update = $this->family()->setFamilyData($_POST)->updateFamilyMember();
      if($update){
        $_SESSION['success'] = "Past entry has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#family_information");
      }
      else{
        $_SESSION['error'] = "There was a problem updating family member! Please check if there is any field left empty! Is multiple family member possible in this relationship?";
        header("Location:?controller=students&action=editFamilyMember&uname=".$_POST['uname']."&id=".$_POST['id']);
      } 
    }

    public function deleteFamilyMember(){
      Auth::profileAccess($_GET['uname'], 3);
      $delete = $this->family()->setFamilyData($_GET)->deleteFamilyMember();
      if($delete){
        $_SESSION['success'] = "Family member has been deleted";
        header("Location:?controller=students&action=showStudentProfile&uname=".$delete."#family_information");
      }
      else{
        $_SESSION['error'] = "There was a problem deleting family member! Please try again!";
        header("Location:?controller=students&action=showStudentProfile&uname=".$delete."#family_information");
      } 
    }

    public function editStudyPlan(){
      Auth::profileAccess($_GET['uname'], 3);
      $studentData = $this->student()->setStudentData($_GET)->getInitialStudentData();
      if($studentData){
          foreach($studentData['student'] as $student){
            require_once('views/students/update_study_plan.php');
          }
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }    
    }

    public function updateStudyPlan() {
      $update = $this->student()->setStudentData($_POST)->updateStudyPlan();
      if($update){
        $_SESSION['success'] = "Study plan has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#study_plan");
      }
      else{
        $_SESSION['error'] = "There was a problem updating study plan! Please try again!";
        header("Location:?controller=students&action=editStudentSupporter&uname=".$_POST['uname']);
      }  
    }

    public function editStudentSupporter(){
      Auth::profileAccess($_GET['uname'], 3);
      $studentData = $this->student()->setStudentData($_GET)->getInitialStudentData();
      if($studentData){
          foreach($studentData['student'] as $student){
            require_once('views/students/update_supporter_information.php');
          }
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }    
    }

    public function updateStudentSupporter() {
      $update = $this->student()->setStudentData($_POST)->updateStudentSupporter();
      if($update){
        $_SESSION['success'] = "Passport details has been updated";
        header("Location:?controller=students&action=showStudentProfile&uname=".$_POST['uname']."#supporter_info");
      }
      else{
        $_SESSION['error'] = "There was a problem updating supporter information! Please try again with correct inputs. Is there any field left empty?";
        header("Location:?controller=students&action=editStudentSupporter&uname=".$_POST['uname']);
      }  
    }

    public function showStudentPerformance(){
      Auth::profileAccess($_GET['uname'], 3);
      $findStudent = $this->student()->setStudentData($_GET)->getStudentProfile();
      if($findStudent){
          foreach($findStudent as $student){
            require_once('views/students/view_performance.php');
          }
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }    
    }

    public function showStudentAttachments(){
      Auth::profileAccess($_GET['uname'], 3);
      $findStudent = $this->student()->setStudentData($_GET)->getStudentProfile();
      if($findStudent){
          foreach($findStudent as $student){
            require_once('views/students/view_attachments.php');
          }
      }
      else{
        $errorMessage = "Student Profile for this user has not been created! <a href='?controller=students&action=createStudentProfile&uname=".$_GET['uname']."'>Click here</a> to create student profile.";
        require_once('views/auth/view_error_message.php');
      }    
    }

    public function deleteAttachment(){
      Auth::profileAccess($_GET['uname'], 3);
      $deleteAttachment = $this->attachment()->setAttachmentData($_GET)->deleteAttachment();
      if($deleteAttachment){
        $_SESSION['success'] = $deleteAttachment." has been deleted";
        header("Location:?controller=students&action=showStudentAttachments&uname=".$_GET['uname']);
      }
      else{
        $_SESSION['error'] = "There was a problem deleting ".$deleteAttachment."! Please try again!";
        header("Location:?controller=students&action=showStudentAttachments&uname=".$_GET['uname']);
      }    
    }

    public function savePDF(){
      Auth::profileAccess($_GET['uname'], 3);
      $pdf = new PDF();
      $title = $pdf->setStudentData($_GET)->generatePDFTitle();
      $header = $pdf->setStudentData($_GET)->generatePDFHeader();
      $footer = $pdf->generatePDFFooter();
      $getPDFData = $pdf->setStudentData($_GET)->generateStudentPDF();
      ob_clean();
      $savePDF = new mPDF();
      $savePDF->SetHTMLHeader($header);
      $savePDF->SetHTMLFooter($footer);
      $savePDF->SetTitle($title);
      $savePDF->WriteHTML($getPDFData); 
      $savePDF->Output($title.'.pdf', 'I');
      ob_end_flush();
      exit;   
    }

    public function generateBatchDetailsPDF(){
      Auth::profileAccess($_GET['uname'], 3);
      $pdf = new PDF();
      $title = $pdf->setStudentData($_GET)->setFoldername().'_Student Batch Details';
      $getPDFData = $pdf->setStudentData($_GET)->generateStudentBatchDetailsPDF();
      ob_clean();
      $savePDF = new mPDF();
      $savePDF->SetTitle($title);
      $savePDF->WriteHTML($getPDFData); 
      $savePDF->Output($title.'.pdf', 'I');
      ob_end_flush();
      exit;   
    }

    public function deleteStudent() {
      Auth::accessControl(array(3,4));
      $update = $this->student()->setStudentData($_GET)->deleteStudent();
      if($update){
        $_SESSION['success'] = "Student has been deleted";
        header("Location:?controller=students&action=allStudents");
      }
      else{
        $_SESSION['error'] = "There was a problem deleting this student! Please try again.";
        header("Location:?controller=students&action=allStudents");
      }  
    }

    public function advanced() {
      Auth::accessControl(array(4));
      require_once('views/students/advanced.php'); 
    }

    public function deleteAllStudents() {
      Auth::accessControl(array(2,3,4));
      $delete = $this->student()->deleteAllStudents();
      if($delete){
        $_SESSION['success'] = "All Students has been deleted";
        header("Location:?controller=students&action=advanced");
      }
      else{
        $_SESSION['error'] = "There was a problem deleting students! Please try again.";
        header("Location:?controller=students&action=advanced");
      }
    }

    public function import() {
      Auth::accessControl(array(2,3,4));
      $import = $this->student()->importExcel();
      if($import){
        $_SESSION['warning'] = "The database is successfully uploaded. ".$import['stored']." students out of ".$import['total']." students have been imported! Try again with different data if there is any user missing!";
        header("Location:?controller=students&action=advanced");  
      }
    }

    public function importStudentDatabases() {
      Auth::accessControl(array(3,4));
      $import = $this->student()->importStudentDatabases($_POST['query']);
      if($import){
        $_SESSION['warning'] = "The database is successfully uploaded. ".$import['stored']." ".$_POST['query']." out of ".$import['total']." ".$_POST['query']." have been imported! Try again with different data if there is any ".$_POST['query']." missing!";
        header("Location:?controller=students&action=advanced");  
      }
    }


  }

?>