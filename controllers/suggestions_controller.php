<?php
  use App\User\Message;
  use App\User\Notification;
  use App\User\Auth;
  use App\User\Suggestion;
  use App\Misc\Misc;

  class SuggestionsController {

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

    private function Suggestion(){
      $suggestion = new Suggestion();
      return $suggestion;
    }
    
    public function allSuggestions() {
      Auth::accessControl(array(4));
      $suggestions = $this->Suggestion()->allSuggestions(Misc::paginate_declare(10));
      Misc::showResult($suggestions['suggestions'], 'views/suggestions/index.php', 'No Suggestions Found!', $suggestions['pagination']);
    }

    public function studentSuggestions() {
      if($_SESSION['role'] == 4){
        $suggestions = $this->Suggestion()->setData($_SESSION)->studentSuggestions(Misc::paginate_declare(10));
      }
      else{
        $suggestions = $this->Suggestion()->setData($_GET)->studentSuggestions(Misc::paginate_declare(10));
      }
      Misc::showResult($suggestions['suggestions'], 'views/suggestions/student_suggestions.php', 'No Suggestions Found!', $suggestions['pagination']);
    }

    public function viewSuggestion() {
      $suggestion = $this->Suggestion()->setData($_GET)->viewSuggestion();
      Misc::showResult($suggestion, 'views/suggestions/view_suggestion.php');
    }

    public function addSuggestion() {
      $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "title"=>"", "details"=>"")); 
      foreach ($allData as $data){
        require_once('views/suggestions/add_suggestion.php');
      }
    }

    public function storeSuggestion() {
      $storeSuggestion = $this->Suggestion()->setData($_POST)->storeSuggestion();
      if($storeSuggestion){
        $_SESSION['success'] = "Suggestion has been added";
        header("Location:?controller=suggestions&action=studentSuggestions");
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding this Suggestion! Please try again! Is there any field left empty?";
        header("Location:?controller=suggestions&action=addSuggestion");
      }
    }

    public function editSuggestion() {
      $suggestion = $this->Suggestion()->setData($_GET)->viewSuggestion();
      Misc::showResult($suggestion, 'views/suggestions/update_suggestion.php');
    }

    public function updateSuggestion() {
      $update = $this->Suggestion()->setData($_POST)->updateSuggestion();
      if($update){
        $_SESSION['success'] = "Notice has been updated";
        header("Location:?controller=suggestions&action=viewSuggestion&id=".$_POST['id']);
      }
      else{
        $_SESSION['error'] = "There was a problem updating suggestion! Please try again! Is there any field left empty?";
        header("Location:?controller=suggestions&action=editSuggestion&id=".$_POST['id']);
      }
    }

    public function deleteSuggestion() {
      $delete = $this->Suggestion()->setData($_GET)->deleteSuggestion();
      if($delete){
        $_SESSION['success'] =  "Suggestion has been deleted";
        if($_SESSION['role'] == 4){
          header("Location:?controller=suggestions&action=studentSuggestions");
        }
        else{
          header("Location:?controller=suggestions&action=allSuggestions");
        }
      }
    }

    public function viewComments() {
      $comments = $this->Suggestion()->setData($_GET)->viewComments(Misc::paginate_declare(10));
      Misc::showResult($comments['comments'], 'views/suggestions/view_comments.php', 'No Comments Found!', $comments['pagination']);
    }

    public function storeComment() {
      $storeNotice = $this->Suggestion()->setData($_POST)->storeComment();
      if($storeNotice){
        $_SESSION['success'] = "Your comment has been added";
        header("Location:?controller=suggestions&action=viewComments&id=".$_POST['id']);
      }
      else{
        $_SESSION['error'] = "There was a problem adding this comment! Please try again! Is the comment field empty?";
        header("Location:?controller=suggestions&action=viewSuggestion&id=".$_POST['id']);
      }
    }

     public function editComment() {
      $comment = $this->Suggestion()->setData($_GET)->getComment();
      Misc::showResult($comment, 'views/suggestions/update_comment.php');
    }

    public function updateComment() {
      $update = $this->Suggestion()->setData($_POST)->updateComment();
      if($update){
        $_SESSION['success'] = "Comment has been updated";
        header("Location:?controller=suggestions&action=viewComments&id=".$_POST['suggestion_id']);
      }
      else{
        $_SESSION['error'] = "There was a problem updating Comment! Please try again! Is there any field left empty?";
        header("Location:?controller=suggestions&action=editComment&id=".$_POST['id']);
      }
    }

    public function deleteComment() {
      $delete = $this->Suggestion()->setData($_GET)->deleteComment();
      if($delete){
        $_SESSION['success'] =  "Comment has been deleted";
        header("Location:?controller=suggestions&action=viewComments&id=".$delete);
      }
      else{
        header("Location:?controller=auth&action=error");
      }
    }

  }
?>