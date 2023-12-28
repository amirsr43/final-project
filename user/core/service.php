<?php
require_once("connection.php");
$conn = new mysqli($databaseHost, $databaseUsername, $databasePassword, $databaseName);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $merk = $_POST['merk'];
    $detail = $_POST['detail'];
    $foto = $_FILES['foto']['name'];
    $token = $_POST['token'];
    $idPesan = $_POST['id_pesan'];
    $tanggal = $_POST['tanggal'];
    $jam = $_POST['jam'];
    $nama_lengkap = $_POST['nama_lengkap'];
    $telepon = $_POST['telepon'];
    $price = $_POST['price'];

    $tempFoto = $_FILES['foto']['tmp_name'];

    $randomFilename = time() . '-' . md5(rand()) . '-' . $foto;

    $uploadDirectory = 'path/to/upload/directory/'; // Customize this directory path

    $uploadPath = $uploadDirectory . $randomFilename;

    $allowedExtensions = array('jpg', 'jpeg', 'png', 'gif'); // Allowed extensions

    $fileExtension = strtolower(pathinfo($uploadPath, PATHINFO_EXTENSION)); // Get file extension

    if (!in_array($fileExtension, $allowedExtensions)) {
        echo "Hanya file gambar yang diizinkan: JPG, JPEG, PNG, GIF";
        exit();
    }

    if (!is_dir($uploadDirectory)) {
        mkdir($uploadDirectory, 0777, true); // Create directory if not exists
    }

    if (move_uploaded_file($tempFoto, $uploadPath)) {
        $fotoPath = 'path/to/uploaded/files/' . $randomFilename; // Adjust this path according to your file storage
        $sql = "INSERT INTO service_requests (merk, foto, detail, token, id_pesan, tanggal, jam, nama_lengkap, telepon, price) VALUES ('$merk', '$fotoPath', '$detail', '$token', '$idPesan', '$tanggal', '$jam', '$nama_lengkap', '$telepon', '$price')";

        if ($conn->query($sql) === TRUE) {
            echo "pengiriman anda telah diterima";
            header("Location: /help-center/help-center/help-center/user/content/service/service.php");
            exit();
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error; // Pesan error jika terjadi masalah pada query
        }
    } else {
        echo "Gagal mengunggah file";
    }
}
