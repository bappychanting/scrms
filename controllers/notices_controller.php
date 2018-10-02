<?php
  use App\User\Message;
  use App\User\Notification;
  use App\User\Auth;
  use App\User\Notice;
  use App\Misc\Misc;

  class NoticesController {

    public function __construct() {
      Auth::authenticate();
      $notification = new Notification();
      $newNotifcations = $notification->setData($_SESSION)->newNotifications();
      $userImage = Misc::checkImage('all_images/user_images/', $_SESSION["photo"]);
      $message = new Message();
      $getNewMessages = $message->setMessageData()->getNewMessages();
      require_once('views/layout/header.php');
      require_once('views/layout/sidebar_'.$_SESSION["role_name"].'.php');
    }

    private function Notice(){
      $notice = new Notice();
      return $notice;
    }
    
    public function allNotices() {
      $notices = $this->Notice()->allNotices(Misc::paginate_declare(10));
      Misc::showResult($notices['notices'], 'views/notices/index.php', 'No Notices Found!', $notices['pagination']);
    }

    public function viewNotice() {
      $notice = $this->Notice()->setData($_GET)->viewNotice();
      Misc::showResult($notice, 'views/notices/view_notice.php');
    }

    public function viewComments() {
      $comments = $this->Notice()->setData($_GET)->viewComments(Misc::paginate_declare(10));
      Misc::showResult($comments['comments'], 'views/notices/view_comments.php', 'No Comments Found!', $comments['pagination']);
    }

    public function searchNotice(){
      $notice = $this->Notice()->setData($_POST)->searchNotice();
      Misc::showResult($notice, 'views/notices/search_notice.php');
    }

    public function searchNoticebyDate(){
      if(empty($_POST['start_date']) || empty($_POST['end_date'])){
        $_POST['start_date'] = ''; $_POST['end_date'] = '';
      }
      $notice = $this->Notice()->searchNoticebyDate($_POST['start_date'], $_POST['end_date']); 
      Misc::showResult($notice, 'views/notices/search_notice.php');
    }

    public function addNotice() {
      Auth::accessControl(array(3,4));
      $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "title"=>"", "details"=>"")); 
      foreach ($allData as $data){
        require_once('views/notices/add_notice.php');
      }
    }

    public function storeNotice() {
      $storeNotice = $this->Notice()->setData($_POST)->storeNotice();
      if($storeNotice){
        $_SESSION['success'] = "Notice has been added";
        header("Location:?controller=notices&action=allNotices");
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding this notice! Please try again! Is there any field left empty?";
        header("Location:?controller=notices&action=addNotice");
      }
    }

    public function storeComment() {
      $storeNotice = $this->Notice()->setData($_POST)->storeComment();
      if($storeNotice){
        $_SESSION['success'] = "Your comment has been added";
        header("Location:?controller=notices&action=viewComments&id=".$_POST['id']);
      }
      else{
        $_SESSION['error'] = "There was a problem adding this comment! Please try again! Is the comment field empty?";
        header("Location:?controller=notices&action=viewNotice&id=".$_POST['id']);
      }
    }

    public function editNotice() {
      Auth::accessControl(array(3,4));
      $notice = $this->Notice()->setData($_GET)->viewNotice();
      Misc::showResult($notice, 'views/notices/update_notice.php');
    }

    public function editComment() {
      $comment = $this->Notice()->setData($_GET)->getComment();
      Misc::showResult($comment, 'views/notices/update_comment.php');
    }

    public function updateNotice() {
      $update = $this->Notice()->setData($_POST)->updateNotice();
      if($update){
        $_SESSION['success'] = "Notice has been updated";
        header("Location:?controller=notices&action=viewNotice&id=".$_POST['id']);
      }
      else{
        $_SESSION['error'] = "There was a problem updating Notice! Please try again! Is there any field left empty?";
        header("Location:?controller=notices&action=editNotice&id=".$_POST['id']);
      }
    }

    public function updateComment() {
      $update = $this->Notice()->setData($_POST)->updateComment();
      if($update){
        $_SESSION['success'] = "Comment has been updated";
        header("Location:?controller=notices&action=viewComments&id=".$_POST['noitce_id']);
      }
      else{
        $_SESSION['error'] = "There was a problem updating Comment! Please try again! Is there any field left empty?";
        header("Location:?controller=notices&action=editComment&id=".$_POST['id']);
      }
    }

    public function deleteNotice() {
      Auth::accessControl(array(3,4));
      $delete = $this->Notice()->setData($_GET)->deleteNotice();
      if($delete){
        $_SESSION['success'] =  "Notice has been deleted";
        header("Location:?controller=notices&action=allNotices");
      }
    }

    public function deleteComment() {
      $delete = $this->Notice()->setData($_GET)->deleteComment();
      if($delete){
        $_SESSION['success'] =  "Comment has been deleted";
        header("Location:?controller=notices&action=viewComments&id=".$delete);
      }
      else{
        header("Location:?controller=auth&action=error");
      }
    }

  }
?>