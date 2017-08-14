<?php
if(isset($_POST['id']) && !empty($_POST['id'])) {
    $id = $_POST['id'];
    $csv = file("links.csv");
    unset($csv[$id]);
    file_put_contents("links.csv", implode($csv));
    echo $id;
}
else {
    die(header("HTTP/1.0 404 Not Found")); //Throw an error on failure
}
?>