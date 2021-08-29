<?php


session_start();
$question=$_POST["question"];
$itemId=$_SESSION["item"];
$_SESSION["sessionId"]="1qw2e33r45t";
$sessionId=$_SESSION["sessionId"];

include_once "config.php";
$sql = "CALL `searchAnswerLevel0`('$question','$itemId');";
echo $sql;
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  
    while($row = $result->fetch_assoc()) {
        $description= $row["description"];
        $id= $row["id"];
        // $_SESSION["item"]=$id;
        // $name= $row["name"];
        header("Location:../ans.php?answer=$description&ref=$id"); 
      exit;
     
    }
} 
 else {
  header("Location:../ans.php?answer==Sorry!!Result Not Found.. I'm Still Learning.. Can You Ask that Question again . Thank You!!&question=$question"); 
  exit;
  
       }

$conn->close();


// header("Location:../ans.php?answer=What do you want to know about $item); 
// exit;



?>
