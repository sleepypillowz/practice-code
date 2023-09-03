
<?php
/*
include('../db.php');
if(isset($_SESSION['IS_LOGIN'])){
  header('location:../login/login.php');
  die();

}

if(isset($_POST['submit'])){
  $username=$_POST['username'];
  $password=$_POST['password'];

  if(mysqli_num_rows(mysqli_query($con,"select * from users where username='$username'"))>0){
    echo "Username already exists";
  }else{
    $password=password_hash($password,PASSWORD_DEFAULT);
    mysqli_query($con,"insert into users(username,password) values('$username','$password')");
    echo "Thank you";
  }
}
*/
?>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="register.css">
</head>
<body>

<form method="post">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="username"><b>Username</b></label>
    <input type="text" placeholder="Enter username" name="username" id="username" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" id="password" required>

    <button type="submit" class="registerbtn" name="submit">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="../login/login.php">Sign in</a>.</p>
  </div>
</form>

</body>
</html>
