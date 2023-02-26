<?php 
session_start();
 ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!--Title at the top left-->
    <title>Header</title>

    <!-- Required meta tags which idk -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--links to External CSS-->
    <link rel="stylesheet" href="../assets/css/main.css">

    <!--links to External JS-->
    <script src="../profile/profile.js"></script>
</head>

<body>
    <!-- container for imported header content-->
    <div id="header">
        <!-- container for the header code-->
        <div class="header">

            <!--Logo-->
            <a href="../home/home.php" class="logo">STI</a>

            <!--profile button-->
            <nav>
                <img src="../images/img_avatar.png" class="user-pic" onclick="toggleMenu()">
            </nav>

            <!--Profile-->
            <div class="sub-menu-wrap" id="subMenu">
                <div class="sub-menu">
                    <div class="user-info">
                        <img src="../images/img_avatar.png">
                        <h3><?php echo $_SESSION['UNAME']; ?><h3>
                    </div>
                    <!--Profile onclick content-->
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
</body>
</html>