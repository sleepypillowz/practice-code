<?php
session_start();
include ("connect.php");
include("links.php");

$fromUser = $_POST["fromUser"];
$toUser = $_POST["toUser"];
$message = $_POST["message"];

$output= "";

$sql = "INSERT INTO messages (FromUser, ToUser, Message)
VALUES ('$fromUser', '$toUser', '$message')";


$connect->query($sql);


#if ($connect->query($sql))
#{
	#$output.="";
#}
#else
#{
	#$output.="Error. Please Try Again";
#}
	#echo $output;


if($connect->query($sql)) {
	$output= "";
	$result = $connect->query("SELECT * FROM messages WHERE FromUser = '$fromUser' AND ToUser = '$toUser' ");
	while ($result->fetch_assoc()) {

		echo $output;
	}
	
}

?>