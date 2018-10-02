<?php

namespace App\Batch;
use App\Database\Database;

Class ClassRoom{

    private $id;
    private $className;

    /* Setter getter for all variables */

      // ID setter getter
    function setId($id){
        $this->id = intval($id);
    }
    function getId(){
        return $this->id;
    }

    /* Setter getter for all variables */

    	// Acronym Setter Getter
    function setClassName($className){
        if(is_numeric($className)){
            if(strlen($className) == 1){
                $className = "0".$className;
            }
            elseif(strlen($className) > 2) {
                $className = ltrim($className, '0');
                if(strlen($className) == 1){
                    $className = "0".$className;
                }
            }
        }
        $this->className = ucwords($className);   
    }	    
    function getClassName(){
        return $this->className;
    }

      // Setting all the data
    public function setData($data = ''){
		if (isset($data['id'])){
			$this->setId($data['id']);
		}
		if (isset($data['className'])){
			$this->setClassName($data['className']);
		}
      	return $this;
    }

    	// Function for showing Batch Types
    public function allClasseRooms() {
		$pdo = Database::getInstance();
		$query = $pdo->prepare('SELECT * FROM  classes_view');  
		$query->execute();
		$data=$query->fetchAll();
		return $data;
    }

    	// Function for storing Batch Types
    public function storeClasseRoom() {
        if(!empty($this->getClassName())){
            $pdo = Database::getInstance();
            $find = $pdo->prepare('SELECT * FROM  classes_view WHERE name = :name');  
            $find->execute(array(':name' => $this->getClassName()));
            $total = $find->rowCount();
                if($total == 0){
                $query = $pdo->prepare('INSERT INTO classes (name) VALUES (:name)');        
                $status = $query->execute(array(':name' => $this->getClassName()));
                return $status;
            }
        }   
    }

        // Function for Editing Batch Types
    public function findClasseRoom() {
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM classes_view WHERE id = :id');  
        $find->execute(array(':id' => $this->getId()));
        $data=$find->fetchAll();
        return $data;
    }

    	// Function for Editing Batch Types
    public function updateClasseRoom() {
        if(!empty($this->getClassName())){
            $pdo = Database::getInstance();
            $find = $pdo->prepare('SELECT * FROM  classes_view WHERE name = :name');  
            $find->execute(array(':name' => $this->getClassName()));
            $total = $find->rowCount();
            if($total == 0){
                $query = $pdo->prepare('UPDATE classes SET name = :name WHERE id = :id');        
                $status = $query->execute(array(':id'=>$this->getId(), ':name' => $this->getClassName()));
                return $status;
            }
        }
    }

    	// Function for Editing Batch Types
    public function deleteClassRoom() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE classes SET delete_date = :delete_date WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':delete_date' => time()));
        return $status;
    }
}
?>