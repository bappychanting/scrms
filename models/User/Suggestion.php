<?php

namespace App\User;
use App\Database\Database;
use App\Misc\Misc;

Class Suggestion extends Notice{

      /* Function for viewing all notices */
    public function allSuggestions($pages = array('perpage'=>0,'page'=>0,'start'=>0)) {
        $perpage =  $pages['perpage']; $page =  $pages['page']; $start =  $pages['start'];
        $pdo = Database::getInstance();
        $query = 'SELECT * FROM  suggestions_view';
        $countQuery =  $pdo->prepare($query);
        $countQuery->execute();
        $total = $countQuery->rowCount();
        $pagination = Misc::paginate($total, $perpage, $page);
        $suggestionsQuery = $pdo->prepare($query." LIMIT $start, $perpage");
        $suggestionsQuery->execute();
        $suggestions=$suggestionsQuery->fetchAll();
        return array('suggestions'=>$suggestions, 'pagination'=>$pagination);
    }

      /* Function for viewing all notices */
    public function studentSuggestions($pages = array('perpage'=>0,'page'=>0,'start'=>0)) {
        $perpage =  $pages['perpage']; $page =  $pages['page']; $start =  $pages['start'];
        $pdo = Database::getInstance();
        $query = 'SELECT * FROM  suggestions_view WHERE user_id = :user_id';
        $countQuery =  $pdo->prepare($query);
        $countQuery->execute(array(':user_id' => $this->findUserID()));
        $total = $countQuery->rowCount();
        $pagination = Misc::paginate($total, $perpage, $page);
        $suggestionsQuery = $pdo->prepare($query." LIMIT $start, $perpage");
        $suggestionsQuery->execute(array(':user_id' => $this->findUserID()));
        $suggestions=$suggestionsQuery->fetchAll();
        return array('suggestions'=>$suggestions, 'pagination'=>$pagination);
    }


      /* Function for storing notices */
    public function storeSuggestion() {
    	if(!empty($this->getTitle()) && !empty($this->getDetails())){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('INSERT INTO suggestions (title, details, user_id) VALUES (:title, :details, :user_id)');        
        $status = $query->execute(array(':user_id' => $this->findUserID(), ':title' => $this->getTitle(), ':details' => $this->getDetails()));
        Notification::addSuggestion();
        return $status;
      }
    }

      /* Function for storing suggestions */
    public function viewSuggestion() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM suggestions_view WHERE id = :id');        
        $query->execute(array(':id' => $this->getId()));
        $data = $query->fetchAll();
        foreach ($data as $suggestion) {
          if($_SESSION['role'] < 4 || $_SESSION['uname'] == $suggestion['username']){  
            return $data;
          }
        } 
    }

     /* Function for update suggestions */
    public function updateSuggestion() {
      if(!empty($this->getTitle()) && !empty($this->getDetails())){            
          $pdo = Database::getInstance();
          $query = $pdo->prepare('UPDATE suggestions SET title = :title, details = :details WHERE id = :id');        
          $status = $query->execute(array(':id' => $this->getId(), ':title' => $this->getTitle(), ':details' => $this->getDetails()));
          Notification::updateSuggestion($this->getId());
          return $status;
      }
    }

      /* Function for deleting notices */
    public function deleteSuggestion() {
      $data = $this->viewSuggestion();
      if($data){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE suggestions SET delete_date = :delete_date WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':delete_date' => time()));
        return $status;        
      }
    }

    private function commentAuth($data=''){
      foreach ($data as $comment) {
        if($_SESSION['role'] == 1 || $_SESSION['role'] > 1 && $_SESSION['uname'] == $comment['username']){  
          return $comment['suggestion_id']; 
        }
      } 
    }

      /* Function for viewing comments of a particular notice */
    public function viewComments($pages = array('perpage'=>0,'page'=>0,'start'=>0)) {
      $perpage =  $pages['perpage']; $page =  $pages['page']; $start =  $pages['start'];
      $pdo = Database::getInstance();
      $query = 'SELECT * FROM suggestion_comments_view WHERE suggestion_id = :id';
      $countQuery =  $pdo->prepare($query);
      $countQuery->execute(array(':id' => $this->getId()));
      $total = $countQuery->rowCount();
      $pagination = Misc::paginate($total, $perpage, $page);
      $commentsQuery = $pdo->prepare($query." LIMIT $start, $perpage");
      $commentsQuery->execute(array(':id' => $this->getId()));
      $comments=$commentsQuery->fetchAll();
      return array('comments'=>$comments, 'pagination'=>$pagination);
    }


      /* Function for storing comments */
    public function storeComment() {
      if(!empty($this->getDetails())){
          $pdo = Database::getInstance();
          $query = $pdo->prepare('INSERT INTO suggestion_comments (suggestion_id, suggestion_comment, user_id) VALUES (:suggestion_id, :suggestion_comment, :user_id)');        
          $status = $query->execute(array(':suggestion_id' => $this->getId(), ':suggestion_comment' => $this->getDetails(), ':user_id' => $this->findUserID()));
          Notification::addSuggestionComment($id = $this->getId());
          return $status;
        }
    }

      /* Function for fetching comment */
    public function getComment() {
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM suggestion_comments_view WHERE id = :id");  
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
          $query = $pdo->prepare('UPDATE suggestion_comments SET suggestion_comment = :comment WHERE id = :id');        
          $status = $query->execute(array(':id' => $this->getId(), ':comment' => $this->getDetails()));
          return $status;
      }
    }

      /* Function for deleting notices */
    public function deleteComment() {
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM suggestion_comments_view WHERE id = :id");  
      $query->execute(array(':id'=>$this->getId()));
      $data = $query->fetchAll();
      if($this->commentAuth($data)){
        $query = $pdo->prepare('UPDATE suggestion_comments SET delete_date = :delete_date WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':delete_date' => time()));
        if($status){
          return $this->commentAuth($data);
        }
      }
    }


}

?>