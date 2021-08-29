<?php
include 'config.php';

    $itemId= $_POST['itemId'];
    $spec= $_POST['spec'];
    $discription= $_POST['discription'];
    $ref= $_POST['ref'];
    
 	
    
   
   
   
$sql = 
"CALL `addItemSpecs`('$itemId', '$spec', '$discription');
";

echo $sql;
if(mysqli_query($conn, $sql)){
    echo "Records added successfully.";	
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
}
mysqli_close($conn);
header("Location:../itemSpec.php?id=$itemId"); 
exit;


?>
