<?php
include('../assets/php/db.php');

if(!isset($_SESSION['IS_LOGIN'])){
	header('location:../login/login.php');
	die();
}
?>

<!DOCTYPE html>
<html>
<head>
    <!--Title at the top left--> 
    <title>Map</title>

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
<h1>Maps</h1>
<div id="title"></div>

<img id="myImage" src="../images/maps/gmap.jpg" width="1920" height="1080">

<!--Cycle on each Image-->

<div id="imgcycle"></div>
<script>
    
    const img = ["gmap", "main_2f","main_3f","annexa_1f","annexa_2f", "court_1f", "court_2f", "court_3f"];
    var x ="", i;
    var y ="", i;
    var z ="", i;
    //loops on the img array to clone a button that changes current picture
    for (i=0; i<=7; i++) {   
    x = x + "<button id='btn"+[i]+"'onclick=document.getElementById('myImage').src='../images/maps/"+img[i]+".jpg'>"+img[i]+"</button>"
    y = y + "<div id=text"+[i]+">"+img[i]+"</div>"
    }
    document.getElementById("imgcycle").innerHTML = x;
    document.getElementById("title").innerHTML = y;
    
    //future plan: add a way to change title display to current map
</script>
<!--End body -->
</body>
</html>