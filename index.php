<?php
  ob_start();
  session_start();
  include("vendor/autoload.php");

  if (isset($_GET['controller']) && isset($_GET['action'])) {
    $controller = $_GET['controller'];
    $action     = $_GET['action'];
  } 
  else {
    $controller = 'auth';
    $action     = 'frontpage';
  }

  require_once('views/layout.php');
?>