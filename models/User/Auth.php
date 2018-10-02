<?php

namespace App\User;
use App\Database\Database;
Use App\Student\Student;
Use App\Batch\Batch;
use App\Batch\BatchType;
use App\Batch\BatchPeriod;
use App\Batch\ClassRoom;
use App\Misc\Misc;

class Auth extends User{

      // Password setter getter for auth
    function setPassword($password){
      $this->password = $password;
    }
    function getPassword(){
      return $this->password;
    }


      /* Setting all the data */
    public function setData($data = '')
    {    
        if (isset($data['id'])){
          $this->setId($data['id']);
        }
        if (isset($data['uname'])){
          $this->setUsername($data['uname']);
        }

        if (isset($data['email'])){
          $this->setEmail($data['email']);
        }

        if (isset($data['pass'])){
          $this->setPassword($data['pass']);
        }
        return $this;
    }

  	 /* Function for requiring authentication to access */
    public static function authenticate(){
  	 	if (!isset($_SESSION['uname'])){
  		    @header("location:?controller=auth&action=error");
  		}
  	}

  	 /* Function for signing in */
    public function signin() { 
      $pdo = Database::getInstance();
      $fetchdata = $pdo->prepare('SELECT * FROM auth_users WHERE username = :username OR email = :username');  
      $fetchdata->execute(array(':username' => $this->getUsername()));
      if($fetchdata->rowCount() == 1){
        $results=$fetchdata->fetchAll();
        foreach ($results as $result){
          if($result['timestamp']>time()){
            $_SESSION['timer'] = $result['timestamp'] - time();
            $_SESSION['error'] = '<strong>Timeout!</strong> Try again in <span id="time">'.date("i:s",$_SESSION['timer']).'</span> minutes.';
            return FALSE;
          }
          else{
            if(password_verify($this->getPassword(), $result['password'])){
              $update = $pdo->prepare('UPDATE users SET timestamp = :timestamp, attempts = :attempts  WHERE username = :username OR email = :username');  
              $executeUpdate = $update->execute(array(':timestamp' => 0, ':attempts' => 0, ':username' => $this->getUsername()));
              if($executeUpdate){ 
                $_SESSION["name"] = $result['family_name'].' '.$result['given_name']; $_SESSION["uname"] = $this->getUsername(); $_SESSION["designation"] = $result['designation']; $_SESSION["role_name"] = $result['role_name']; $_SESSION["role"] = $result['role']; $_SESSION["photo"] = $result['image'];
                $_SESSION['success'] = "Login successful!";
                return TRUE;
              }
              else{
                return FALSE;
              }
            }
            else{
              $result['attempts'] = $result['attempts'] + 1;
              $update = $pdo->prepare('UPDATE users SET attempts = :attempts  WHERE username = :username OR email = :username');
              $update->execute(array(':attempts' => $result['attempts'], ':username' => $this->getUsername()));
              if($result['attempts']>3){
                $_SESSION['timer'] = 180;
                $result['timestamp'] = time() + $_SESSION['timer'];
                $update = $pdo->prepare('UPDATE users SET timestamp = :timestamp  WHERE username = :username OR email = :username');
                $update->execute(array(':timestamp' => $result['timestamp'], ':username' => $this->getUsername())); 
                $_SESSION['error'] = '<strong>Multiple invalid attempts detected.</strong> Try again in <span id="time">'.date("i:s",$_SESSION['timer']).'</span> minutes.';   
                return FALSE;
              }
              else{
                $_SESSION['warning'] = "<strong>The password you entered was incorrect!</strong> Please try again if you are trying to login as <strong>".$result['family_name']." ".$result['given_name']."</strong>.";
                return FALSE;
              }
            }
          }
        }
      } 
      else{
        $_SESSION['info'] = "<strong>Wrong login credentials!</strong> Try again to log in with correct username/email and password.";
        return FALSE;
      }
    }


