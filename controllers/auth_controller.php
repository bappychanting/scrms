<?php
  use App\User\User;
  use App\User\Auth;
  use App\User\Message;
  use App\User\Notification;
  use App\User\Notice;
  use App\Misc\Misc;
  
  class AuthController {

    private function required(){
      $this->Auth()->authenticate();
      $_SESSION['allRoles'] = $this->Auth()->setData($_SESSION)->getRoles();
      $userImage = Misc::checkImage('all_images/user_images/', $_SESSION["photo"]);
      $notifcation = new Notification();
      $newNotifcations = $notifcation->setData($_SESSION)->newNotifications();
      $message = new Message();
      $getNewMessages = $message->setMessageData()->getNewMessages();
      require_once('views/layout/header.php');
      require_once('views/layout/sidebar_'.$_SESSION["role_name"].'.php');
    }

    private function Auth(){
      $auth = new Auth();
      return $auth;
    }

    public function frontpage() {
      if (!empty($_SESSION['info'])){
        include("models/Captcha/simple-php-captcha.php");
        $_SESSION['captcha'] = simple_php_captcha();
        require_once('views/auth/resubmit.php');
      }
      else{
        require_once('views/auth/index.php');
        session_destroy();
      }
    }

    public function check_captcha() {
      include("models/Captcha/simple-php-captcha.php");
      if(isset($_POST['submitcaptcha'])){
        if($_POST['check'] ===  $_SESSION['captcha']['code']){
          unset ($_SESSION['info']);
           @header("location:?controller=auth&action=frontpage");
        }
        else{
          $_SESSION['info'] = "Your input didn't match the captcha. Try again!";  
          @header("location:?controller=auth&action=frontpage");
        }
      }
      else{
        @header("location:?controller=auth&action=frontpage");
      }
    }     

    public function signin() {
      $signin = $this->Auth()->setData($_POST)->signin();
      if($signin){
        @header('location:?controller=auth&action=home');
      }
      else{
        @header('location:?controller=auth&action=frontpage'); 
      }
    }

    public function home() {
      self::required();
      $dashboardData = $this->Auth()->dashboardData();
      $notice = new Notice();
      $newNotices = $notice->newNotices();
      require_once('views/auth/home_'.$_SESSION["role_name"].'.php');
    }

    public function searchBar() {
      $link = Auth::searchBar($_POST['title']);
      if($link)
        @header('location:'.$link); 
      else
        $this->error();
        die();
    }  

    public function requirePassword() {
      self::required();
      require_once('views/auth/provide_password.php');
    }

    public function checkPassword() {
      $matched = $this->Auth()->setData($_POST)->checkPass();
      if($matched){
        $_SESSION['checked'] = "";
        header("location:?controller=users&action=".$_POST['redirect']."&uname=".$_POST['uname']);
      }
      else{
        $_SESSION['error'] = "Password doesn't match!";
        header("Location:?controller=auth&action=requirePassword&redirect=".$_POST['redirect']."&uname=".$_POST['uname']);
      }
    }

    public function signout() {
      $this->Auth()->signout();
      @header("location:?controller=auth&action=frontpage");
    }

    public function resetPass() {
      $this->Auth()->signout();
      require_once('views/auth/reset_password_give_info.php');
    }

    public function getLink() {
      if(isset($_POST['email'])){
        $this->Auth()->setData($_POST)->generateLink();
        require_once('views/auth/success.php');
      }
      else{
        @header("location:?controller=auth&action=error");
      }
    }

    public function resetLink() {
      if(isset($_GET['resetID'])){
        $data = $this->Auth()->getLinkData($_GET['resetID']);
        if($data){
          foreach ($data as $reset){
            $expire_time = strtotime($reset['create_date'])+(24*3600);
            if($expire_time > time()){
              $remaining_time = intval(($expire_time - time())/3600);
              require_once('views/auth/reset_password.php');
            }
            else{
              @header("location:?controller=auth&action=error");
            }
          } 
        }
        else{
          @header("location:?controller=auth&action=error");
        }
      }
      else{
        @header("location:?controller=auth&action=error");
      }
    }

    public function updateForgottenPass(){
      $user = new User();
      $changePass = $user->setData($_POST)->updatePassword();
      if($changePass){
        $this->Auth()->setData($_POST)->expireLink();
      }
      @header("location:?controller=auth&action=frontpage");
    }
      
    public function error() {
      require_once('views/auth/error.php');
    }
  }
?>