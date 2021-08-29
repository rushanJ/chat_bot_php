<?php

 include_once "config.php";
$sql = "CALL `getItems`();";
// echo $sql;
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  
    while($row = $result->fetch_assoc()) {
        $name= $row["name"];
        $id= $row["id"];
        
        echo "
      <tr>
        <td>$id</td>
        <td>$name</td>
      
        <td><a href='itemSpec.php?id=$id'>Add Specifications</a></td>
        
      </tr>
     
        ";
    }
} else {
    echo "
    <tr collspan=4><td> No Data Available Yet</td>
   
    </tr>
      ";
}
$conn->close();




?>