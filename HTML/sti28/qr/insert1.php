<!-- connect to database -->
<?php
/*
    include('../db.php');
    
    //to insert
    if(isset($_POST['text'])){

    	date_default_timezone_set("asia/manila");
        $voice = new com("SAPI.SpVoice");
        $text =$_POST['text'];
        $message = "Time In";
        $message1 = "Time Out";
        $date = date('Y-m-d');
        $time =  date('h:i:A', strtotime("+0 HOURS"));

        $sql = "SELECT * FROM attendance WHERE ROOMINFO = '$text' AND LOGDATE = '$date' AND STATUS = '0'";
        $query = $conn->query($sql);
        if($query->num_rows > 0){
            $sql = "UPDATE attendance SET TIMEOUT = '$time', STATUS = '1' WHERE ROOMINFO = '$text' AND LOGDATE = '$date'";
            $query = $conn->query($sql);
  
          }else{        
            $sql = "INSERT INTO attendance(ROOMINFO,TIMEIN,LOGDATE,STATUS) VALUES('$text', '$time', '$date' ,'0')";
            if($conn->query($sql) ===TRUE ){

            }else{
            $_SESSION['error']=$conn->error;
            }
        }

        }else{
        $error="Please scan your QR Code Number";  
            //$_SESSION['error'] = "Please scan your QR Code Number";

    }
    header("location: index.php");  	

    $conn->close();
*/
?>