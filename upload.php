<?php
$target_dir = "uploads/"; // Folder tujuan untuk menyimpan gambar yang diunggah
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($_FILES["fileToUpload"]["name"], PATHINFO_EXTENSION)); // Jenis file gambar

// Buat nama file acak
$random_name = uniqid() . '.' . $imageFileType;
$target_file = $target_dir . $random_name; // Nama file acak untuk file yang diunggah

// Proses upload gambar
if(isset($_POST["submit"])) {
    // Periksa apakah file gambar yang sebenarnya atau palsu
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
}

// Periksa apakah file sudah ada
if (file_exists($target_file)) {
    echo "Maaf, file sudah ada.";
    $uploadOk = 1;
}

// Batasi ukuran file

// Izinkan hanya beberapa format file tertentu

// Periksa apakah $uploadOk diatur ke 0 oleh suatu kesalahan
if ($uploadOk == 0) {
    echo "Maaf, file Anda tidak diunggah.";
// Jika semuanya berjalan lancar, coba unggah file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        header("Location: /uploads/" . urlencode($random_name));
        exit();
        // echo "</br>Link : https://panel.dewa.biz.id/". htmlspecialchars($random_name);
    } else {
        echo "Maaf, terjadi kesalahan saat mengunggah file.";
    }
}
?>
