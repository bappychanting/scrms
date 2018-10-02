<?php
	use App\User\User;
  use App\User\Auth;
  use App\User\Message;
  use App\User\Notice;
  use App\Batch\Batch;
  use App\Batch\BatchType;
  use App\Batch\BatchPeriod;
  use App\Batch\Exam;
  use App\Student\Student;
  use App\Student\Education;
  use App\Student\Score;
  use App\Student\Attachment;

  class JqueryController{
  		
		public function __construct() {
    	Auth::authenticate();
  	}

		public function homeSearch(){
      $links = Auth::initialLinks();
      echo json_encode($links);
    }

    public function chartData(){
      $data = Auth::chartData();
      echo json_encode($data);
    }

    public function searchUser(){
      $fetch_users = new User();
      $getUsers = $fetch_users->setData($_POST)->searchUser();
      echo json_encode($getUsers);
    }

    public function checkUsername(){
      $user = new User();
      $check = $user->setData($_POST)->checkUsername();
      if($check)
        echo json_encode("yes"); 
      else
        echo json_encode("no");
    }

    public function createExcel(){
      $fetch_users = new User();
      $users = $fetch_users->setData($_POST)->getSpecificUsers();
      foreach($users as $user){
          $jsonUsers[] = array('username'=>$user['username'], 'password'=>$user['password'], 'family_name'=>$user['family_name'], 'given_name'=>$user['given_name'], 'designation'=>$user['designation'], 'role'=>$user['role'], 'email'=>$user['email'], 'image'=>$user['image'], 'create_date'=>$user['create_date'], 'update_date'=>$user['update_date']);
      }
      echo json_encode($jsonUsers);
    }

    public function viewNewMessages(){
      $message = new Message();
      $messages = $message->setMessageData($_POST)->viewMessages(array('perpage'=>$_POST['counter'],'page'=>0,'start'=>0));
      echo json_encode($messages['messages']);
    }

    public function sendMessage(){
      $message = new Message();
      $store = $message->setMessageData($_POST)->storeMessage(); 
    }

    public function searchConversation() {
      $message = new Message();
      $getConversations = $message->setMessageData()->searchConversation($_POST['names']);
      echo json_encode($getConversations);
    }

    public function sortConversations() {
      if(empty($_POST['start']) || empty($_POST['limit'])){ $_POST['start'] = 0; $_POST['limit'] = 9; }  
      $message = new Message();
      $allConversations = $message->setMessageData()->getAllConversation('sort',$_POST['start'], $_POST['limit']);
      echo json_encode($allConversations);
    }

    public function allConversations() {
      if(empty($_POST['start']) || empty($_POST['limit'])){ $_POST['start'] = 0; $_POST['limit'] = 9; }  
      $message = new Message();
      $allConversations = $message->setMessageData()->getAllConversation('',$_POST['start'], $_POST['limit']);
      echo json_encode($allConversations);
    }

    public function suggestAcronym(){
      $batchType = new BatchType();
      $suggestions = $batchType->setData($_POST)->suggestAcronym();
      echo json_encode($suggestions);
    }

    public function validateBatchTime(){
      $period = new BatchPeriod();
      $data = $period->setData($_POST)->findBatchPeriod();
      if($data)
        echo json_encode($data);   
    }

    public function checkBatchAvailability(){
      $batch = new Batch();
      $check = $batch->setData($_POST)->checkBatchAvailability();
      if($check)
        echo json_encode("yes"); 
      else
        echo json_encode("no");   
    }

    public function checkBatchPeriodNameAvailability(){
      $batchPeriod = new BatchPeriod();
      $check = $batchPeriod->setData($_POST)->checkPeriodName();
      if($check)
        echo json_encode("yes"); 
      else
        echo json_encode("no");   
    }

    public function getRoll(){
      $student = new Student();
      $roll = $student->setStudentData($_POST)->calculateRoll();
      echo json_encode($roll); 
    }

    public function verifyRoll(){
      $student = new Student();
      $verify = $student->setStudentData($_POST)->verifyRoll();
      if($verify)
        echo json_encode("yes"); 
      else
        echo json_encode("no");
    }

    public function searchStudent(){
      $student = new Student();
      $getStudents = $student->setData($_POST)->searchStudent();
      echo json_encode($getStudents);
    }

    public function getStudentData(){
      $student = new Student();
      $getStudent = $student->setStudentData($_POST)->getInitialStudentData();
      echo json_encode($getStudent['student']);
    }

    public function getStudyStatuses(){
      $student = new Student();
      $getStudent = $student->setStudentData($_POST)->getInitialStudentData();
      echo json_encode($getStudent['study_statuses']);
    }

    public function updateStudyPurpose(){
      $student = new Student();
      $student->setStudentData($_POST)->updateStudentStudyPurpose();
    }

    public function updateAdditional(){
      $student = new Student();
      $student->setStudentData($_POST)->updateStudentAdditionalInfo();
    }

    public function updateStudyStatus(){
      $education = new Education();
      $education->setEducationData($_POST)->updateStudyStatus();
    }

    public function getStudyStatus(){
      $education = new Education();
      $status = $education->setEducationData($_POST)->getStudentStudyStatus();
      echo json_encode($status);
    }

    public function createStudentExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->allStudents();
      foreach($students as $student){
          $jsonStudents[] = array('user_id'=>$student['id'], 'batch'=>$student['batch'], 'roll'=>$student['roll'], 'fatherName'=>$student['fatherName'], 'motherName'=>$student['motherName'], 'nationality'=>$student['nationality'], 'dob'=>$student['dob'], 'sex'=>$student['sex'], 'contact1'=>$student['contact1'], 'contact2'=>$student['contact2'], 'contact3'=>$student['contact3'],  'presentAddress'=>$student['presentAddress'], 'permanentAddress'=>$student['permanentAddress'], 'passport_no'=>$student['passport_no'], 'passport_issue'=>$student['passport_issue'], 'passport_expiration'=>$student['passport_expiration'], 'study_status'=>$student['study_status'], 'school_to_enroll'=>$student['school_to_enroll'], 'study_subject'=>$student['study_subject'], 'study_plan_details'=>$student['study_plan_details'],  'supporter_name'=>$student['supporter_name'], 'supporter_relationship'=>$student['supporter_relationship'], 'supporter_address'=>$student['supporter_address'], 'supporter_contact'=>$student['supporter_contact'], 'supporter_income'=>$student['supporter_income'],  'supporter_expense'=>$student['supporter_expense'], 'mothod_of_payment'=>$student['mothod_of_payment'], 'support_other_students'=>$student['support_other_students'], 'study_purpose'=>$student['study_purpose'], 'additional'=>$student['additional'], 'create_date'=>$student['create_date'], 'update_date'=>$student['update_date']);
      }  
      echo json_encode($jsonStudents);
    }

    public function createEducationExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentBackup();
      foreach($students['education'] as $education){
          $jsonEducation[] = array('id'=>$education['id'], 'user_id'=>$education['user_id'], 'institude'=>$education['institude'], 'address'=>$education['address'], 'degree'=>$education['degree'], 'start_date'=>$education['start_date'], 'end_date'=>$education['end_date'], 'create_date'=>$education['create_date'], 'update_date'=>$education['update_date'], 'delete_date'=>$education['delete_date']);
      }  
      echo json_encode($jsonEducation);
    }

    public function createJapaneseLanguageExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentBackup();
      foreach($students['languageCertificate'] as $languageCertificate){
          $jsonJapaneseLanguage[] = array('id'=>$languageCertificate['id'], 'test_id'=>$languageCertificate['test_id'], 'user_id'=>$languageCertificate['id'], 'start_date'=>$languageCertificate['start_date'], 'end_date'=>$languageCertificate['end_date']);
      }  
      echo json_encode($jsonJapaneseLanguage);
    }

    public function createCarrerExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentBackup();
      foreach($students['carrer'] as $carrer){
          $jsonCarrer[] = array('user_id'=>$carrer['user_id'], 'organization'=>$carrer['organization'], 'address'=>$carrer['address'], 'occupation'=>$carrer['occupation'], 'start_date'=>$carrer['start_date'], 'end_date'=>$carrer['end_date'], 'create_date'=>$carrer['create_date'], 'update_date'=>$carrer['update_date'], 'delete_date'=>$carrer['delete_date']);
      }  
      echo json_encode($jsonCarrer);
    }

    public function createPastEntryExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentBackup();
      foreach($students['pastEntry'] as $pastEntry){
          $jsonPastEntry[] = array('id'=>$pastEntry['id'], 'user_id'=>$pastEntry['user_id'], 'residence_status'=>$pastEntry['residence_status'], 'entry_purpose'=>$pastEntry['entry_purpose'], 'start_date'=>$pastEntry['start_date'], 'end_date'=>$pastEntry['end_date'], 'create_date'=>$pastEntry['create_date'], 'update_date'=>$pastEntry['update_date'], 'delete_date'=>$pastEntry['delete_date']);
      }  
      echo json_encode($jsonPastEntry);
    }

    public function createFamilyInformationExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentBackup();
      foreach($students['family'] as $family){
          $jsonFamilyInformation[] = array('id'=>$family['id'], 'user_id'=>$family['id'], 'relationship'=>$family['relationship'], 'name'=>$family['name'], 'dob'=>$family['dob'], 'nationality'=>$family['nationality'], 'occupation'=>$family['occupation'], 'present_address'=>$family['present_address'], 'permanent_address'=>$family['permanent_address'], 'residence_with_applicant'=>$family['residence_with_applicant'], 'school_employment_place'=>$family['school_employment_place'], 'residence_card_status'=>$family['residence_card_status'],  'residence_card_number'=>$family['residence_card_number'], 'create_date'=>$family['create_date'], 'update_date'=>$family['update_date'], 'delete_date'=>$family['delete_date']);
      }  
      echo json_encode($jsonFamilyInformation);
    }

    public function createScoreExcel(){
      $get_scores = new Score();
      $scores = $get_scores->getAllScores();
      foreach($scores as $score){
          $jsonScores[] = array('Batch'=>$score['acronym']."-".$score['period'][0]."-".$score['batch_number'], 'Exam'=>$score['title'], 'Exam Max Score'=>$score['max_score'], 'Exam Description'=>$score['description'], 'Exam Date'=>date("F d (l), Y", $score['exam_date']), 'Student'=>$score['family_name'].' '.$score['given_name'], 'Student Roll'=>$score['roll'], 'Student Score'=>$score['score'], 'Examine&#39;s Comment'=>$score['exam_comment'], 'Score Date'=> date("F d (l), Y", strtotime($score['update_date'])));
      }  
      echo json_encode($jsonScores);
    }

    public function createDegreeExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentDatabases();
      foreach($students['degrees'] as $degree){
          $jsonDegrees[] = array('name'=>$degree['name']);
      }  
      echo json_encode($jsonDegrees);
    }

    public function createLevelExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentDatabases();
      foreach($students['japanese_language_levels'] as $level){
          $jsonLevels[] = array('name'=>$level['name']);
      }  
      echo json_encode($jsonLevels);
    }

    public function createTestExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentDatabases();
      foreach($students['japanese_language_tests'] as $test){
          $jsonTests[] = array('name'=>$test['name']);
      }  
      echo json_encode($jsonTests);
    }

    public function createRelationshipExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentDatabases();
      foreach($students['relationships'] as $relationship){
          $jsonRelationships[] = array('name'=>$relationship['name'], 'type'=>$relationship['type']);
      }  
      echo json_encode($jsonRelationships);
    }

    public function createStatusExcel(){
      $fatch_students = new Student();
      $students = $fatch_students->studentDatabases();
      foreach($students['study_statuses'] as $study_status){
          $jsonStatus[] = array('name'=>$study_status['name']);
      }  
      echo json_encode($jsonStatus);
    }

    public function uploadAttachment(){
      $attachment = new Attachment();
      $upload = $attachment->setAttachmentData($_POST)->uploadAttachment();
      foreach ($upload as $message) {
        echo $message['message'];
      }  
      exit; 
    }

    public function getAttachments(){
      $student = new Student();
      $findStudent = $student->setStudentData($_POST)->getStudentProfile();
      if($findStudent){
        foreach($findStudent as $student){
          if(!empty($student['attachments'])) {
            echo json_encode($student['attachments']);
          } 
        }
      } 
    }

    public function examScores(){
      $exam = new Exam();
      $participants = $exam->setExamData($_POST)->getAllParticipants();
      foreach($participants as $participant){
          $score[] = array('Batch'=> $participant['acronym']."-".$participant['period'][0]."-".$participant['batch_number'], 'Exam' => $participant['exam'], 'Exam Title'=>$participant['title'], 'Roll'=> $participant['roll'], 'Name'=>$participant['family_name'].' '.$participant['given_name'], 'Score'=>$participant['score'], 'Against'=>$participant['max_score'], 'Comment'=>$participant['exam_comment'], 'Date' => date("F d (l), Y", strtotime($participant['update_date'])));
      }  
      echo json_encode($score);
    }

    public function searchNotice(){
      $notice = new Notice();
      $getNotices = $notice->setData($_POST)->searchNotice();
      echo json_encode($getNotices);
    }
    
	}
?>  