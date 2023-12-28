<!-- forgot_password.php -->
<?php
include './pages/core/connection.php';

if (isset($_POST['submit'])) {
    $email = mysqli_real_escape_string($conn, $_POST['email']);

    $select = "SELECT * FROM user_form WHERE email = '$email'";
    $result = mysqli_query($conn, $select);

    if (mysqli_num_rows($result) > 0) {
        // Generate a unique token
        $token = md5(uniqid(rand(), true));

        // Update the user's record with the token
        $update = "UPDATE user_form SET reset_token = '$token' WHERE email = '$email'";
        mysqli_query($conn, $update);

        // Send an email to the user with a link to reset their password
        $reset_link = "http://yourwebsite.com/reset_password.php?token=$token";
        $to = $email;
        $subject = "Password Reset";
        $message = "Click the following link to reset your password: $reset_link";
        $headers = "From: webmaster@example.com";

        mail($to, $subject, $message, $headers);

        echo "Password reset link has been sent to your email. Please check your inbox.";
    } else {
        echo "Email not found. Please enter a valid email address.";
    }
}
?>

<!-- Add the form to the HTML content of forgot_password.php -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pages / Login - Recovery Computer</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/icon.png" rel="icon">
    <link href="assets/img/icon.png" rel="apple-touch-icon">


    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="./assets/css/login.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

    <head>
        <!-- Add your head content here -->
    </head>

<body>
    <div class="form-container">
        <form action="" method="post">
            <h3>Forgot Password</h3>
            <input type="email" name="email" required placeholder="Enter your email">
            <input type="submit" name="submit" value="Submit" class="form-btn">
            <p><a href="login.php">Back to Login</a></p>
        </form>
    </div>
</body>

</html>