     /* Function for getting password reset link */
    public function generateLink() { 
      $pdo = Database::getInstance();
      $query = $pdo->prepare('SELECT * FROM users_view WHERE email = :email');
      $query->execute(array(':email' => $this->getEmail()));
      $data = $query->fetchAll();
      if($data){
        foreach ($data as $user) {
          $link = md5(uniqid());
          $query = $pdo->prepare('INSERT INTO reset_password_links (user_id, link) VALUES (:user_id, :link)');
          $query->execute(array(':user_id' => $user['id'], ':link' => $link));
          $headers = "From: info@djit.ac";
          $message = 'Please <a href="?controller=auth&action=resetLink&resetID='.$link.'" target="_blank">click on this link</a> to reset your password!';
          // mail($user['email'],"Reset Your DJIT CRM Password",$message,$headers);
        }
      }    
    }


     /* Function for expiring link */
    public function expireLink() { 
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE reset_password_links SET exp = 1  WHERE id = :id');
        $query->execute(array(':id' => $this->getId()));
    }


     /* Function for acessing to link for resetting password */
    public function getLinkData($link='') { 
          $pdo = Database::getInstance();
          $query = $pdo->prepare('SELECT * FROM reset_password_links_view WHERE link = :link');
          $query->execute(array(':link' => $link));
          $data = $query->fetchAll(); 
          return $data; 
    }

     /* Function for requiring authentication to access */
    public function dashboardData(){
          $pdo = Database::getInstance();
          $query = $pdo->prepare('SELECT * FROM  batches_view');        
          $query->execute();
          $batches = $query->rowCount();
          $query = $pdo->prepare('SELECT * FROM  users_view WHERE role < 4');        
          $query->execute();
          $staff = $query->rowCount();
          $query = $pdo->prepare('SELECT * FROM  users_view WHERE role = 4');        
          $query->execute();
          $students = $query->rowCount();
          $query = $pdo->prepare('SELECT * FROM  users_view WHERE role = 2');        
          $query->execute();
          $admins = $query->rowCount();
          return array('batches'=>$batches, 'staff'=>$staff, 'students'=>$students, 'admins'=>$admins);
    }

