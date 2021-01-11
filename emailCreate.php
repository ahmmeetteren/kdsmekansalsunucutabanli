<?php
setcookie("cookie_name","cookie_value",["samesite"=>"None"]);
session_start();
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mail Oluştur</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/fd62530fb9.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="cssdosyalari/emailCreate.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    </head>
    <body>
        <div class="sidebar">
            <div class="sidebarLogo">
                <a href="main.php" class="logo">
                    <b>
                        AY<span id="TECH">TECH</span>
                    </b>
                </a>
            </div>
			<div class="profile">
				<img id="profile-pic" src="<?php echo $_SESSION["resim"] ?>">
				<span>
				<?php 
				$ad =$_SESSION["ad"];
				$soyad =$_SESSION["soyad"]; 
				echo $ad." ".$soyad;
				?>
				</span>
			</div>
			<ul class="side-menu">
				<li class="menu">
					<a href="main.php">
						<i class="fas fa-home"></i>
						<span>Anasayfa</span>
					</a>
				</li>
				<li class="menu">
					<a href="calisanlar.php">
						<i class="fas fa-briefcase"></i>
						<span>Personeller</span>
					</a>
				</li>
				<li class="menu">
					<a href="musteriler.php">
						<i class="fas fa-user"></i>
						<span>Müşteriler</span>
					</a>
				</li>
				<li class="menu">
					<a href="departmanlar.php">
						<i class="fas fa-city"></i>
						<span>Departmanlar</span>
					</a>
				</li>
			</ul>
			
        </div>
        <div class="content">
			<header class="header">
				<ul class="navbar">	
					<li class="navbar-item">
						<a href="mesajlar.php">
							<i class="fas fa-inbox"></i>
							<span class="bell-span">5</span>
						</a>
					</li>
				</ul>
				<a id="logout" href="index.php">Çıkış Yap</a>
			</header>
			<div class="mailContainer">
				<div class="emailInfo">
					<a id="mail-create" href="emailCreate.php"><i class="fa fa-pencil"></i>Mail Gönder</a>
					<ul class="email-navbar">
						<li class="li-inbox"><a href="mesajlar.php" ><i class="fa fa-inbox"></i>Gelen Kutusu<span>5</span></a></li>
					</ul>
				</div>
				<div class="compose-mail">
					<div class="compose-header">
						<span>Mail Gönder</span>
					</div>
					<div class="compose-body">
						<form class="compose-form">
							<div class="form-group">
								<label>Kime:</label>
								<input type="text"></input>
							</div>
							<div class="form-group">
								<label>Konu:</label>
								<input type="text"></input>
							</div>
							<div class="mail-area">
								<textarea type="text" rows="4" cols="50" name="mail" form="compose-form"></textarea>
							</div>
						</form>
						<div class="form-bar">
							<button><i class="fa fa-check"></i>Gönder</button>
						</div>
					</div>
				</div>
			</div>
        </div>
        
    </body>
</html>