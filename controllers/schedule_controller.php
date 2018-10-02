<?php  
  use App\Schedule\Schedule;	
  use App\User\Message;
  use App\User\Notification;
  use App\User\Auth;
  use App\Misc\Misc;

  class ScheduleController{

    public function __construct() {
      Auth::authenticate();
      $notifcation = new Notification();
      $newNotifcations = $notifcation->setData($_SESSION)->newNotifications();
      $userImage = Misc::checkImage('all_images/user_images/', $_SESSION["photo"]);
      $message = new Message();
      $getNewMessages = $message->setMessageData()->getNewMessages();
      require_once('views/layout/header.php');
      require_once('views/layout/sidebar_'.$_SESSION["role_name"].'.php');
    }

    public function viewSchedule(){
      $schedule = new Schedule();
      $scheduleData = $schedule->getScheduleData();
      if($scheduleData){
        require_once('views/schedule/index.php'); 
      }
      else{
        $errorMessage = "Insufficient data! Class schedule will be generated once more data is available!";
        require_once('views/auth/view_error_message.php'); 
      }
    }

    public function generateSchedulePDF(){
      $schedule = new Schedule();
      $schedulePDFData = $schedule->generateSchedulePDF();
      $schedulePDF = new mPDF();
      $schedulePDF->SetTitle('Class Schedule');
      $schedulePDF->WriteHTML($schedulePDFData);
      ob_clean(); 
      $schedulePDF->Output('Class Schedule.pdf', 'I');
      exit;
    }

  }

?>