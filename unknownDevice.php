
<?php $ans= $_REQUEST["answer"]; ?>
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
input[type=text], select {
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
        <input type="text" id="msg" name="msg" readonly value="<?php echo $ans ?>?> " style="width: 70%;float: right;"><br><br><br><br>
        <label for="type">Type here</label><br>
        <input type="text" id="msg" name="msg" style="width: 70%;float: left;">

        <input type="submit" value="Send" >
    </form>
    </div>
    <div class="col-md-4"></div>
</div>
</div>

</body>
</html>
