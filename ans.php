
<?php $ans= $_REQUEST["answer"]; 
session_start();

if (isset($_REQUEST["question"])){
include_once "php/config.php";
$question=$_REQUEST["question"];
$sessionId=$_SESSION["sessionId"];
          $sql = 
          "  CALL `addUnslovedQuestion`('$sessionId', '$question');
          ";

         

          if(mysqli_query($conn, $sql)){
              // echo "Records added successfully.";	
          } else{
              // echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
          }

          $conn->close();
        }
        else{
          // echo "Records added Unsuccessfully.";	
        }
        if (isset($_REQUEST["ref"])){
          include_once "php/config.php";
          $ref=$_REQUEST["ref"];
           $sessionId=$_SESSION["sessionId"];
                    $sql = 
                    "  CALL `markCombinationForQuestion`('$sessionId', '$ref');;
                    ";
          
                   
          
                    if(mysqli_query($conn, $sql)){
                        // echo "Records added successfully.";	
                    } else{
                        // echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
                    }
          
                    $conn->close();
                  }
                  else{
                    // echo "Records added Unsuccessfully.";	
                  }
?>


<!DOCTYPE html>
<html>
    <head>
        <title>Chatbot</title>
    </head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style>
  body{
    color: #ffffff;
  }
input[type=text], select ,textarea{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #493faa;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #5d54af;
}

div {
  border-radius: 5px;
  padding: 20px;
}
</style>
<body background="bg.jpg" style="background-repeat: no-repeat;background-size: cover;">

<h3 style="text-align: center;">Chatbot</h3>
<div class="container" style="margin-top: 10%;">
<div class="row" >
    <div class="col-md-4"></div>
    <div class="col-md-4">
    <form action="php/askQuestion.php" method="POST">
     
        <textarea name="" id="" cols="30" rows="5"><?php echo $ans ?> </textarea>
        <br><br><br>
        <label for="type">Type here</label><br>
        <input type="text" id="msg" name="question" style="width: 70%;float: left;">

        <input type="submit" value="Send" >
    </form>
    </div>
    <div class="col-md-4"></div>
</div>
</div>

</body>
</html>
