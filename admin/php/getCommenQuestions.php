<?php

include_once "config.php";
$sql = "CALL `getCommenQuestions`();";
// echo $sql;
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  
    while($row = $result->fetch_assoc()) {
        $question= $row["question"];
        $id= $row["id"];
        
        echo "
      <tr>
        <td>$id</td>
        <td>$question</td>
      
        
        
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