     /* Function for requiring authentication to access */
    public static function chartData(){
          $pdo = Database::getInstance();
          for ($i = 1; $i <= 12; $i++) {
            $months[] = array(date("F, Y", strtotime( date( 'Y-m-01' )." -$i months"))=> array('start' =>strtotime(date( 'Y-m-01' )." -$i months"), 'end'=>strtotime(date( 'Y-m-t' )." -$i months")));
          }
          $months = array_reverse($months);

            // Create Arrays for Barchart
          $firstBarData = array();
          $secondBarData = array();
          $years = Misc::generateYearArray();
          foreach($years['currentYear'] as $month => $date){
                $query = $pdo->prepare('SELECT * FROM users_view WHERE role = 4 AND create_date BETWEEN :monthStart and :monthEnd');
                $query->execute(array(':monthStart'=>date('Y-m-d H:i:s', $date['start']), ':monthEnd'=>date('Y-m-d H:i:s', $date['end'])));
                $total = $query->rowCount();
                $firstLabel = "Total Student Admitted of this month in ".date('Y', $date['start']);
                array_push($firstBarData, $total);
          }
          foreach($years['previousYear'] as $month => $date){
                $query = $pdo->prepare('SELECT * FROM users_view WHERE role = 4 AND create_date BETWEEN :monthStart and :monthEnd');
                $query->execute(array(':monthStart'=>date('Y-m-d H:i:s', $date['start']), ':monthEnd'=>date('Y-m-d H:i:s', $date['end'])));
                $total = $query->rowCount();
                $secondLabel =  "Total Student Admitted of this month in ".date('Y', $date['start']);
                array_push($secondBarData, $total);
          }
          $barChartData = array('firstLabel'=> $firstLabel, 'firstData'=>$firstBarData, 'secondLabel'=>$secondLabel, 'secondData'=>$secondBarData);


            // Create Arrays for Line Chart
          $lineLabels = array();
          $attendance = array();
          $total = array();
          foreach($months as $item){
            foreach ($item as $key => $month) {
                $query = $pdo->prepare('SELECT * FROM attendance_view WHERE attendance = 1 AND create_date BETWEEN :monthStart and :monthEnd');
                $query->execute(array(':monthStart'=>date('Y-m-d H:i:s', $month['start']), ':monthEnd'=>date('Y-m-d H:i:s', $month['end'])));
                $totalattendance = $query->rowCount();
                $query = $pdo->prepare('SELECT * FROM attendance_view WHERE create_date BETWEEN :monthStart and :monthEnd');
                $query->execute(array(':monthStart'=>date('Y-m-d H:i:s', $month['start']), ':monthEnd'=>date('Y-m-d H:i:s', $month['end'])));
                $totalstudents = $query->rowCount();
                array_push($lineLabels, $key);
                array_push($attendance, $totalattendance);
                array_push($total, $totalstudents);
            }
          }
          $lineChartData = array('labels'=> $lineLabels, 'attendance'=> $attendance, 'total'=> $total);

            // Create Arrays for Radar Chart
          $radarLabels = array();
          $dropout = array();
          $admitted = array();
          foreach($months as $item){
            foreach ($item as $key => $month) {
                $query = $pdo->prepare('SELECT * FROM users WHERE role = 4 AND delete_date BETWEEN :monthStart and :monthEnd');
                $query->execute(array(':monthStart'=>$month['start'], ':monthEnd'=>$month['end']));
                $totalDropout = $query->rowCount();
                $query = $pdo->prepare('SELECT * FROM users WHERE role = 4 AND create_date BETWEEN :monthStart and :monthEnd');
                $query->execute(array(':monthStart'=>date('Y-m-d H:i:s', $month['start']), ':monthEnd'=>date('Y-m-d H:i:s', $month['end'])));
                $totalAdmitted = $query->rowCount();
                array_push($radarLabels, $key);
                array_push($dropout, $totalDropout);
                array_push($admitted, $totalAdmitted);
            }
          }
          $radarChartData = array('labels'=> $radarLabels, 'dropout'=> $dropout, 'admitted'=> $admitted);

            // Create Arrays for Piechart
          $pieBatches = array();
          $pieStudents = array();
          $pieColors = array();
          $query = $pdo->prepare('SELECT * FROM batches_detailed_view WHERE (start_date < :first_day AND end_date > :last_day) OR (start_date BETWEEN :first_day AND :last_day) OR (end_date BETWEEN :first_day AND :last_day) ORDER BY start_time');
          $query->execute(array(':first_day' => strtotime(date('Y-m-01', time())), ':last_day' => strtotime(date('Y-m-t', time()))));
          $batches = $query->fetchAll();
          foreach($batches as $batch){
            $query = $pdo->prepare('SELECT * FROM  students_view WHERE batch = :batch');
            $query->execute(array(':batch' => $batch['id']));
            $total = $query->rowCount();
            array_push($pieBatches, $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']);
            array_push($pieStudents, $total);
            array_push($pieColors, Misc::generateColor());
          }
          $pieChartData = array('batches'=> $pieBatches, 'students'=> $pieStudents, 'colors'=>$pieColors);
           
            // Return all Data
          return array('barChart'=>$barChartData, 'lineChart'=> $lineChartData, 'radarChart'=>$radarChartData, 'pieChart'=>$pieChartData);
    }


     /* Function for creating links */
    public static function initialLinks(){
      $initialLinks = array(
                    array('title'=>'Dashboard', 'link'=>'?controller=auth&action=home'),
                    array('title'=>'View All Messages', 'link'=>'?controller=messages&action=allConversations'),
                    array('title'=>'View All Notifications', 'link'=>'?controller=notifications&action=allNotifications'),
                    array('title'=>'View Class Schedule', 'link'=>'?controller=schedule&action=viewSchedule'),
                    array('title'=>'View Your User Profile', 'link'=>'?controller=users&action=showUser&uname='.$_SESSION['uname']),
                    array('title'=>'Edit Your User Profile', 'link'=>'?controller=users&action=editUser&uname='.$_SESSION['uname']),
                    array('title'=>'Update Your password', 'link'=>'?controller=users&action=editPass&uname='.$_SESSION['uname']),
                    array('title'=>'View All Notices', 'link'=>'?controller=notices&action=allNotices')
                  );
      if($_SESSION['role'] == 4){
          $links = array(
                    array('title'=>'View Your Student Profile', 'link'=>'?controller=students&action=showStudentProfile&uname='.$_SESSION['uname']),
                    array('title'=>'View Your Scores and Performance', 'link'=>'?controller=students&action=showStudentPerformance&uname='.$_SESSION['uname']),
                    array('title'=>'View Your Attachments', 'link'=>'?controller=students&action=showStudentAttachments&uname='.$_SESSION['uname']),
                    array('title'=>'Contact Staff', 'link'=>'?controller=messages&action=allStaff'),
                    array('title'=>'View Your Suggestions', 'link'=>'?controller=suggestions&action=studentSuggestions'),
                    array('title'=>'Add New Suggestion', 'link'=>'?controller=suggestions&action=addSuggestion'),
                  );
          $allUsers = new User();
          $users = $allUsers->setData($_SESSION)->getStaff();
          foreach ($users as $user) {
            $links[] = array('title'=>'Send Message to '.$user['family_name'].' '.$user['given_name'].' ('.$user['username'].')', 'link'=>'?controller=messages&action=viewMessages&uname='.$user['username']);
          }
          foreach ($initialLinks as $addlinks) {
            $links[] = array('title'=>$addlinks['title'], 'link'=>$addlinks['link']);
          }
          return $links;
      }
      else{
          $links =  array(
                      array('title'=>'List of Batches', 'link'=>'?controller=batches&action=allBatches'),
                      array('title'=>'Add New Batch', 'link'=>'?controller=batches&action=addBatch'),
                      array('title'=>'Manage Classrooms', 'link'=>'?controller=batches&action=manageClassRoom'),
                      array('title'=>'Manage Batch Types', 'link'=>'?controller=batches&action=manageBatchType'),
                      array('title'=>'Manage Batch Periods', 'link'=>'?controller=batches&action=manageBatchPeriod'),
                      array('title'=>'Pending Profile Students', 'link'=>'?controller=students&action=pendingStudents'),
                      array('title'=>'All Students', 'link'=>'?controller=students&action=allStudents'),
                      array('title'=>'Batch Unassigned Students', 'link'=>'?controller=students&action=unassignedStudents'),
                      array('title'=>'Students with Assigned Batch', 'link'=>'?controller=students&action=assignedStudents'),
                      array('title'=>'Advanced Functionalities (Students)', 'link'=>'?controller=students&action=advanced'),
                      array('title'=>'Show All Users', 'link'=>'?controller=users&action=showAllUsers'),
                      array('title'=>'Show All Students', 'link'=>'?controller=users&action=showSpecificUsers&role=4'),
                      array('title'=>'Show All Employees', 'link'=>'?controller=users&action=showSpecificUsers&role=3'),
                      array('title'=>'Show All Administrator', 'link'=>'?controller=users&action=showSpecificUsers&role=2'),
                      array('title'=>'Add New User', 'link'=>'?controller=users&action=addUser'),
                      array('title'=>'Advanced Functionalities (Users)', 'link'=>'?controller=users&action=advanced'),
                      array('title'=>'Add New Notice', 'link'=>'?controller=notices&action=addNotice'),
                      array('title'=>'Show All Suggestions', 'link'=>'?controller=suggestions&action=allSuggestions'),
                  );
          $allUsers = new User();
          $users = $allUsers->setData($_SESSION)->getUsers();
          foreach ($users as $user) {
            $links[] = array('title'=>'Show User Profile of '.$user['family_name'].' '.$user['given_name'].' ('.$user['username'].')', 'link'=>'?controller=users&action=showUser&uname='.$user['username']);
            $links[] = array('title'=>'Send Message to '.$user['family_name'].' '.$user['given_name'].' ('.$user['username'].')', 'link'=>'?controller=messages&action=viewMessages&uname='.$user['username']);
            $links[] = array('title'=>'View Suggestions Added by '.$user['family_name'].' '.$user['given_name'].' ('.$user['username'].')', 'link'=>'?controller=suggestions&action=studentSuggestions&uname='.$user['username']);
          }
          $getStudents = new Student();
          $students = $getStudents->allStudents();
          foreach ($students as $student) {
            $links[] = array('title'=>'Show Student Profile of '.$student['family_name'].' '.$student['given_name'].' ('.$student['username'].')', 
              'link'=>'?controller=students&action=showStudentProfile&uname='.$student['username']);
            $links[] = array('title'=>'Show Student Performance of '.$student['family_name'].' '.$student['given_name'].' ('.$student['username'].')', 
              'link'=>'?controller=students&action=showStudentPerformance&uname='.$student['username']);
            $links[] = array('title'=>'Show Attachments of '.$student['family_name'].' '.$student['given_name'].' ('.$student['username'].')', 
              'link'=>'?controller=students&action=showStudentAttachments&uname='.$student['username']);
          }
          $allBatches = new Batch();
          $batches = $allBatches->allBatches();
          foreach ($batches as $batch) {
            $links[] = array('title'=>'Show Details of Batch '.$batch['acronym'].'-'.$batch['period'][0].'-'.$batch['batch_number'], 'link'=>'?controller=batches&action=viewBatch&id='.$batch['id']);
            $links[] = array('title'=>'Show Students of Batch '.$batch['acronym'].'-'.$batch['period'][0].'-'.$batch['batch_number'], 'link'=>'?controller=students&action=sortByBatch&batch='.$batch['id']);
            $links[] = array('title'=>'Add Attedance to Batch '.$batch['acronym'].'-'.$batch['period'][0].'-'.$batch['batch_number'], 'link'=>'?controller=batches&action=addAttendance&id='.$batch['id']);
            $links[] = array('title'=>'View Attedances of Batch '.$batch['acronym'].'-'.$batch['period'][0].'-'.$batch['batch_number'], 'link'=>'?controller=batches&action=viewAttendance&id='.$batch['id']);
            $links[] = array('title'=>'Add Exam to Batch '.$batch['acronym'].'-'.$batch['period'][0].'-'.$batch['batch_number'], 'link'=>'?controller=batches&action=addExam&id='.$batch['id']);
            $links[] = array('title'=>'View Exams of Batch '.$batch['acronym'].'-'.$batch['period'][0].'-'.$batch['batch_number'], 'link'=>'?controller=batches&action=allExams&id='.$batch['id']);
          }
          $room = new ClassRoom();
          $classRooms = $room->allClasseRooms();
          foreach ($classRooms as $classroom) {
            $links[] = array('title'=>'Show All Batches of Class '.$classroom['name'], 'link'=>'?controller=batches&action=searchByClassroom&classroom='.$classroom['id']);
          }
          $type = new BatchType();
          $batchTypes = $type->allBatchTypes();
          foreach ($batchTypes as $batchType) {
            $links[] = array('title'=>'Show All Batches of Batch Type '.$batchType['type'], 'link'=>'?controller=batches&action=searchByType&type='.$batchType['id']);
          }
          $period = new batchPeriod();
          $batchPeriods = $period->allBatchPeriods();
          foreach ($batchPeriods as $batchPeriod) {
            $links[] = array('title'=>'Show All Batches of Period '.$batchPeriod['period'], 'link'=>'?controller=batches&action=searchByPeriod&period=='.$batchPeriod['id']);
          }
          foreach ($initialLinks as $addlinks) {
            $links[] = array('title'=>$addlinks['title'], 'link'=>$addlinks['link']);
          }
          return $links;
      }
    }

     /* Function for redirecting from searchbar */
    public static function searchBar($title=''){
      $links = self::initialLinks();
      foreach($links as $link){
        if($title == $link['title']){
          return $link['link'];
        }
      }
    }


      /* Function for checking password */
    public function checkPass(){
          $pdo = Database::getInstance();
          $query = $pdo->prepare('SELECT * FROM  users WHERE username = :username');        
          $query->execute(array(':username' => $this->getUsername()));
          $results = $query->fetchAll();
          foreach ($results as $result){ 
              $pass = $result['password']; 
          }
          if(password_verify($this->getPassword(), $pass)){
            return TRUE;  
          }
    }

      /* Function for blocking access to specific functionalities */
    public static function accessControl($roles){
      foreach($roles as $role){
        if ($_SESSION['role'] == $role){
          @header("location:?controller=auth&action=error");
          die();
        }
      }
    }

     /* Function for allowing access to different functionalities */
    public static function profileAccess($username, $role){
      if ($_SESSION['uname'] != $username && $_SESSION['role'] > $role){
          @header("location:?controller=auth&action=error");
          die();
      }
    }

      /* Function for signing out */
    public static function signout(){
    	session_destroy();
    } 

}


?>