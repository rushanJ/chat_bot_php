<?php

include "config.php";
$sql = "CALL `getCommenQuestions`();";
// echo $sql;
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  
    while($row = $result->fetch_assoc()) {
        $question= $row["question"];
        $id= $row["id"];
        
        echo "
     
      <option value=\"$id\">$question</option>
      
        
        
     
     
        ";
    }
} else {
    echo "
    
      ";
}
$conn->close();





?>