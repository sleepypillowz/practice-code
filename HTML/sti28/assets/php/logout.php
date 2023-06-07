<?php
include('db.php');
unset($_SESSION['IS_LOGIN']);
header('location:../../login/login.php');
die();
?>
