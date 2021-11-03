<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "flutter";
    $table = "employees";

    $action = $_POST['action'];

    $conn = new mysqli($servername, $username, $password, $database);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if($action == 'CREATE_TABLE'){
        $sql = "CREATE TABLE IF NOT EXISTS $table (ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(30) NOT NULL, last_name VARCHAR(30) NOT NULL)";
        
        if ($conn->query($sql) == TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        
        $conn->close();
        return;
    }

    if($action == 'GET_ALL'){
        $data = array();
        $sql = "SELECT ID, first_name, last_name FROM $table ORDER BY ID";
        $result = $conn->query($sql);
        
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $data[] = $row;
            }

            echo json_encode($data);
        } else {
            echo "error";
        }
        
        $conn->close();
        return;
    }

    if($action == 'ADD_EMPLOYEE'){
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $sql = "INSERT INTO $table (first_name, last_name) VALUES ('$first_name', '$last_name')";
        
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if($action == 'UPDATE_EMPLOYEE'){
        $key = $_POST['employee_key'];
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $sql = "UPDATE $table SET first_name = '$first_name', last_name = '$last_name' WHERE ID = $key";
        
        if ($conn->query($sql) == TRUE) {
            echo "success";
        } else {
            echo "error";
        }

        $conn->close();
        return;
    }

    if($action == 'DELETE_EMPLOYEE'){
        $key = $_POST['employee_key'];
        $sql = "DELETE FROM $table WHERE ID = $key";

        if ($conn->query($sql) == TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        
        $conn->close();
        return;
    }  
?>