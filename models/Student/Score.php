<?php

namespace App\Student;
use App\Database\Database;

Class Score extends Student {

	  /* Function for getting all Scores */
    public function getAllScores(){
        $pdo = Database::getInstance();
        $query = $pdo->prepare("SELECT * FROM exam_marks_view");  
        $query->execute();
        $data=$query->fetchAll();
        return $data;
    }
	
}

?>