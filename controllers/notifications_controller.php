<?php
	use App\User\Message;
  use App\User\Notification;
  use App\User\Auth;
  use App\Misc\Misc;


  class NotificationsController{

  	public function __construct() {
      Auth::authenticate();
      $newNotifcations = $this->Notification()->setData($_SESSION)->newNotifications();
      $userImage = Misc::checkImage('all_images/user_images/', $_SESSION["photo"]);
      $message = new Message();
      $getNewMessages = $message->setMessageData()->getNewMessages();
      require_once('views/layout/header.php');
      require_once('views/layout/sidebar_'.$_SESSION["role_name"].'.php');
    }

    private function Notification(){
      $notifcation = new Notification();
      return $notifcation;
    }
    
    public function allNotifications() {
      $notifcations = $this->Notification()->setData($_SESSION)->allNotifications(Misc::paginate_declare(10));
      Misc::showResult($notifcations['notifications'], 'views/notifications/index.php', 'No notifications found!', $notifcations['pagination']);
    }

    public function notificationRedirection() {
      $link = $this->Notification()->setData($_GET)->notificationRedirection();
      if($link){
        @header("location:".$link); 
      }
    }

    public function readAllNotifications() {
      $read = $this->Notification()->setData($_SESSION)->readAllNotifications();
      if($read){
        $_SESSION['success'] = "All notifications has been read";
      }
      else{
        $_SESSION['error'] = "There was a problem executing this function! Please try again!";
      }
      @header("location:?controller=notifications&action=allNotifications"); 
    }

  }
    

?>