<?php

namespace App\User;
use App\Database\Database;

 class User {

    /* Declaring all the variables */

    private $id;
    private $name;
    private $familyName;
    private $givenName;
    private $role;
    private $email;
    private $designation;
    private $image;
    private $username;
    private $password;

    /* Setter getter for all variables */

      // ID setter getter
    function setId($id){
        $this->id = $id;
    }
    function getId(){
        return $this->id;
    }

      // Name setter getter
    function setName($name){
      $this->name = ucwords($name);
    }
    function getName(){
        return $this->name;
    }

      // Family Name setter getter
    function setFamilyName($familyName){
      $this->familyName = ucwords($familyName);
    }
    function getFamilyName(){
        return $this->familyName;
    }

      // Given Name setter getter
    function setGivenName($givenName){
      $this->givenName = ucwords($givenName);
    }
    function getGivenName(){
        return $this->givenName;
    }

      // Role setter getter
    function setRole($role){
        $this->role = $role;
    }
    function getRole(){
        return $this->role;
    }

      // Email setter getter
    function setEmail($email){
      $this->email = strtolower($email);
    }
    function getEmail(){
        return $this->email;
    }

      // Designation setter getter
    function setDesignation($designation){
        $this->designation = ucwords($designation);
    }
    function getDesignation(){
        return $this->designation;
    }

      // Image setter getter
    function setImage($image){
      $this->image = $image;
    }
    function getImage(){
        return $this->image;
    }

      // Username setter and geter
    function setUsername($username){
        $this->username = str_replace(' ', '_', strtolower($username));
    }
    function getUsername(){
        return $this->username;
    }

    /* Setter getter for all variables */

      // Password setter getter
    function setPassword($password){
      if(!empty($password)){
          $this->password = password_hash($password, PASSWORD_BCRYPT);
      }
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

      if (isset($data['name'])){
        $this->setName($data['name']);
      }

      if (isset($data['family_name'])){
        $this->setFamilyName($data['family_name']);
      }

      if (isset($data['given_name'])){
        $this->setGivenName($data['given_name']);
      }

      if (isset($data['role'])){
        $this->setRole($data['role']);
      }

      if (isset($data['email'])){
        $this->setEmail($data['email']);
      }

      if (isset($data['designation'])){
        $this->setDesignation($data['designation']);
      }

      if (isset($data['uname'])){
        $this->setUsername($data['uname']);
        $this->setImage($data['uname'].".jpg");
      }

      if (isset($data['pass'])){
        $this->setPassword($data['pass']);
      }
      return $this;
    }

      /* Function for finding user ID */
    public function findUserID(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('SELECT * FROM auth_users WHERE username = :username');  
      $query->execute(array(':username' => $this->getUsername()));
      $data=$query->fetchAll();
      if(count($data)>0){
        return $data['0']['id']; 
      }
    }


      /* Function for getting all the Roles */
    public function getRoles(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('SELECT * FROM roles WHERE id > :role ORDER BY id DESC');  
      $query->execute(array(':role' => 1));
      $data=$query->fetchAll();
      return $data;
    }

      /* Function for getting all Users */
    public function getUsers(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM users_view WHERE username != :username AND role >= :role Limit 2000');  
        $query->execute(array('username' => $this->getUsername(), ':role' => $this->getRole()));
        $data=$query->fetchAll();
        return $data;
    }

      /* Function for getting all Users based on roles */
    public function getSpecificUsers(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('SELECT * FROM users_view WHERE role = :role');  
      $query->execute(array(':role' => $this->getRole()));
      $data=$query->fetchAll();
      return $data;
    }

      /* Function for getting all staff */
    public function getStaff(){
      $pdo = Database::getInstance();
      $query = $pdo->prepare('SELECT * FROM users_view WHERE role < 4 ORDER BY role');  
      $query->execute();
      $data=$query->fetchAll();
      return $data;
    }

       /* Function for searching user based on username */
    public function searchUser(){
        $pdo = Database::getInstance();
        if($this->getName() != ""){
          $query = $pdo->prepare("SELECT * FROM search_user WHERE username = :name OR email = :name OR family_name LIKE CONCAT('%', :name, '%') OR given_name LIKE CONCAT('%', :name, '%') AND role != 1 ORDER BY create_date DESC");  
          $query->execute(array(':name' => $this->getName())); 
          $data=$query->fetchAll();
          return $data;
        }
    }

      /* Function for searching user based on date */
    public function searchUserbyDate($fromDate='', $toDate=''){
      $pdo = Database::getInstance();
      $query = $pdo->prepare("SELECT * FROM search_user WHERE (create_date BETWEEN :fromDate AND :toDate) AND role != 1");  
      $query->execute(array(':fromDate' => date("Y-m-d H:i:s", strtotime($fromDate)), ':toDate' => date("Y-m-d H:i:s", strtotime($toDate)))); 
      $data=$query->fetchAll();
      return $data;
    }


      /* Function for showing particular User */
    public function getUser(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT * FROM users_view WHERE username = :username");  
        $query->execute(array(':username' => $this->getUsername()));
        $data=$query->fetchAll();
        return $data;
    }

      /* Function for mailing newly added user */
    public function checkUsername(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM users WHERE username = :username');  
        $query->execute(array(':username'=>$this->getUsername()));
        $total = $query->rowCount();
        if($total == 0){
            return TRUE;
        }
    }

      /* Function for mailing newly added user */
    public function checkEmail(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare('SELECT * FROM users WHERE email = :email AND username != :uname');  
        $query->execute(array(':uname' => $this->getUsername(), ':email'=>$this->getEmail()));
        $total = $query->rowCount();
        if($total == 0){
            return TRUE;
        }
    }

      /* Function for storing user data */
    public function store() {
      if(!empty($this->getFamilyName()) && !empty($this->getGivenName()) && !empty($this->getUsername()) && !empty($this->getEmail()) && !empty($this->getDesignation()) && !empty($this->getPassword())){
        if($this->checkUsername() && $this->checkEmail()){
          $pdo = Database::getInstance();
          $query = $pdo->prepare('INSERT INTO users (family_name, given_name, role, email, designation, image, username, password) VALUES (:family_name, :given_name, :role, :email, :designation, :image, :username, :password)');        
          $status = $query->execute(array(':family_name' => $this->getFamilyName(), ':given_name' => $this->getGivenName(), ':role' => $this->getRole(), ':email' => $this->getEmail(), ':designation' => $this->getDesignation(), ':image' => $this->getImage(), ':username' => $this->getUsername(), ':password' => $this->getPassword()));
          Notification::createUser();
          return $status;
        }
      }
    }

      /* Function for updating user data */
    public function edit(){
      if(!empty($this->getFamilyName()) && !empty($this->getGivenName()) && !empty($this->getEmail()) && !empty($this->getDesignation())){
          if($this->checkEmail()){
            $pdo = Database::getInstance();
            $query = $pdo->prepare('UPDATE users SET family_name = :family_name, given_name = :given_name, email = :email, role = :role, designation = :designation WHERE username = :username');        
            $status = $query->execute(array(':family_name' => $this->getFamilyName(), ':given_name' => $this->getGivenName(), ':email' => $this->getEmail(), ':role' => $this->getRole(), 'designation' => $this->getDesignation(), ':username' => $this->getUsername()));
            Notification::updateUser($this->getUsername());
            return $status;
          }
      }
    }

      /* Function for updating password */
    public function updatePassword() {
      if(!empty($this->getPassword())){
          $pdo = Database::getInstance();
          $query = $pdo->prepare('UPDATE users SET password = :password WHERE username = :username');        
          $status = $query->execute(array('password' => $this->getPassword(), ':username' => $this->getUsername()));
          return $status;
      }
    }

      /* Function for removing user */
    public function delete($role=1) {
      $pdo = Database::getInstance();
      $check = $pdo->prepare("SELECT * FROM users_view WHERE username = :username");
      $check->execute(array(':username' => $this->getUsername()));
      $users = $check->fetchAll();
      foreach ($users as $user){
        if($user['role'] != $role){
          $query = $pdo->prepare('UPDATE users SET delete_date = :delete_date WHERE username = :username');        
          $status = $query->execute(array(':delete_date' => time(), ':username' => $this->getUsername()));
          return $status;
        }
      }   
    }

      /* Function for restoring user */
    public function restore() {
      $pdo = Database::getInstance();
      $query = $pdo->prepare('UPDATE users SET delete_date = NULL WHERE username = :username');        
      $status = $query->execute(array(':username' => $this->getUsername()));
      return $status;  
    }

      /* Function for clearing database */
    public function deleteAll() {
      $pdo = Database::getInstance();
      $query = $pdo->prepare('UPDATE users SET delete_date = :delete_date WHERE role = :role');        
      $status = $query->execute(array('role' => $this->getRole(), ':delete_date' => time()));
      return $status;  
    }

      /* Function for importing database */
    public function importExcel() {
      $pdo = Database::getInstance();
      $i=0;
      $stored = 0;
      $query = $pdo->prepare('SELECT * FROM users WHERE delete_date is NULL');  
      $query->execute();
      $users=$query->fetchAll();
      $filename=$_FILES["file"]["tmp_name"];
      if($_FILES["file"]["size"] > 0){
        $file = fopen($filename, "r");
        $query = $pdo->prepare('INSERT INTO users (username, password, family_name, given_name, designation, role, email, image, create_date, update_date) VALUES (:username, :password, :family_name, :given_name, :designation, :role, :email, :image, :create_date, :update_date)');
        while (($data = fgetcsv($file, 10000, ",")) !== FALSE){   
          if($i>0) {    
            $check = "okay";
            foreach($users as $user){
              if($data[0] == $user['username'] || $data[5] == "1" || $data[5] > 4  || $data[6] == $user['email']){
                $check = "not okay";
              }
            }
            if($check == "okay"){
              $status = $query->execute(array(':username' => $data[0], ':password' => $data[1], ':family_name' => $data[2], ':given_name' => $data[3], ':designation' => $data[4], ':role' => $data[5], ':email' => $data[6], ':image' => $data[7], ':create_date' => $data[8], ':update_date' => $data[9]));
              if($status){
                $stored++;
              }
            }  
          }
          $i++;
        }
        fclose($file);
        $i = $i-1;
        return  array('stored'=>$stored, 'total'=>$i); 
      }
    }
}

?>