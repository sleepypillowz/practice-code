	<?php 
    /*
	session_start();
	include ("connect.php");
	include("links.php");

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
	?>
	<!DOCTYPE html>
	<html>
	<head>

		<title>LiveChat</title>
	</head>
	<body>
		<style> 


/* Positioning */
.chat-bar-collapsible {
    position: fixed;
    bottom: 0;
    right: 50px;
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

/* For the button.The user will understand that it is a clickable element */
.collapsible {
    background-color: lightblue;
    color: black;
    cursor: pointer;
    padding: 18px;
    width: 350px;
    text-align: left;
    outline: none;
    font-size: 18px;
    border-radius: 10px 10px 0px 0px;
    border: 3px solid white;
    border-bottom: none;
}


/*All of the elements, once clicked, the chatbox will pop up */
/*once removed, the entire chatbox will appear*/

.content {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    background-color: #f1f1f1;
}

/*Showing all the elements inside the chat box*/
.full-chat-block {
    width: 350px;
    background: white;
    text-align: center;
    overflow: auto;
    scrollbar-width: none;
    height: max-content;
    transition: max-height 0.2s ease-out;
}

/*How small the chat box should be*/
.outer-container {
    min-height: 500px;
    bottom: 0%;
    position: relative;
}

/*Guarantees that the container stays at 500px*/
.chat-container {
    max-height: 500px;
    width: 100%;
    position: absolute;
    bottom: 0;
    left: 0;
    scroll-behavior: smooth;
    hyphens: auto;
}

    /*Pseudo element for the scroll bar, will kept in hidden*/

    .chat-container::-webkit-scrollbar {
        display: none;
    }

/* Outer container*/
.chat-bar-input-block {

    display: flex;
    float: left;
    box-sizing: border-box;
    justify-content: space-between;
    width: 100%;
    align-items: center;
    background-color: rgb(235, 235, 235);
    border-radius: 10px 10px 0px 0px;
    padding: 10px 0px 10px 10px;
    
}


.chat-bar-icons {
    display: flex;
    justify-content: space-evenly;
    box-sizing: border-box;
    width: 25%;
    float: right;
    font-size: 20px;
}

/*Pseudo element*/
#chat-icon:hover {
    opacity: .7;
}

/* Chat bubbles */

#userInput { /*Will occupy 75% even you scroll*/
    width: 75%;
}

/*insert text*/
.input-box {
    float: left;
    border: none;
    box-sizing: border-box;
    width: 100%;
    border-radius: 10px;
    padding: 10px;
    font-size: 16px;
    color: #000;
    background-color: white;
    outline: none
    
}

/*Define text that is inside once you sent the msg*/
.userText {
    color: blue;
    font-family: Helvetica;
    font-size: 16px;
    font-weight: normal;
    text-align: right;
    clear: both;
}

    /* used to define the box on the outside */
    .userText span {
        line-height: 1.5em;
        display: inline-block;
        background: #5ca6fa;
        padding: 10px;
        border-radius: 8px;
        border-bottom-right-radius: 2px;
        max-width: 80%;
        margin-right: 10px;
        animation: floatup .5s forwards
    }

.botText {
    color: #000;
    font-family: Helvetica;
    font-weight: normal;
    font-size: 16px;
    text-align: left;
}

    .botText span {
        line-height: 1.5em;
        display: inline-block;
        background: #e0e0e0;
        padding: 10px;
        border-radius: 8px;
        border-bottom-left-radius: 2px;
        max-width: 80%;
        margin-left: 10px;
        animation: floatup .5s forwards
    }

    /* FAQ */ 

.FAQs {
    width: 100%;
    margin: 0 auto;
    margin-top: 100px;

}

.FAQs h4 {
    text-align: center;
    color: lightskyblue;
    
}


.accordion {
    text-align: justify;
    margin-left: 60px;
    padding: 0px;
    height: 60px;
    width: 60%;
    border-left: 1px solid gray;
    cursor: pointer;
    border-radius: 25px;
    display: flex;
    align-items: center;
    
}

/*.accordion .icon {
    background: url(C:\Users\lozaa\OneDrive\Desktop\THESIS\chatbot\static\question-icon.png);
    margin: 10px;
    padding: 0px;
    width: 10px;
    height: 20px;
    border-radius: 25%;
    float: left;
    transition: all .5s ease-in;
}*/

.accordion h6 {
    text-align: center;
    font-size: 14px;
    margin: 20px;
    padding: 0px;
    color: black;
}

.active {
    text-align: center;
    background: linear-gradient(110deg, lightskyblue 50%, #9ae7ba 50%, #f3f1b1 52%, #f1ee95 52%, #e7dbaa 0);
    color: white;
}

.panel {
    border-left: 2px solid lightskyblue;
    margin: 20px;
    padding: 0px;
    font-size: 12px;
    text-align: center;
    overflow: hidden;
    max-height: 0;
    transition: all .3s ease-in;
}



    /* Animation */
    @keyframes floatup {
        from {
            transform: translateY(14px);
            opacity: .0;
        }

        to {
            transform: translateY(0px);
            opacity: 1;
        }
    }
    /* For mobile phone, if size in less than 600px*/
    @media screen and (max-width:600px) {
        .full-chat-block {
            width: 100%;
            border-radius: 0px;
        }

        .chat-bar-collapsible {
            position: fixed;
            bottom: 0;
            right: 0;
            width: 100%;
        }

        .collapsible {
            width: 100%;
            border: 0px;
            border-top: 3px solid white;
            border-radius: 0px;
        }
    }
 </style>



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
			<!-- ---------------------------------------------------------------------------------------------------------------->









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