<?php
/*
session_start();
*/
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Header</title>

    <!-- External CSS -->
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500&display=swap">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/media-queries.css">
</head>
<body>

<!-- Header Container -->
<div id="header">
    <!-- Header Content -->
    <div class="header">
        <!-- Menu Button -->
        <div>
            <a class="btn btn-primary btn-customized open-menu" href="#" role="button">
                <i class="fas fa-align-left"></i> <span>Menu</span>
            </a>
        </div>

        <!-- Logo -->
        <a href="../home/home.php" class="logo">STI</a>

        <!-- Profile Button -->
        <nav>
            <!-- Profile Button -->
            <img src="../images/img_avatar.png" class="user-pic" onclick="toggleMenu()">
        </nav> 

        <!-- Profile Dropdown -->
        <div class="sub-menu-wrap" id="subMenu">
            <div class="sub-menu">
                <div class="user-info">
                    <img src="../images/img_avatar.png">
                    <h3><?php // echo $_SESSION['UNAME']; ?></h3>
                </div>
                <hr>
                <a href="../profile/profile.html" class="sub-menu-link">
                    <p>Edit Profile</p>
                    <span>></span>
                </a>
                <a href="../settings/settings.html" class="sub-menu-link">
                    <p>Settings</p>
                    <span>></span>
                </a>
                <a href="../assets/php/logout.php" class="sub-menu-link">
                    <p>Logout</p>
                    <span>></span>
                </a>
            </div> 
        </div>
        <!-- Script for Displaying Profile Click -->
        <script>
            
            let subMenu = document.getElementById("subMenu");

            
            function toggleMenu(){
                subMenu.classList.toggle("open-menu");
            }
            
        </script>
    </div>

    <!-- Wrapper -->
    <div class="wrapper">
        <!-- Sidebar -->
        <nav class="sidebar">
            <!-- Close Sidebar Menu -->
            <div class="dismiss">
                <i class="fas fa-arrow-left"></i>
            </div>
            <div class="logo">
                <img src="../images/sti_logo.png" alt="sti_logo">
            </div>
            <ul class="list-unstyled menu-elements">
                <li class="active">
                    <a class="scroll-link" href="../home/home.php"><i class="fas fa-home"></i> Home</a>
                </li>
                <li>
                    <a class="scroll-link" href="../search/search.php"><i class="fas fa-search"></i> Search</a>
                </li>
                <li>
                    <a class="scroll-link" href="../map/map.php"><i class="fas fa-map"></i> Map</a>
                </li>
                <li>
                    <a class="scroll-link" href="../QR/index.php"><i class="fas fa-pencil-alt"></i> QR</a>
                </li>
                <li>
                    <a class="scroll-link" href="../chat/index.php"><i class="fas fa-envelope"></i> Chat Bot</a>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar -->
    </div>
    <!-- End Wrapper -->

    <!-- Javascript -->
    <script src="../assets/js/jquery-3.3.1.min.js"></script>
    <script src="../assets/js/scripts.js"></script>
</div>
</body>
</html>
