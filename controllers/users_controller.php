<?php

  use App\User\User;
  use App\User\Message;
  use App\User\Notification;
  use App\User\Auth;
  use App\Misc\Misc;

  class UsersController {

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

    private function User(){
      $user = new User();
      return $user;
    }

    public function showAllUsers(){
      Auth::accessControl(array(4));
      $users = $this->User()->setData($_SESSION)->getUsers();
      Misc::showResult($users, 'views/users/index.php');  
    }

    public function showSpecificUsers(){
      Auth::accessControl(array(4));
      $users = $this->User()->setData($_GET)->getSpecificUsers();
      Misc::showResult($users, 'views/users/index.php');
    }

    public function showUser(){
      $showuser = $this->User()->setData($_GET)->getUser();
      if(empty($showuser) && $_SESSION['role'] == 1){
          require_once('views/users/restore_user.php'); 
      }
      else{
        foreach($showuser as $user) {
          Auth::profileAccess($user['username'], 3);
          $image = Misc::checkImage('all_images/user_images/', $user['image']);
          require_once('views/users/show_user.php'); 
        }
      }
    }

    public function addUser(){
      Auth::accessControl(array(3,4));
      $allData[] = Misc::getSubmittedData(array("class"=>"form-line", "family_name"=>"", "given_name"=>"", "uname"=>"", "role"=>4, "email"=>"", "designation"=>"None")); 
      foreach ($allData as $data){
        require_once('views/users/add.php');
      }
    }

    public function storeUser() {
      $storeUser = $this->User()->setData($_POST)->store();
      if($storeUser){
        $_SESSION['success'] = "User has been added";
        header("Location:?controller=users&action=showUser&uname=".$_POST['uname']);
      }
      else{
        Misc::setSubmittedData();
        $_SESSION['error'] = "There was a problem adding user! Please try again with a different username or email! Is there any field left empty?";
        header("Location:?controller=users&action=addUser");
      }
    }

    public function editUser(){
      $showuser = $this->User()->setData($_GET)->getUser();
      foreach($showuser as $user){
        if(!isset($_SESSION['checked']) && $_SESSION['uname'] != $user['username'] && $_SESSION['role'] == $user['role']){
          header("Location:?controller=auth&action=requirePassword&redirect=editUser&uname=".$user['username']);
        }
        else{
          unset($_SESSION['checked']);
          Auth::profileAccess($user['username'], 2);
          $image = Misc::checkImage('all_images/user_images/', $user['image']);
          require_once('views/users/edit.php');  
        } 
      }
    }

    public function updateUser(){
      $editUser = $this->User()->setData($_POST)->edit();
      if($editUser){
        $_SESSION['success'] =  "User information has been updated";
        header("Location:?controller=users&action=showUser&uname=".$_POST['uname']);
      }
      else{
         $_SESSION['error'] = "There was a problem updating the user! Please try again with a different email! Is there any field left empty?";
         header("Location:?controller=users&action=editUser&uname=".$_POST['uname']);
      }
    }

    public function editPass(){
      $showuser = $this->User()->setData($_GET)->getUser();
      foreach($showuser as $user){
        if(!isset($_SESSION['checked']) && $_SESSION['role'] == $user['role']){
          header("Location:?controller=auth&action=requirePassword&redirect=editPass&uname=".$user['username']);
        }
        else{
          unset($_SESSION['checked']);
          Auth::profileAccess($user['username'], 2);
          $image = Misc::checkImage('all_images/user_images/', $user['image']);
          require_once('views/users/edit_password.php'); 
        }  
      }
    }

    public function updatePass(){
      $updatepass = $this->User()->setData($_POST)->updatePassword();
      if($updatepass){
        $_SESSION['success'] = "Password updated";
        header("Location:?controller=users&action=showUser&uname=".$_POST['uname']); 
      }
      else{
        header("Location:?controller=users&action=editPass&uname=".$_POST['uname']); 
      } 
    }

    public function updateImage(){
        if($_SESSION['uname'] == $_POST['uname']){
          Misc::imageUpload('all_images/user_images/', $_POST['filename']);
          header("Location:?controller=users&action=showUser&uname=".$_POST['uname']);
        }
        else{
          header("Location:?controller=auth&action=error");
        }
    }

    public function deleteUser() {
      Auth::accessControl(array(3,4));
      $delete = $this->User()->setData($_GET)->delete($_SESSION['role']);
      if($delete){
        $_SESSION['success'] =  "User has been deleted";
      }
      else{
         $_SESSION['error'] = "There was a problem deleting this user!";
      }
      header("Location:?controller=users&action=showAllUsers");
    }

    public function advanced() {
      Auth::accessControl(array(4));
      require_once('views/users/advanced.php'); 
    }

    public function searchUser() {
      $users = $this->User()->setData($_POST)->searchUser();
      Misc::showResult($users, 'views/users/index.php');  
    }

    public function searchUserbyDate() {
      if(empty($_POST['start_date']) || empty($_POST['end_date'])){
        $_POST['start_date'] = ''; $_POST['end_date'] = '';
      }
      $users = $this->User()->searchUserbyDate($_POST['start_date'], $_POST['end_date']); 
      Misc::showResult($users, 'views/users/index.php');
    }

    public function restoreUser() {
      Auth::accessControl(array(2,3,4));
      $restore = $this->User()->setData($_GET)->restore();
      if($restore){
        $_SESSION['success'] = "The user has been restored!";
        header("Location:?controller=users&action=showUser&uname=".$_GET['uname']);
      }
    }

    public function deleteAll() {
      Auth::accessControl(array(2,3,4));
      $delete = $this->User()->setData($_GET)->deleteAll();
      if($delete){
          $_SESSION['success'] = "Selected users have been deleted!";
          header("Location:?controller=users&action=advanced");  
      } 
    }

    public function import() {
      Auth::accessControl(array(2,3,4));
      $import = $this->User()->importExcel();
      if($import){
        $_SESSION['warning'] = "The database is successfully uploaded. ".$import['stored']." users out of ".$import['total']." users have been imported! Try again with different data if there is any user missing!";
        header("Location:?controller=users&action=showAllUsers");  
      }
    }

  }

?>