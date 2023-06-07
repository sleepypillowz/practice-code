<?php
include('../db.php');

if(!isset($_SESSION['IS_LOGIN'])){
	header('location:../login/login.php');
	die();
}
?>

<!DOCTYPE html>
<html>
<head>
    <!--Title at the top left--> 
    <title>Home</title>

    <!--I have no idea--> 
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--links to External CSS--> 
    <link rel="stylesheet" href="../main.css">
    <link rel="stylesheet" href="map.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!--JQuery Script to import header.html--> 
    <script
        src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
    </script>

<!--Load Script-->
<script> 
$(function(){
  $("#header").load("../header.php"); 
});
</script>  

</head>
<body>
    <!--imported header-->
    <div id="header"></div>
 
<!--Start body -->
<h2>Image Maps</h2>
<p>Click on the computer, the phone, or the cup of coffee to go to a new page and read more about the topic:</p>

<img src="../images/gmap.png" alt="gmap" usemap="#workmap" width="400" height="379">

<map name="workmap">
  <area shape="rect" coords="34,44,270,350" alt="sti_main" href="sti_main.php">
  <area shape="rect" coords="290,172,333,250" alt="Phone" href="phone.htm">
  <area shape="circle" coords="337,300,44" alt="Cup of coffee" href="coffee.htm">
</map>
<!--End body -->
</body>
</html>