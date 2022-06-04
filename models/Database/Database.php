<?php
  
  namespace App\Database;
  use PDO;
  
  class Database {
    private static $instance = NULL;
    private static $bindInt = NULL;

    private function __construct() {}

    private function __clone() {}

    public static function getInstance() {
      if (!isset(self::$instance)) {
        $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
        self::$instance = new PDO('mysql:host=localhost;dbname=crm', 'root', '', $pdo_options);
      }
      return self::$instance;
    }

    public static function bindInteger() {
      if (!isset(self::$bindInt)) {
        self::$bindInt = PDO::PARAM_INT;
      }
      return self::$bindInt;
    }
  }
  
?>
