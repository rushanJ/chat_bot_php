<?php
session_start();
$item=$_POST["item"];
$_SESSION["item"]=$_POST["item"];



include_once "config.php";
$sql = "CALL `getItemByName`('$item')";
echo $sql;
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  
    while($row = $result->fetch_assoc()) {
        $id= $row["id"];
        $_SESSION["item"]=$id;
        $name= $row["name"];
        header("Location:../ans.php?answer=What do you want to know about $item?"); 
exit;
    }
} else {
    header("Location:../unknownDevice.php?answer= Unable To Find $item On Our Daytbases Yet . Please Try again soon"); 
    exit;
}

$conn->close();


// header("Location:../ans.php?answer=What do you want to know about $item); 
// exit;



?>