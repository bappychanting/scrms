<?php  
  use App\Batch\ClassRoom;
  use App\Batch\BatchType;
  use App\Batch\BatchPeriod;
  use App\Batch\Batch;
  use App\Batch\Exam;
  use App\Batch\Attendance;
  use App\User\Notification;
  use App\User\Message;
  use App\User\Auth;
  use App\Misc\Misc;

  class BatchesController{

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

    private function classRoom(){
      $classRoom = new ClassRoom();
      return $classRoom;
    }

    private function batchType(){
      $batchType = new BatchType();
      return $batchType;
    }

    private function batchPeriod(){
      $batchPeriod = new BatchPeriod();
      return $batchPeriod;
    }

    private function batch(){
      $batch = new Batch();
      return $batch;
    }

    private function exam(){
      $exam = new Exam();
      return $exam;
    }

    private function attendance(){
      $attendance = new Attendance();
      return $attendance;
    }

    public function manageClassRoom(){
      Auth::accessControl(array(3,4));
      $classrooms = $this->classRoom()->allClasseRooms();
      $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "className"=>"")); 
      foreach ($allData as $data){
        require_once('views/batches/class_room.php');
      }
    }

    public function storeClassRoom(){
      $storeClassrooms = $this->classRoom()->setData($_POST)->storeClasseRoom();
      if($storeClassrooms){
        $_SESSION['success'] = "Classroom has been added";
        header("Location:?controller=batches&action=manageClassRoom");
      }
      else{
        $_SESSION['error'] = "There was a problem adding this classroom! Please try again with a different classroom name! Is there any field left empty?";
        header("Location:?controller=batches&action=manageClassRoom");
      }
    }

    public function editClassRoom(){
      $findClassroom = $this->classRoom()->setData($_GET)->findClasseRoom();
      Misc::showResult($findClassroom, 'views/batches/edit_class_room.php');
    }

    public function updateClassRoom(){
      $updateClassRoom = $this->classRoom()->setData($_POST)->updateClasseRoom();
      if($updateClassRoom){
        $_SESSION['success'] = "Classroom has been updated";
        header("Location:?controller=batches&action=manageClassRoom");
      }
      else{
        $_SESSION['error'] = "There was a problem updating the classroom! Please try again with a different classroom name! Is there any field left empty?";
        header("Location:?controller=batches&action=editClassRoom&id=".$_POST['id']);
      }
    }

    public function deleteClassRoom(){
        Auth::accessControl(array(3,4));
        $deleteClassRoom = $this->classRoom()->setData($_GET)->deleteClassRoom();
        if($deleteClassRoom){
          $_SESSION['success'] = "Class room has been deleted";
        }
        else{
          $_SESSION['error'] = "There was a problem deleting Classroom!";
        }
        header("Location:?controller=batches&action=manageClassRoom");
    }

    public function manageBatchType(){
      Auth::accessControl(array(3,4));
      $batchTypes = $this->batchType()->allBatchTypes();
      $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "type"=>"", "acronym"=>"")); 
      foreach ($allData as $data){
        require_once('views/batches/batch_type.php');
      }
    }

    public function storeBatchType(){
      $storeBatchType = $this->batchType()->setData($_POST)->storeBatchType();
      if($storeBatchType){
        $_SESSION['success'] = "Batch Type has been added";
        header("Location:?controller=batches&action=manageBatchType");
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding Batch Type! Please try again with a different type or acronym! Is there any field left empty?";
        header("Location:?controller=batches&action=manageBatchType");
      }
    }

    public function editBatchType(){
      $findBatchType = $this->batchType()->setData($_GET)->findBatchType();
      Misc::showResult($findBatchType, 'views/batches/edit_batch_type.php');
    }

    public function updateBatchType(){
      $updateBatchType = $this->batchType()->setData($_POST)->updateBatchType();
      if($updateBatchType){
        $_SESSION['success'] = "Batch Type has been updated";
        header("Location:?controller=batches&action=manageBatchType");
      }
      else{
        $_SESSION['error'] = "There was a problem updating Batch Type! Please try again with a different type or acronym! Is there any field left empty?";
        header("Location:?controller=batches&action=editBatchType&id=".$_POST['id']);
      }
    }

    public function deleteBatchType(){
      Auth::accessControl(array(3,4));
      $deleteBatchType = $this->batchType()->setData($_GET)->deleteBatchType();
      if($deleteBatchType){
        $_SESSION['success'] = "Batch Type has been deleted";
      }
      else{
        $_SESSION['error'] = "There was a problem deleting Batch Type!";
      }
      header("Location:?controller=batches&action=manageBatchType");
    }

    public function manageBatchPeriod(){
      Auth::accessControl(array(3,4));
      $batchPeriods = $this->batchPeriod()->allBatchPeriods();
      $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "period"=>"", "start_time"=>"", "expandStartTime"=>"", "end_time"=>"", "exapndEndTime"=>"")); 
      foreach ($allData as $data){
        require_once('views/batches/batch_period.php');
      }
    }

    public function storeBatchPeriod(){
      $storeBatchPeriod = $this->batchPeriod()->setData($_POST)->storeBatchPeriod()->updatePeriodOfBatches();
      if($storeBatchPeriod){
        $_SESSION['success'] = "Batch Period has been added";
        header("Location:?controller=batches&action=manageBatchPeriod");
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding Batch Period! Please try again with a different period name, start and end time! Is there any field left empty?";
        header("Location:?controller=batches&action=manageBatchPeriod");
      }
    }

    public function editBatchPeriod(){
      $findBatchPeriod = $this->batchPeriod()->setData($_GET)->findBatchPeriod();
      Misc::showResult($findBatchPeriod, 'views/batches/edit_batch_period.php');
    }

    public function updateBatchPeriod(){
      $updateBatchPeriod = $this->batchPeriod()->setData($_POST)->updateBatchPeriod()->updatePeriodOfBatches();
      if($updateBatchPeriod){
        $_SESSION['success'] = "Batch Period has been updated";
        header("Location:?controller=batches&action=manageBatchPeriod");
      }
      else{
        $_SESSION['error'] = "There was a problem updating Batch Period! Please try again with a different period name, start and end time! Is there any field left empty?";
        header("Location:?controller=batches&action=editBatchPeriod&id=".$_POST['id']);
      }
    }

    public function deleteBatchPeriod(){
      Auth::accessControl(array(3,4));
      $deleteBatchPeriod = $this->batchPeriod()->setData($_GET)->deleteBatchPeriod();
      if($deleteBatchPeriod){
        $_SESSION['success'] = "Batch Period has been deleted";
      }
      else{
        $_SESSION['error'] = "There was a problem deleting Batch Period!";
      }
      header("Location:?controller=batches&action=manageBatchPeriod");
    }

    public function allBatches(){
      Auth::accessControl(array(4));
      $allBatchData = $this->batch()->allBatches();
      Misc::showResult($allBatchData, 'views/batches/index.php');  
    }

    public function addBatch(){
      Auth::accessControl(array(3,4));
      $allBatchData = $this->batch()->allBatchData();
      if($allBatchData){
        $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "number"=>"", "type"=>"", "teacher"=>"", "days"=>array(1, 3, 5), "period"=>"", "classroom"=>"", "start_time"=>"", "end_time"=>"", "start_date"=>"", "end_date"=>"")); 
        foreach ($allData as $data) {          
          require_once('views/batches/add_batch.php'); 
        }
      }
      else{
        $errorMessage = "Initial batch data are not set! Please add <a href='?controller=batches&action=manageBatchType'>batch types</a>, <a href='#'>periods</a> and batch days first.";
        require_once('views/auth/view_error_message.php');  
      }
    }

    public function storeBatch(){
      $storeBatch = $this->batch()->setData($_POST)->storeBatch()->updateBatchDay();
      if($storeBatch){
        $_SESSION['success'] = "Batch has been added";
        header("Location:?controller=batches&action=assignTeacherClassroom&id=".$storeBatch);
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding this Batch! Please try changing batch type or number. Is there any field left empty?";
        header("Location:?controller=batches&action=addBatch");
      }
    }

    public function viewBatch(){
      Auth::accessControl(array(4));
      $viewBatch = $this->batch()->setData($_GET)->findBatch();
      Misc::showResult($viewBatch, 'views/batches/view_batch_details.php', "Teacher and Classroom for this batch is unassigned! <a href='?controller=batches&action=assignTeacherClassroom&id=".$_GET['id']."'>Click here</a> to assign a teacher and a classroom. To update batch details <a href='?controller=batches&action=editBatch&id=".$_GET['id']."'>click here</a>.");     
    }

    public function assignTeacherClassroom(){
      Auth::accessControl(array(3,4));
      $batchData = $this->batch()->setData($_GET)->getTeachersAndClasses();
      if($batchData){
        require_once('views/batches/assign_teacher_and_class.php'); 
      }
      else{
        $errorMessage = "No available teacher and classroom found for this batch! Try <a href='?controller=users&action=addUser'>adding new teachers</a> and <a href='?controller=batches&action=manageClassRoom'>classrooms</a>, or <a href='?controller=batches&action=editBatch&id=".$_GET['id']."'>update batch information</a> according to <a href='?controller=schedule&action=viewSchedule'>class schedule</a>.";
        require_once('views/auth/view_error_message.php'); 
      }
    }

    public function updateTeacherClassroom(){
      $assignTeacherClassroom = $this->batch()->setData($_POST)->assignTeacherAndClassroom();
      if($assignTeacherClassroom){
        $_SESSION['success'] = "Teacher and Classroom has been assigned!";
        header("Location:?controller=batches&action=viewBatch&id=".$_POST['id']);
      }
      else{
        $_SESSION['error'] = "There was a problem assignning this teacher and classroom! Please try again!";
        header("Location:?controller=batches&action=assignTeacherClassroom&id=".$_POST['id']);
      }
    }

    public function unassignTeacherClassroom(){
      Auth::accessControl(array(3,4));
      $unassignTeacherClassroom = $this->batch()->setData($_GET)->unassignTeacherClassroom();
      $_SESSION['success'] = "Teacher and Classroom has been unassigned!";
      header("Location:?controller=batches&action=assignTeacherClassroom&id=".$_GET['id']);

    }

    public function allExams(){
      $exams = $this->exam()->setExamData($_GET)->allExams();
      Misc::showResult($exams, 'views/batches/all_exams.php'); 
    }

    public function addExam(){
      $authenticate = $this->exam()->setExamData($_GET)->checkExamTakerValidity();
      if($authenticate){
        $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "title"=>"", "score"=>"", "description"=>"", "exam_date"=>"", "exam_time"=>"")); 
        foreach ($allData as $data) {   
          foreach ($authenticate as $batch) {
            require_once('views/batches/add_exam.php'); 
          }       
        }
      }
      else{
        $errorMessage = "You are not allowed to access this function!";
        require_once('views/auth/view_error_message.php');  
      }
    }

    public function storeExam(){
      $store = $this->exam()->setExamData($_POST)->storeExam();
      if($store){
        $_SESSION['success'] = "Exam has been added";
        header("Location:?controller=batches&action=allExams&id=".$_POST['id']);
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding this Exam! Please try changing exam date. Is there any field left empty?";
        header("Location:?controller=batches&action=addExam&id=".$_POST['id']);
      }
    }

    public function getParticipants(){
      $participants = $this->exam()->setExamData($_GET)->getAllParticipants();
      Misc::showResult($participants, 'views/batches/get_participants.php'); 
    }

    public function storeScores(){
      $this->exam()->setExamData($_POST)->storeScores();
      $_SESSION['success'] = "Scores have been updated! Please try again if there is any data missing.";
      header("Location:?controller=batches&action=getParticipants&id=".$_POST['id_redirect']."&exam=".$_POST['exam_redirect']); 
    }

    public function editExam(){
      $exam = $this->exam()->setExamData($_GET)->findExam();
      Misc::showResult($exam, 'views/batches/edit_exam.php'); 
    }

    public function updateExam(){
      $update = $this->exam()->setExamData($_POST)->updateExam();
      if($update){
        $_SESSION['success'] = "Exam has been updated";
        header("Location:?controller=batches&action=allExams&id=".$_POST['id']); 
      }
      else{
        $_SESSION['error'] = "There was a problem updating this Exam! Please try changing exam date. Is there any field left empty?";
        header("Location:?controller=batches&action=editExam&&id=".$_POST['id']."&exam=".$_POST['exam']); 
      }   
    }

    public function deleteExam(){
      $delete = $this->exam()->setExamData($_GET)->deleteExam();
      if($delete){
        $_SESSION['success'] = "Exam has been updated";
        header("Location:?controller=batches&action=allExams&id=".$_GET['id']); 
      }
      else{
        $_SESSION['error'] = "There was a problem deleting this Exam! Please try again!";
        header("Location:?controller=batches&action=allExams&&id=".$_GET['id']); 
      }   
    }

    public function viewAttendance(){
        $data = $this->attendance()->setData($_GET)->getAllAttendance();
        Misc::showResult($data, 'views/batches/view_batch_attendance.php'); 
    }

    public function addAttendance(){
      $authenticate = $this->attendance()->setData($_GET)->checkExamTakerValidity();
      if($authenticate){
        $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "attendance_date"=>"")); 
        foreach ($allData as $data) {   
          foreach ($authenticate as $batch) {
            require_once('views/batches/add_attendance.php'); 
          }       
        }
      }
      else{
        $errorMessage = "You are not allowed to access this function!";
        require_once('views/auth/view_error_message.php');  
      }
    }

    public function storeAttendance(){
      $store = $this->attendance()->setData($_POST)->storeAttendance();
      if($store){
        $_SESSION['success'] = "New Attendace Date has been added";
        header("Location:?controller=batches&action=editAttendance&id=".$this->attendance()->getLastAttendance());
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding this Attendance Date! Please try another date. Is there any field left empty?";
        header("Location:?controller=batches&action=addAttendance&id=".$_POST['id']);
      }
    }

    public function editAttendance(){
      $data = $this->attendance()->setData($_GET)->getAttendance();
      Misc::showResult($data, 'views/batches/edit_attendance.php', 'No Students Found On That Date'); 
    }

    public function updateAttendance(){
      $this->attendance()->setData($_POST)->updateAttendance();
      $_SESSION['success'] = "Attendance has been updated";
      header("Location:?controller=batches&action=editAttendance&id=".$_POST['attendance_date_id']);
    }

    public function deleteAttendance(){ 
      $delete = $this->attendance()->setData($_GET)->deleteAttendance();
      if($delete){
          $_SESSION['success'] = "Schedule date has been deleted!";
      }
      else{
        $_SESSION['error'] = "There was a problem deleting this schedule date!";
      }
      header("Location:?controller=batches&action=viewAttendance&id=".$delete); 
    }

    public function editBatch(){
      Auth::accessControl(array(3,4));
      $allBatchData = $this->batch()->allBatchData();
      if($allBatchData){
        $editBatch = $this->batch()->setData($_GET)->findBatch('edit');
        require_once('views/batches/edit_batch_details.php'); 
      }
      else{
        $errorMessage = "Initial batch data are not set! Please add <a href='?controller=batches&action=manageBatchType'>batch types</a>, <a href='?controller=batches&action=manageBatchPeriod'>periods</a> and batch days first.";
        require_once('views/auth/view_error_message.php');  
      }  
    }

    public function updateBatch(){ 
      $updateBatch = $this->batch()->setData($_POST)->unassignTeacherClassroom()->updateBatch()->updateBatchDay();
      if($updateBatch){
        $_SESSION['success'] = "Batch has been updated!";
        header("Location:?controller=batches&action=viewBatch&id=".$_POST['id']);
      }
      else{
        $errorMessage = "There was a problem updating this batch. Please try again with different batch type or number. Is there any field left empty?";
        header("Location:?controller=batches&action=editBatch&id=".$_POST['id']);
      } 
    }

    public function deleteBatch(){ 
      Auth::accessControl(array(3,4));
      $deleteBatch = $this->batch()->setData($_GET)->deleteBatch();
      if($deleteBatch){
          $_SESSION['success'] = "Batch has been deleted!";
      }
      else{
        $_SESSION['error'] = "There was a problem deleting this batch!";
      }
      header("Location:?controller=batches&action=allBatches"); 
    }

    public function searchByPeriod(){
      Auth::accessControl(array(4));
      $searchByPeriod = $this->batch()->setData($_GET)->searchByPeriod();
      Misc::showResult($searchByPeriod, 'views/batches/index.php'); 
    }

    public function searchByType(){
      Auth::accessControl(array(4));
      $searchByPeriod = $this->batch()->setData($_GET)->searchByType();
      Misc::showResult($searchByPeriod, 'views/batches/index.php'); 
    }

    public function searchByClassroom(){
      Auth::accessControl(array(4));
      $searchByPeriod = $this->batch()->setData($_GET)->searchByClassroom();
      Misc::showResult($searchByPeriod, 'views/batches/index.php'); 
    }

  }

?>