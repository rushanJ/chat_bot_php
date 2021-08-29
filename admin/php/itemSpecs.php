<?php
$id=$_REQUEST["id"];
include "config.php";
$sql1 = "CALL `getItems`();";
echo $sql1;
$result1 = $conn->query($sql1);
if ($result1->num_rows > 0) {
  
    while($row1 = $result1->fetch_assoc()) {
        $name= $row1["name"];
        $id= $row1["id"];
        
        echo "
      <tr>
        <td>$id</td>
        <td>$name</td>
      
        
        
      </tr>
     
        ";
    }
} else {
    echo "
    <tr collspan=4><td> No Rooms Available Yet</td>
   
    </tr>
      ";
}
$conn->close();




?>