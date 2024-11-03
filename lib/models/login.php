<?php
$servername = "localhost"; // Ganti dengan server database kamu
$username = "root"; // Ganti dengan username database kamu
$password = ""; // Ganti dengan password database kamu
$dbname = "butik"; // Ganti dengan nama database kamu

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Mengambil data dari request
$data = json_decode(file_get_contents("php://input"));
$username = $data->username;
$password = $data->password;

// Menggunakan prepared statement untuk mencegah SQL injection
$stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
$stmt->bind_param("ss", $username, $password);
$stmt->execute();

$stmt->close();
$conn->close();

echo json_encode(["message" => "Data berhasil disimpan"]);
?>
