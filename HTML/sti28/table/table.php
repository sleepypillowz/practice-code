<?php
/*
include('../assets/php/db.php');

if(!isset($_SESSION['IS_LOGIN'])){
	header('location:../login/login.php');
	die();
}
*/
?>
<!DOCTYPE html>
<html>

<head>
    <!--Title at the top left-->
    <title>Table</title>

    <!--I have no idea-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--links to External CSS-->
    <link rel="stylesheet" href="../main.css">
    <link rel="stylesheet" href="table.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!--JQuery Script to import header.html-->
    <script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
    </script>

    <!--Load Script-->
    <script>
    $(function() {
        $("#header").load("../header.php");
    });
    </script>
</head>


<body>
    <!--imported header-->
    <div id="header"></div>

<?php
    $con = mysqli_connect("localhost","root","","test_db",3307);
    $query = "SELECT * FROM users";
    $query_run = mysqli_query($con, $query);
    ?>




    <!--start body-->
    <?php
    if(mysqli_num_rows($query_run) > 0)
    {
    ?>

    <table id="customers">
        <tr>
            <th>Username</th>
        </tr>

    <?php
        foreach($query_run as $items)
        {
    ?>
        <tr>
            <td><?= $items['username']; ?></td>
        </tr>
    </table>

    <?php
        }
    }
    

?>
    <!--end body-->
</body>

</html>