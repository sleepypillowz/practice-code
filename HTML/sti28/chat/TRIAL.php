<?php

session_start();

include ("connect.php");
$toUser = mysqli_query ($connect, "SELECT * FROM users WHERE Id = '16' ")
or die ("Failed to query database" . mysql_error());

while ($row = $toUser->fetch_assoc()) {
}


?>
