<?php
$baglanti=mysqli_connect("localhost","root","","xddddddddddd","3308");

if($baglanti){
    $sorgu=mysqli_query($baglanti,"SELECT ROUND(AVG(degerlendirme),1) FROM musteriler");
    $sonuc=mysqli_fetch_array($sorgu);
	echo $sonuc[0];
	mysqli_close($baglanti);
}else{
	die("Bağlantı sorunu.");
};

?>