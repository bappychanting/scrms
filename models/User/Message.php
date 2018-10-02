<?php
namespace App\User;
use App\Misc\Misc;
use App\Database\Database;

class Message extends User{
    
    private $message;
    private $frontUser;
    private $rearUser;
    private $token;

    /* Setter getter for all variables */

      // message setter getter
    function setMessage($message){
        $this->message = Misc::substrwords($message, 10000);
    }
    function getMessage(){
        return $this->message;
    }

      // Front User setter getter
    function setFrontUser($frontUser){
        $this->frontUser = intval($frontUser);
    }
    function getFrontUser(){
        return $this->frontUser;
    }

      // Rear User setter getter
    function setRearUser($rearUser){
        $this->rearUser = intval($rearUser);
    }
    function getRearUser(){
        return $this->rearUser;
    }

    /* Setter getter for all variables */


      // Token User setter getter
    function setToken($token=''){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM messages_view WHERE sender = :frontUser AND reciever = :rearUser OR sender = :rearUser AND reciever = :frontUser');  
        $query->execute(array(':frontUser' => $this->getFrontUser(), ':rearUser' => $this->getRearUser()));
        $messages = $query->fetchAll();
        if (count($messages) == 0){
            $token = md5(uniqid(rand(), true));
        }
        else{
            foreach($messages as $message){
                $token = $message['token'];
            }
        }
        $this->token = $token;
    }

    function getToken(){
        return $this->token;
    }

    
        // Function for setting all data of message
    public function setMessageData($data = ''){
        $this->setRearUser($this->setData($data)->findUserID());
        $this->setFrontUser($this->setData($_SESSION)->findUserID());
        if(isset($data['message'])){
            $this->setMessage($data['message']);
        }
        if(isset($data['id'])){
            $this->setId($data['id']);
        }
        $this->setToken();
        return $this;
    }  

      /* Function for getting reciever name */
    public function getReciever(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT family_name, given_name FROM users WHERE username = :username");  
        $query->execute(array(':username' => $this->getUsername()));
        $data=$query->fetchAll();
        if(count($data)>0){
          return $data['0']['family_name'].' '.$data['0']['given_name']; 
        }
    }

        // Function for storing message
    public function storeMessage(){
        if(!empty($this->getMessage())){ 
            $pdo = Database::getInstance();
            $query = $pdo->prepare('INSERT INTO messages (message, token, sender, reciever) VALUES (:message, :token, :sender, :reciever)');        
            $status = $query->execute(array(':message'=>$this->getMessage(), ':token' => $this->getToken(), ':sender' => $this->getFrontUser(), ':reciever' => $this->getRearUser()));
            return $status;
        }
    }

        // Function for setting all data of message
    public function getNewMessages(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT COUNT(reciever) as total, max(send_date) as send_date, max(sender_family_name) as sender_family_name, max(sender_given_name) as sender_given_name, sender_username FROM (SELECT * FROM messages_view WHERE reciever = :frontUser AND viewed_by_reciever is NULL order by send_date DESC) AS newmesssages GROUP BY sender_username ORDER BY send_date DESC LIMIT 20");
        $query->execute(array(':frontUser' => $this->getFrontUser())); 
        $newmesssages = $query->fetchAll();
        $count = $pdo->prepare("SELECT SUM(newmessages) as total FROM (SELECT COUNT(reciever) as newmessages FROM messages_view WHERE reciever = :frontUser AND viewed_by_reciever is NULL GROUP BY sender) AS newmesssages");
        $count->execute(array(':frontUser' => $this->getFrontUser())); 
        $total = $count->fetchAll();
        return array('total'=>$total['0']['total'], 'newmesssages'=>$newmesssages);
    }

