<?php
	use App\User\Message;
  use App\User\Notification;
  use App\User\Auth;
  use App\Misc\Misc;


  class MessagesController{

  	public function __construct() {
      Auth::authenticate();
      $notifcation = new Notification();
      $newNotifcations = $notifcation->setData($_SESSION)->newNotifications();
      $userImage = Misc::checkImage('all_images/user_images/', $_SESSION["photo"]);
      $getNewMessages = $this->Message()->setMessageData()->getNewMessages();
      require_once('views/layout/header.php');
      require_once('views/layout/sidebar_'.$_SESSION["role_name"].'.php');
    }

    private function Message(){
      $message = new Message();
      return $message;
    }
    
    public function viewMessages() {
      $reciever = $this->Message()->setData($_GET)->getReciever();
      if($reciever){
        $messages = $this->Message()->setMessageData($_GET)->viewMessages(Misc::paginate_declare(6));
        $viewed = $this->Message()->setMessageData($_GET)->getView();
        require_once('views/messages/index.php');
      }
      else{
        require_once('views/auth/emptyResult.php');
      }
    }

    public function allConversations() {
      $allConversations = $this->Message()->setMessageData()->getAllConversation();
      Misc::showResult($allConversations, 'views/messages/conversations.php');
    }

    public function searchConversation() {
      if(empty($_POST['names'])) { $_POST['names']=''; } 
      $allStaff = $this->Message()->setMessageData()->searchConversation($_POST['names']);
      Misc::showResult($allStaff, 'views/messages/all_staff.php');  
    }

    public function allStaff() {
      $allStaff = $this->Message()->getStaff();
      Misc::showResult($allStaff, 'views/messages/all_staff.php');
    }

    public function deleteMessage() {
      $delete = $this->Message()->setMessageData($_GET)->deleteMessage();
      if($delete['status']){
        $_SESSION['success'] =  "Message has been deleted";
        header("Location:?controller=messages&action=viewMessages&uname=".$delete['name']);
      }
    }

    public function deleteConversation() {
      $rearUser = $this->Message()->setMessageData($_GET)->deleteConversation();
      if($rearUser){
        $_SESSION['success'] =  "Conversation has been deleted";
        header("Location:?controller=messages&action=viewMessages&uname=".$rearUser); 
      }
    }

  }
    

?>