<?php
session_start();
error_reporting(0);
include("config.inc.php");

if(isset($_POST['signup-submit'])) {
    $roll = $_POST['student_roll_no'];
    $fname = $_POST['student_fname'];
    $lname = $_POST['student_lname'];
    $mobile = $_POST['mobile_no'];
    $dept = $_POST['department'];
    $year = $_POST['year_of_study'];
    $password = $_POST['pwd'];
    $cnfpassword = $_POST['confirmpwd'];

    // Check if passwords match
    if($password !== $cnfpassword) {
        $_SESSION['errmsg'] = "Passwords do not match";
        header("location: user-login.php");
        exit();
    }

    // Hash the password
    $hashedPwd = md5($password);

    // Check if user already exists
    $checkQuery = "SELECT * FROM Student WHERE Student_id = '$roll'";
    $checkResult = mysqli_query($con, $checkQuery);

    if(mysqli_num_rows($checkResult) > 0) {
        $_SESSION['errmsg'] = "User with this Roll No already exists";
        header("Location: ../signup.php?error=userexists");
        exit();
    }

    // Insert user into database
    $insertQuery = "INSERT INTO Student (Student_id, Fname, Lname, Mob_no, Dept, Year_of_study, Pwd) VALUES ('$roll', '$fname', '$lname', '$mobile', '$dept', '$year', '$hashedPwd')";
    $insertResult = mysqli_query($con, $insertQuery);

    if($insertResult) {
        header("Location: ../index.php"); // Change this to your desired page after successful registration
        exit();
    } else {
        $_SESSION['errmsg'] = "Failed to create user";
        header("Location: ../signup.php?error=signupfailed");
        exit();
    }
}
?>