        // Function for setting all data of message
    public function getAllConversation($sort='', $start=0, $limit=9){
        $pdo = Database::getInstance();
        if(empty($sort)){
            $query = $pdo->prepare("SELECT allM.send_date as send_date, allM.message as message, allM.viewed_by_reciever as viewed_by_reciever, allM.reciever_username as reciever_username, allM.sender_username as sender_username, allM.reciever_family_name as reciever_family_name, allM.reciever_given_name as reciever_given_name, allM.sender_image as sender_image, allM.sender_family_name as sender_family_name , allM.sender_given_name as sender_given_name FROM (SELECT * FROM messages_view) allM, (SELECT max(id) as id, token FROM messages_view WHERE sender = :frontUser AND delete_from_sender is NULL or reciever = :frontUser AND delete_from_reciever is NULL GROUP BY token) sortM WHERE allM.id = sortM.id ORDER BY send_date DESC LIMIT $start,$limit");
        }
        else{
            $query = $pdo->prepare("SELECT allM.send_date as send_date, allM.message as message, allM.viewed_by_reciever as viewed_by_reciever, allM.reciever_username as reciever_username, allM.sender_username as sender_username, allM.reciever_family_name as reciever_family_name, allM.reciever_given_name as reciever_given_name, allM.sender_image as sender_image, allM.sender_family_name as sender_family_name , allM.sender_given_name as sender_given_name FROM (SELECT * FROM messages_view) allM, (SELECT max(id) as id, token FROM messages_view WHERE reciever = :frontUser AND viewed_by_reciever is NULL GROUP BY token) sortM WHERE allM.id = sortM.id ORDER BY send_date DESC LIMIT $start,$limit");   
        }
        $query->execute(array(':frontUser' => $this->getFrontUser())); 
        $allConversation = $query->fetchAll();
        if($allConversation){
            foreach($allConversation as $conversation){
                $message = strip_tags(Misc::substrwords($conversation['message'],  20, '...'));
                $view_date = "<span class='font col-red'>Not viewed by reciever!</span>";
                $image = Misc::checkImage('all_images/user_images/', $conversation['sender_image']);
                $send_date = date("h:i A, F d (l), Y", strtotime($conversation['send_date']));
                $class = 'bg-green';
                if(!empty($conversation['viewed_by_reciever'])){
                        $view_date = "<strong>&#10003 Viewed : </strong>".date("h:i A, F d (l), Y", $conversation['viewed_by_reciever']); 
                }
                if($conversation['sender_username'] == $_SESSION['uname']){
                    $name = $conversation['reciever_family_name'].' '.$conversation['reciever_given_name']; $username = $conversation['reciever_username'];
                }
                else{
                    $name = $conversation['sender_family_name'].' '.$conversation['sender_given_name']; $username = $conversation['sender_username']; $class = 'bg-orange';
                    if(!empty($conversation['viewed_by_reciever'])){
                        $view_date = "<span class='font col-teal'><strong>&#10003 Viewed : </strong>".date("h:i A, F d (l), Y", $conversation['viewed_by_reciever'])."</span>"; 
                        $class = 'bg-green';
                    }                
                }
                $conversations[] = array('message'=>$message, 'name'=>$name, 'username'=>$username, 'image'=>$image, 'send_date'=> $send_date, 'view_date'=>$view_date, 'class'=> $class);
            }
            return $conversations;   
        }
    }

       // Function for searching conversation
    public function searchConversation($name=''){
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT * FROM messages_view WHERE sender_username = :name AND reciever = :frontUser OR sender_family_name LIKE CONCAT('%', :name, '%') AND reciever = :frontUser OR sender_given_name LIKE CONCAT('%', :name, '%') AND reciever = :frontUser OR reciever_username LIKE CONCAT('%', :name, '%') AND sender = :frontUser OR reciever_family_name LIKE CONCAT('%', :name, '%') AND sender = :frontUser OR reciever_given_name LIKE CONCAT('%', :name, '%') AND sender = :frontUser GROUP BY reciever_username, sender_username");
        $query->execute(array(':name'=>$name, ':frontUser' => $this->getFrontUser())); 
        $allUsers = $query->fetchAll();
        foreach($allUsers as $user){
            if($user['sender_username'] == $_SESSION['uname']){
                $users[] = array('name'=>$user['reciever_family_name'].' '.$user['reciever_given_name'], 'username'=>$user['reciever_username'], 'email' => $user['reciever_email'], 'role_name' => $user['reciever_role']);   
            }
            elseif($user['reciever_username'] == $_SESSION['uname']){
                $users[] = array('name'=>$user['sender_family_name'].' '.$user['sender_given_name'], 'username'=>$user['sender_username'], 'email' => $user['sender_email'], 'role_name' => $user['sender_role']);
            }
        }
        if(!empty($users)){
            return array_unique($users, SORT_REGULAR);   
        }
    }

            // get if the last sent message is viewed
    public function getView(){
        $viewed = '';
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT * FROM messages_view WHERE sender = :frontUser AND reciever = :rearUser AND delete_from_sender is NULL OR sender = :rearUser AND reciever = :frontUser AND delete_from_reciever is NULL ORDER BY id DESC LIMIT 1");
        $query->execute(array(':frontUser' => $this->getFrontUser(), ':rearUser' => $this->getRearUser())); 
        $getUser = $query->fetchAll();
        if($getUser && $getUser['0']['reciever'] == $this->getRearUser()){
            $query = $pdo->prepare("SELECT viewed_by_reciever FROM messages_view WHERE sender = :frontUser AND reciever = :rearUser ORDER BY id DESC LIMIT 1");
            $query->execute(array(':frontUser' => $this->getFrontUser(), ':rearUser' => $this->getRearUser())); 
            $view = $query->fetchAll();
            if(!empty($view['0']['viewed_by_reciever'])){
                $viewed = "<strong>&#10003 Viewed : </strong>".date("h:i A, F d (l), Y", $view['0']['viewed_by_reciever']);
            }
        }
        return $viewed;
    }

