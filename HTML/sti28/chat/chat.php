<?php 
/*
session_start();
include ("../realtimelocatordb/connect.php");
include("../realtimelocatordb/links.php");

if (isset($_GET["userId"])) 
	{
		$_SESSION["userId"] = $_GET["userId"];
		header("location: chatbox.php");
	}


$users = mysqli_query ($connect, "SELECT * FROM users WHERE Id = ' ".$_SESSION ["userId"]."' ")
or die ("Failed to query database" . mysql_error());
$user = mysqli_fetch_assoc($users);
*/
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chat</title>
    <link rel="stylesheet" href="chat.css">
</head>
<body>
<div class="chat-bar-collapsible">
			<button id="chat-button" type="button" class="collapsible">
				Hi classmate! How can we help?
				<i class="fa fa-search"></i>
			</button>

			<div class="content">
				<div class="full-chat-block">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"> 
					<h4> Please select your account</h4>
				</div>

				<div class="modal-body"> 
					<ol> 
						<?php 
						$users = mysqli_query($connect, "SELECT * FROM users")
						or die ("Failed to query database" . mysql_error());
						while ($user = mysqli_fetch_assoc($users))

						{
							echo ' <li>

							<a href="index.php?userId='.$user["Id"].' ">'.$user["User"].'</a>

							</li>

							';
						} 

						?>
					</ol>
					<a href="registerUser.php" style="float:right;"> Register here.</a>
				</div>	
			</div>
		</div> 
	</div>
</div>    
</body>
<script type="text/javascript">
	
	var coll = document.getElementsByClassName("collapsible");

for (let i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function () {
        this.classList.toggle("active");

        var content = this.nextElementSibling;

        if (content.style.maxHeight) {
            content.style.maxHeight = null;

        } else {
            content.style.maxHeight = content.scrollHeight + "px";
        }
    });
}
</script>
</html>