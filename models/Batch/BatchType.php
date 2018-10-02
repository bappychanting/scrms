<?php

namespace App\Batch;
use App\Database\Database;

Class BatchType{

    private $id;
    private $type;
    private $acronym;

    /* Setter getter for all variables */

        // ID setter getter
    function setId($id){
        $this->id = intval($id);
    }
    function getId(){
        return $this->id;
    }

        // Type setter getter
    function setType($type){
       $this->type = ucwords($type);
    }
    function getType(){
        return $this->type;
    }

    	// Acronym Setter Getter
    function setAcronym($acronym){
        $this->acronym = strtoupper($acronym);
    }	    
    function getAcronym(){
        return $this->acronym;
    }

    /* Setter getter for all variables */

      // Setting all the data
    public function setData($data = ''){
		if (isset($data['id'])){
			$this->setId($data['id']);
		}
		if (isset($data['type'])){
			$this->setType($data['type']);
		}
		if(isset($data['acronym'])){
			$this->setAcronym($data['acronym']);
		}
      	return $this;
    }

    	// Fucntion for getting acronym suggestion
	public function suggestAcronym(){
	   	$explodeType = explode(" ", $this->getType());
	    $acronym = "";
	    foreach ($explodeType as $explode) {
	      $acronym .= $explode[0];
	    }
	    $acronymSuggestion = strtoupper($acronym);
	    return $acronymSuggestion;
	}

    	// Function for showing Batch Types
    public function allBatchTypes() {
		$pdo = Database::getInstance();
		$query = $pdo->prepare('SELECT * FROM  batch_types_view');  
		$query->execute();
		$data=$query->fetchAll();
		return $data;
			
    }

    	// Function for storing Batch Types
    public function storeBatchType() {
        if(!empty($this->getType()) && !empty($this->getAcronym())){
            $pdo = Database::getInstance();
            $find = $pdo->prepare('SELECT * FROM  batch_types_view WHERE type = :type OR acronym = :acronym');  
            $find->execute(array(':type' => $this->getType(), ':acronym' => $this->getAcronym()));
            $total = $find->rowCount();
                if($total == 0){
                $query = $pdo->prepare('INSERT INTO batch_types (type, acronym) VALUES (:type, :acronym)');        
                $status = $query->execute(array(':type' => $this->getType(), ':acronym' => $this->getAcronym()));
                return $status;
            }
        }   
    }

        // Function for Editing Batch Types
    public function findBatchType() {
        $pdo = Database::getInstance();
        $find = $pdo->prepare('SELECT * FROM  batch_types_view WHERE id = :id');  
        $find->execute(array(':id' => $this->getId()));
        $data=$find->fetchAll();
        return $data;
    }

    	// Function for Editing Batch Types
    public function updateBatchType() {
        if(!empty($this->getType()) && !empty($this->getAcronym())){
            $pdo = Database::getInstance();
            $find = $pdo->prepare('SELECT * FROM  batch_types_view WHERE type = :type OR acronym = :acronym');  
            $find->execute(array(':type' => $this->getType(), ':acronym' => $this->getAcronym()));
            $total = $find->rowCount();
                if($total == 0){
                $query = $pdo->prepare('UPDATE batch_types SET type = :type, acronym = :acronym WHERE id = :id');        
                $status = $query->execute(array(':id'=>$this->getId(), ':type' => $this->getType(), ':acronym' => $this->getAcronym()));
                return $status;
            }
        }
    }

    	// Function for Editing Batch Types
    public function deleteBatchType() {
        $pdo = Database::getInstance();
        $query = $pdo->prepare('UPDATE batch_types SET delete_date = :delete_date WHERE id = :id');        
        $status = $query->execute(array(':id'=>$this->getId(), ':delete_date' => time()));
        return $status;
    }
}
?>