        // Update Message View
    private function updateView(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare("UPDATE messages SET viewed_by_reciever = :view_date WHERE sender = :rearUser AND reciever = :frontUser AND viewed_by_reciever is NULL");
        $query->execute(array(':view_date' => time(), ':frontUser' => $this->getFrontUser(), ':rearUser' => $this->getRearUser())); 
    }

		// Function for viewing message
    public function viewMessages($pages = array('perpage'=>0,'page'=>0,'start'=>0)){
        $perpage =  $pages['perpage']; $page =  $pages['page']; $start =  $pages['start'];
        $pdo = Database::getInstance();
        $this->updateView();
        $query = "SELECT * FROM messages_view WHERE sender = :frontUser AND reciever = :rearUser AND delete_from_sender is NULL OR sender = :rearUser AND reciever = :frontUser AND delete_from_reciever is NULL";

            // Query for pagination
        $mesageCountQuery =  $pdo->prepare($query);
        $mesageCountQuery->execute(array(':frontUser' => $this->getFrontUser(), ':rearUser' => $this->getRearUser())); 
        $total = $mesageCountQuery->rowCount();
        $pagination = Misc::paginate($total, $perpage, $page);

            // Query for selecting messages
        $messageQuery = $pdo->prepare($query." LIMIT $start, $perpage");
        $messageQuery->execute(array(':frontUser' => $this->getFrontUser(), ':rearUser' => $this->getRearUser()));
        $allmessages=$messageQuery->fetchAll();
        if(count($allmessages) > 0){
            foreach($allmessages as $message){
                $messages[] = array('id'=>$message['id'], 'message'=>$message['message'], 'sender'=>$message['sender_family_name'].' '.$message['sender_given_name'], 'sender_username'=>$message['sender_username'], 'image'=>Misc::checkImage('all_images/user_images/', $message['sender_image']), 'date'=> date("h:i A, F d (l), Y", strtotime($message['send_date'])), 'sortBydate'=>strtotime($message['send_date']));
            }
            usort($messages, function($a, $b) {
                return $a['sortBydate'] - $b['sortBydate'];
            });
            return array('messages'=>$messages, 'pagination'=>$pagination);
        }
    }

        // Function for deleting message
    public function deleteMessage() {
        $pdo = Database::getInstance();
        $checkUser = $pdo->prepare('SELECT * FROM messages_view WHERE id = :id');
        $checkUser->execute(array(':id' => $this->getId()));
        $getUser = $checkUser->fetchAll();
        foreach($getUser as $user){
            if($this->getFrontUser() == $user['sender']){
                $name = $user['reciever_username'];
                $query = $pdo->prepare('UPDATE messages SET delete_from_sender = :delete_date WHERE id = :id');
            }
            elseif($this->getFrontUser() == $user['reciever']){
                $name = $user['sender_username'];
                $query = $pdo->prepare('UPDATE messages SET delete_from_reciever = :delete_date WHERE id = :id');    
            }
        } 
        $status = $query->execute(array(':delete_date' => time(), ':id' => $this->getId()));
        return array('name'=>$name, 'status'=>$status);  
    }

        // Function for deleting conversation with a user
    public function deleteConversation() {
        $pdo = Database::getInstance();
        $findRearUser = $pdo->prepare('SELECT * FROM users_view WHERE id = :rearUser');
        $findRearUser->execute(array(':rearUser' => $this->getRearUser()));
        $rearUser = $findRearUser->fetchAll();
        $allMessages = $pdo->prepare('SELECT * FROM messages_view WHERE sender = :frontUser AND reciever = :rearUser OR sender = :rearUser AND reciever = :frontUser');
        $allMessages->execute(array(':frontUser' => $this->getFrontUser(), ':rearUser' => $this->getRearUser()));
        $messages = $allMessages->fetchAll();
        foreach($messages as $message){
            if($message['sender'] == $this->getFrontUser()){
                $query = $pdo->prepare('UPDATE messages SET delete_from_sender = :delete_date  WHERE id = :id');
                $query->execute(array(':delete_date' => time(), ':id' => $message['id']));
            }
            elseif($message['sender'] == $this->getRearUser()){
                $query = $pdo->prepare('UPDATE messages SET delete_from_reciever = :delete_date  WHERE id = :id');
                $query->execute(array(':delete_date' => time(), ':id' => $message['id']));    
            }
        } 
        return $rearUser['0']['username'];   
    }
	
}

?>