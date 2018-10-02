<?php

namespace App\User;
use App\Misc\Misc;
use App\Database\Database;

Class Notification extends User{

			 // Function for getting Notifications
	public function newNotifications() {
        $pdo = Database::getInstance();
		$query = $pdo->prepare('SELECT * FROM new_notifications_view WHERE username = :username LIMIT 20');
        $query->execute(array(':username' => $this->getUsername()));
        $data = $query->fetchAll();
        return $data;
	}

             // Function for getting Notifications
    public function allNotifications($pages = array('perpage'=>0,'page'=>0,'start'=>0)) {
        $perpage =  $pages['perpage']; $page =  $pages['page']; $start =  $pages['start'];
        $pdo = Database::getInstance();
        $query = 'SELECT * FROM notifications_view WHERE username = :username';
            // Query for pagination
        $countQuery =  $pdo->prepare($query);
        $countQuery->execute(array(':username' => $this->getUsername())); 
        $total = $countQuery->rowCount();
        $pagination = Misc::paginate($total, $perpage, $page);
            // Query for selecting notifications
        $notificationQuery = $pdo->prepare($query." LIMIT $start, $perpage");
        $notificationQuery->execute(array(':username' => $this->getUsername()));
        $notifications=$notificationQuery->fetchAll();
        return array('notifications'=>$notifications, 'pagination'=>$pagination);
    }

             // Function for getting Notifications
    public function notificationRedirection() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE notifications SET viewed = :viewed WHERE id = :id');
        $query->execute(array(':viewed' => '1', ':id' => $this->getID()));
        $query = $pdo->prepare('SELECT * FROM notifications_view WHERE id = :id');
        $query->execute(array(':id' => $this->getID()));
        $data = $query->fetchAll();
        foreach($data as $notification){
            $link = $notification['link']; 
        }
        return $link;  
    }


             // Function for fetching data
    private static function getData($view = '') {
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT * FROM $view WHERE id = (SELECT max(id) FROM $view)");
        $query->execute();
        $data = $query->fetchAll();
        return $data;
    }

             // Function for inserting Notifications
    private static function insertNotifications($message, $link, $user, $icon='notifications_active', $color='cyan') {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('INSERT INTO notifications (notification, link, viewed, icon, color, user_id) VALUES (:notification, :link, :viewed, :icon, :color, :user)');
        $query->execute(array(':notification' => $message, ':link' => $link, ':viewed'=>'0', ':icon' => $icon, ':color' => $color, ':user' => $user));
    }

             // Function for marking all Notifications as read
    public function readAllNotifications() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE notifications SET viewed = :viewed WHERE user_id = :user_id');
        $status = $query->execute(array(':viewed'=>'1', ':user_id' => $this->findUserId()));
        return $status;
    }

	        // Function for inserting Exams
    public static function insertExam() {
        $pdo = Database::getInstance();
        $examData = self::getData('exams_view');
        foreach ($examData as $exam) {
        	$message = "New Exam has been added to batch ".$exam['acronym']."-".$exam['period'][0]."-".$exam['batch_number'].", titled- &#34;".$exam['title']."&#34;. Exam Date ".date("F d (l), Y", $exam['exam_date']).".";
        	$query = $pdo->prepare('SELECT * FROM batch_assigned_students_view WHERE batch= :batch');
            $query->execute(array(':batch' => $exam['batch']));
            $recipients = $query->fetchAll();
            foreach($recipients as $recipient){
            	$link = '?controller=students&action=showStudentPerformance&uname='.$recipient['username'];
                self::insertNotifications($message, $link, $recipient['id'], 'assignment', 'deep-orange');
            }
        }
    }

            // Function for inserting Exam Mark
    public static function insertExamMarks($id) {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM exam_marks_view WHERE id = :id');
        $query->execute(array(':id' => $id));
        $scores = $query->fetchAll();
        foreach ($scores as $score) {
            $message = "Your score for exam &#34;".$score['title']."&#34; has been updated! Click to view!";
            $link = '?controller=students&action=showStudentPerformance&uname='.$score['username'];
            self::insertNotifications($message, $link, $score['student'], 'assignment_turned_in', 'light-green');
        }
    }

        // Function for adding new notice to database
    public static function addNotice() {
        $pdo = Database::getInstance();
        $getNotice = self::getData('notices_view');
        $query = $pdo->prepare('SELECT * FROM users_view');
        $query->execute();
        $data = $query->fetchAll(); 
        foreach($getNotice as $notice){
            $message = "Notice! Titled &quot;".substr($notice['title'],0,20)."...&quot; by ".$notice['family_name'].' '.$notice['given_name']."! Click to view!";
            $link = '?controller=notices&action=viewNotice&id='.$notice['id'];
            foreach($data as $user){
                self::insertNotifications($message, $link, $user['id'], 'warning', 'orange');
            }
        }
    }

        // Function for adding new notice to database
    public static function updateNotice($id='') {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM users_view');
        $query->execute();
        $data = $query->fetchAll(); 
        $message = "Notice has been updated! Click to view!";
        $link = '?controller=notices&action=viewNotice&id='.$id;
        foreach($data as $user){
            self::insertNotifications($message, $link, $user['id'], 'warning', 'orange');
        }
    }

        // Function for adding new notice to database
    public static function addNoticeComment($id='') {
        $allStaff = self::getStaff();
        $message = "New comment has been added to an announcement you follow! Click to view!";
        $link = '?controller=notices&action=viewComments&id='.$id;
        foreach($allStaff as $staff){
            self::insertNotifications($message, $link, $staff['id'], 'comment', 'grey');
        }
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM notice_comments_view WHERE notice_id = :id GROUP BY user_id');
        $query->execute(array(':id'=> $id));
        $data = $query->fetchAll(); 
        if($data){
            foreach($data as $user){
                $check = 1;
                foreach($allStaff as $staff){
                    if($user['username'] == $_SESSION['uname'] || $user['user_id'] == $staff['id']){
                       $check = 0;
                    }
                }
                if($check == 1){
                     self::insertNotifications($message, $link, $user['user_id'], 'comment', 'grey');
                }
            }
        }    
    }

        // Function for adding new notice to database
    public static function updateNoticeComment($id='') {
        $allStaff = self::getStaff();
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM notice_comments_view WHERE id = :id');
        $query->execute(array(':id'=> $id));
        $data = $query->fetchAll();
        foreach ($data as $comment) {
            $link = '?controller=notices&action=viewComments&id='.$comment['notice_id'];
        }
        $message = "A user has updated his comment in an announcement! Click to view!";
        foreach($allStaff as $staff){
            self::insertNotifications($message, $link, $staff['id'], 'comment', 'grey');
        }  
    }

        // Function for adding new suggestion to database
    public static function addSuggestion() {
        $getSuggestion = self::getData('suggestions_view');
        $allStaff = self::getStaff(); 
        foreach($getSuggestion as $suggestion){
            $message = "New suggestion has been added by ".$suggestion['family_name'].' '.$suggestion['given_name']."! Click to view!";
            $link = '?controller=suggestions&action=viewSuggestion&id='.$suggestion['id'];
            foreach($allStaff as $staff){
                self::insertNotifications($message, $link, $staff['id'], 'live_help', 'light-green');
            }
        }
    }

        // Function for adding new suggestion to database
    public static function updateSuggestion($id='') {
        $allStaff = self::getStaff(); 
        $message = "A suggestion has been updated! Click to view!";
        $link = '?controller=suggestions&action=viewSuggestion&id='.$id;
        foreach($allStaff as $staff){
            self::insertNotifications($message, $link, $staff['id'], 'live_help', 'light-green');
        }
    }

        // Function for adding new suggestion to database
    public static function addSuggestionComment($id='') {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM suggestions_view WHERE id = :id');
        $query->execute(array(':id'=> $id));
        $data = $query->fetchAll();         
        $message = "Daffodil Japan IT has replied to one of your suggestions! Click to view!"; 
        $link = '?controller=suggestions&action=viewComments&id='.$id;
        if($_SESSION['role'] < 4){
            foreach ($data as $suggestion) {
                self::insertNotifications($message, $link, $suggestion['user_id'], 'comment', 'grey');
            }
        } 
    }

        // Function for inserting User
    public static function createUser() {
        $getUser = self::getData('users_view');
        foreach($getUser as $user){
            $message = "Congratulations ".$user['family_name']." ".$user['given_name']."! Your user profile has been created. Click to view your profile!";
            $link = '?controller=users&action=showUser&uname='.$user['username'];
            self::insertNotifications($message, $link, $user['id'], 'person', 'green');
        }
    }

        // Function for updating User
    public static function updateUser($username) {
        if($_SESSION['uname'] != $username){
            $pdo = Database::getInstance();
            $query = $pdo->prepare("SELECT * FROM users_view WHERE username = :username");  
            $query->execute(array(':username' => $username));
            $data=$query->fetchAll();
            foreach($data as $user){
                $message = "Your user profile has been updated! Click to view your profile!";
                $link = '?controller=users&action=showUser&uname='.$user['username'];
                self::insertNotifications($message, $link, $user['id'], 'person', 'orange');
            } 
        }
    }

        // Function for inserting Student
    public static function createStudent($username) {
        if($_SESSION['uname'] != $username){
            $getStudent = self::getData('students');
            foreach($getStudent as $student){
                $message = "Your Student profile has been created! Click to view your profile!";
                $link = '?controller=users&action=showUser&uname='.$username;
                self::insertNotifications($message, $link, $student['user_id'], 'school', 'green');
            } 
        }
    }

        // Function for updating Student
    public static function updateStudent($id, $username) {
        if($_SESSION['uname'] != $username){
                $message = "Information on your Student profile has been updated! Click to view your profile!";
                $link = '?controller=users&action=showUser&uname='.$username;
                self::insertNotifications($message, $link, $id, 'school', 'orange');
        }
    }

        // Function for assign Student to Batch
    public function assignStudentBatch($id = '') {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM batch_assigned_students_view WHERE id = :id');
        $query->execute(array(':id' => $id));
        $data = $query->fetchAll();
        foreach ($data as $student) {
            $studentMessage = "You have been migrated to batch ".$student['acronym']."-".$student['period'][0]."-".$student['batch_number'].". Click to view!";
            $generalMessage = "Batch of student ".$student['family_name']." ".$student['given_name']." has been updated to batch ".$student['acronym']."-".$student['period'][0]."-".$student['batch_number'].". Click to view!";
            $link = "?controller=students&action=showStudentProfile&uname=".$student['username'];
            self::insertNotifications($studentMessage, $link, $student['id'], 'domain', 'teal');
            $users = $this->getStaff();
            foreach ($users as $user) {
                self::insertNotifications($generalMessage, $link, $user['id'], 'domain', 'teal');
            }
        }
    }

}

?>