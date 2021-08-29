<?php
$id=$_REQUEST["id"];
include_once "config.php";
$sql = "CALL `getItemSpecs`($id);";
// echo $sql;
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  
    while($row = $result->fetch_assoc()) {
        $description= $row["description"];
        $spec= $row["spec"];
        $id= $row["id"];
        
        echo "
      <tr>
        <td>$id</td>
        <td>$spec</td>
        <td>$description</td>
      
        
        
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