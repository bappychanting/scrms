<?php

namespace App\Student;
use App\Database\Database;
use App\Student\Student;

Class Score extends Student {

	  /* Function for getting all Users */
    public function getTeachers(){
      try {
            $pdo = Database::getInstance();
            $query = $pdo->prepare("SELECT * FROM users_view WHERE designation LIKE CONCAT('%', :teacher, '%') OR designation LIKE CONCAT('%', :instructor, '%')");  
            $query->execute(array('teacher' => "Teacher", ':instructor' => "Instructor"));
            $data=$query->fetchAll();
            return $data;
        } 
        catch (PDOException $e) {
            echo 'Error: ' . $e->getMessage();
        }
    }

    public function teacherAuthentication(){
      try {
            $pdo = Database::getInstance();
            $query = $pdo->prepare("SELECT * FROM users_view WHERE designation LIKE CONCAT('%', :teacher, '%') OR designation LIKE CONCAT('%', :instructor, '%')");  
            $query->execute(array('teacher' => "Teacher", ':instructor' => "Instructor"));
            $data=$query->fetchAll();
            return $data;
        } 
        catch (PDOException $e) {
            echo 'Error: ' . $e->getMessage();
        }
    }
	
}

?>