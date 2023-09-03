<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="../main.css">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
</head>
<body>
    <?php
    /*
    include('../assets/php/db.php');
    
    if (!isset($_SESSION['IS_LOGIN'])) {
        header('location: ../login/login.php');
        die();
    }
    */
    ?>

    <!-- Import header -->
    <div id="header"></div>

    <!-- Start body -->
    <div class="card-grid">
        <!-- Card 1 -->
        <div class="card">
            <div class="card-header">123 Main St</div>
            <div class="card-body">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Itaque facilis rerum corporis iusto odio
                numquam cumque pariatur neque nostrum rem.
            </div>
            <div class="card-footer">
                <button class="btn">Details</button>
                <button class="btn btn-outline">Contact Seller</button>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="card card-shadow">
            <div class="card-header">123 Main St</div>
            <div class="card-body">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Itaque facilis rerum corporis iusto odio
                numquam cumque pariatur neque nostrum rem.
            </div>
            <div class="card-footer">
                <button class="btn">Details</button>
                <button class="btn btn-outline">Contact Seller</button>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="card card-shadow">
            <div class="card-header card-image">
                <img src="https://source.unsplash.com/TiVPTYCG_3E" alt="Card Image">
            </div>
            <div class="card-body">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Itaque facilis rerum corporis iusto odio
                numquam cumque pariatur neque nostrum rem.
            </div>
            <div class="card-footer">
                <button class="btn">Details</button>
                <button class="btn btn-outline">Contact Seller</button>
            </div>
        </div>
    </div>
    <!-- End body -->

    <!-- Your scripts here (if needed) -->
    <script>
        $(function(){
            $("#header").load("../header.php");
        });
    </script>
</body>
</html>
