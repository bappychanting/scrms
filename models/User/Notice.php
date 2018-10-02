<?php

namespace App\User;
use App\Database\Database;
use App\Misc\Misc;

Class Notice extends User{


    private $title;
    private $details;

      // setter and getter for title
    function setTitle($title){
      $this->title = ucwords($title);
    }
    function getTitle(){
        return $this->title;
    }

      // setter and getter for details
    function setDetails($details){
      $this->details = ucwords($details);
    }
    function getDetails(){
        return $this->details;
    }

      /* Setting all the data */
    public function setData($data = '')
    {
      if (isset($data['id'])){
        $this->setId($data['id']);
      }
      else{
          $this->setId('');   
      }
      if (isset($data['uname'])){
        $this->setUsername($data['uname']);
      }
      if (isset($data['title'])){
        $this->setTitle($data['title']);
      }
      if (isset($data['details'])){
        $this->setDetails($data['details']);
      }
      return $this;
    }

      /* Function for getting latest notices */
    public function newNotices($setLimit = 3) {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM  notices_view LIMIT :setLimit');  
        $query->bindValue(':setLimit', (int) $setLimit, Database::bindInteger());
        $query->execute();
        $data=$query->fetchAll();
        return $data;
    }

      /* Function for viewing all notices */
    public function allNotices($pages = array('perpage'=>0,'page'=>0,'start'=>0)) {
        $perpage =  $pages['perpage']; $page =  $pages['page']; $start =  $pages['start'];
        $pdo = Database::getInstance();
        $query = 'SELECT * FROM  notices_view';
        $countQuery =  $pdo->prepare($query);
        $countQuery->execute();
        $total = $countQuery->rowCount();
        $pagination = Misc::paginate($total, $perpage, $page);
        $noticesQuery = $pdo->prepare($query." LIMIT $start, $perpage");
        $noticesQuery->execute();
        $notices=$noticesQuery->fetchAll();
        return array('notices'=>$notices, 'pagination'=>$pagination);
    }

      /* Function for viewing perticular notice */
    public function viewNotice() {
      $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT * FROM notices_view WHERE id = :id");  
        $query->execute(array(':id' => $this->getId()));
        $data=$query->fetchAll();
        return $data;
    }

      /* Function for viewing comments of a particular notice */
    public function viewComments($pages = array('perpage'=>0,'page'=>0,'start'=>0)) {
      $perpage =  $pages['perpage']; $page =  $pages['page']; $start =  $pages['start'];
      $pdo = Database::getInstance();
      $query = 'SELECT * FROM notice_comments_view WHERE notice_id = :id';
      $countQuery =  $pdo->prepare($query);
      $countQuery->execute(array(':id' => $this->getId()));
      $total = $countQuery->rowCount();
      $pagination = Misc::paginate($total, $perpage, $page);
      $commentsQuery = $pdo->prepare($query." LIMIT $start, $perpage");
      $commentsQuery->execute(array(':id' => $this->getId()));
      $comments=$commentsQuery->fetchAll();
      return array('comments'=>$comments, 'pagination'=>$pagination);
    }

      /* Function for searching notice */
    public function searchNotice() {
      if($this->getTitle() != ""){
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT * FROM notices_view WHERE username = :title OR family_name LIKE CONCAT('%', :title, '%') OR given_name LIKE CONCAT('%', :title, '%') OR title LIKE CONCAT('%', :title, '%') OR details LIKE CONCAT('%', :title, '%') ORDER BY create_date DESC");  
        $query->execute(array(':title' => $this->getTitle())); 
        $data=$query->fetchAll();
        return $data;
      }
    }

      /* Function for searching notice based on date */
    public function searchNoticebyDate($fromDate='', $toDate=''){
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM notices_view WHERE (create_date BETWEEN :fromDate AND :toDate)");  
      $query->execute(array(':fromDate' => date("Y-m-d H:i:s", strtotime($fromDate)), ':toDate' => date("Y-m-d H:i:s", strtotime($toDate)))); 
      $data=$query->fetchAll();
      return $data;
    }

      /* Function for storing notices */
    public function storeNotice() {
      if(!empty($this->getTitle()) && !empty($this->getDetails())){
          $pdo = Database::getInstance();
          $query = $pdo->prepare('INSERT INTO notices (title, details, user_id) VALUES (:title, :details, :user_id)');        
          $status = $query->execute(array(':user_id' => $this->findUserID(), ':title' => $this->getTitle(), ':details' => $this->getDetails()));
          Notification::addNotice();
          return $status;
        }
    }

      /* Function for storing comments */
    public function storeComment() {
      if(!empty($this->getDetails())){
          $pdo = Database::getInstance();
          $query = $pdo->prepare('INSERT INTO notice_comments (notice_id, notice_comment, user_id) VALUES (:notice_id, :notice_comment, :user_id)');        
          $status = $query->execute(array(':notice_id' => $this->getId(), ':notice_comment' => $this->getDetails(), ':user_id' => $this->findUserID()));
          Notification::addNoticeComment($id = $this->getId());
          return $status;
        }
    }

      /* Function for update notices */
    public function updateNotice() {
      if(!empty($this->getTitle()) && !empty($this->getDetails())){            
          $pdo = Database::getInstance();
          $query = $pdo->prepare('UPDATE notices SET title = :title, details = :details WHERE id = :id');        
          $status = $query->execute(array(':id' => $this->getId(), ':title' => $this->getTitle(), ':details' => $this->getDetails()));
          Notification::updateNotice($this->getId());
          return $status;
      }
    }

    private function commentAuth($data=''){
      foreach ($data as $comment) {
        if($_SESSION['role'] == 1 || $_SESSION['role'] > 1 && $_SESSION['uname'] == $comment['username']){  
          return $comment['notice_id']; 
        }
      } 
    }

      /* Function for fetching comment */
    public function getComment() {
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM notice_comments_view WHERE id = :id");  
      $query->execute(array(':id'=>$this->getId()));
      $data = $query->fetchAll();
      if($this->commentAuth($data)){
        return $data;
      }
    }

      /* Function for fetching comment */
    public function updateComment() {
      if(!empty($this->getDetails())){            
          $pdo = Database::getInstance();
          $query = $pdo->prepare('UPDATE notice_comments SET notice_comment = :comment WHERE id = :id');        
          $status = $query->execute(array(':id' => $this->getId(), ':comment' => $this->getDetails()));
          Notification::updateNoticeComment($id = $this->getId());
          return $status;
      }
    }

      /* Function for deleting notices */
    public function deleteNotice() {
      $pdo = Database::getInstance();
      $query = $pdo->prepare('UPDATE notices SET delete_date = :delete_date WHERE id = :id');        
      $status = $query->execute(array(':id'=>$this->getId(), ':delete_date' => time()));
      return $status;
    }

      /* Function for deleting notices */
    public function deleteComment() {
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM notice_comments_view WHERE id = :id");  
      $query->execute(array(':id'=>$this->getId()));
      $data = $query->fetchAll();
      if($this->commentAuth($data)){
        $query = $pdo->prepare('UPDATE notice_comments SET delete_date = :delete_date WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':delete_date' => time()));
        if($status){
          return $this->commentAuth($data);
        }
      }
    }

}

?>