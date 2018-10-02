<?php
session_start();
include("vendor/autoload.php");
$controller = $_GET['controller'];
$action     = $_GET['action'];
require_once('routes.php');
?>
        