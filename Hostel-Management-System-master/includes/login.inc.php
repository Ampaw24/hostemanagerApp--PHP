<?php
session_start();
include("config.inc.php");
error_reporting(0);

if(isset($_POST['login-submit'])) {
    $roll = $_POST['student_roll_no'];
    $password = md5($_POST['pwd']);

    // Check if roll number and password are provided
    if(empty($roll) || empty($password)) {
        header("Location: ../index.php?error=emptyfields");
        exit();
    }

    // Retrieve user data from the database
    $query = "SELECT * FROM student WHERE Student_id='$roll' AND Pwd='$password'";
    $result = mysqli_query($con, $query);

    if(!$result) {
        // Database query failed
        header("Location: ../index.php?error=sqlerror");
        exit();
    }

    // Check if user exists
    if(mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);

        // Start session variables
        $_SESSION['roll'] = $row['Student_id'];
        $_SESSION['fname'] = $row['Fname'];
        $_SESSION['lname'] = $row['Lname'];
        $_SESSION['mob_no'] = $row['Mob_no'];
        $_SESSION['department'] = $row['Dept'];
        $_SESSION['year_of_study'] = $row['Year_of_study'];
        $_SESSION['hostel_id'] = $row['Hostel_id'];
        $_SESSION['room_id'] = $row['Room_id'];

        // Redirect to home page upon successful login
        header("Location: ../home.php?login=success");
        exit();
    } else {
        // User does not exist
        header("Location: ../index.php?error=nouser");
        exit();
    }
}
?>
