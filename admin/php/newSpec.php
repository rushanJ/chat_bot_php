<?php
include 'config.php';

    $name= $_POST['name'];
    
 	
    
   
   
   
$sql = 
" CALL `addCommenQuestion`('$name'); 
";

echo $sql;
if(mysqli_query($conn, $sql)){
    echo "Records added successfully.";	
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
}
mysqli_close($conn);
header("Location:../commenQuestions.php"); 
exit;


?>
