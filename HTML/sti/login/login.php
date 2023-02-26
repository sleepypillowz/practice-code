<?php
include('../assets/php/db.php');
if(isset($_SESSION['IS_LOGIN'])){
  header('location:../home/home.php');
  die();
}
if(isset($_POST['submit'])){
  $username=mysqli_real_escape_string($con,$_POST['username']);
  $password=mysqli_real_escape_string($con,$_POST['password']);

  $res=mysqli_query($con,"select * from users where username='$username'");

  if(mysqli_num_rows($res)>0){
    $row=mysqli_fetch_assoc($res)
;   $verify=password_verify($password,$row['password']);
    if($verify==1){
      $_SESSION['IS_LOGIN']=true;
      $_SESSION['UNAME']=$row['username']; //shows the user's username
      header('location:../home/home.php');
      die();
    }else{
      echo "Please enter correct password";
    }
  }else{
    echo "Pllease enter correct username";
  }
}
if(isset($_POST['register'])){
  header('location:../register/register.php');
  }
?>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="login.css">

</head>
<body>

<div class="container">
  <form method="post">
    <div class="row">
      <h2 style="text-align:center">Login with Social Media or Manually</h2>

      <div class="col">
        <a href="#" class="fb btn">
          <i class="fa fa-facebook fa-fw"></i> Login with Facebook
         </a>
        <a href="#" class="twitter btn">
          <i class="fa fa-twitter fa-fw"></i> Login with Twitter
        </a>
        <a href="#" class="google btn"><i class="fa fa-google fa-fw">
          </i> Login with Google+
        </a>
      </div>

      <div class="col">
        <div class="hide-md-lg">
          <p>Or sign in manually:</p>
        </div>

        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login" name="submit">
      </div>
      
    </div>
  </form>
</div>

<div class="bottom-container">
  <div class="row">
    <div class="col">
      <a href="../register/register.php" style="color:white" class="btn">Sign up</a>
    </div>
    <div class="col">
      <a href="#" style="color:white" class="btn">Forgot password?</a>
    </div>
  </div>
</div>

</body>
</html>
