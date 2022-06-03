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
        // For Wamp Server
        // self::$instance = new PDO('mysql:host=localhost;dbname=crm', 'root', '', $pdo_options);
        // For Lamp Server
        self::$instance = new PDO('mysql:host=localhost;dbname=scrms', 'admin', 'secret', $pdo_options);
        // For Online Server
        // self::$instance = new PDO('mysql:host=localhost;dbname=id3902969_crm', 'id3902969_root', 'mahadihasan', $pdo_options);
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