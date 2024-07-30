<br>
<?php 
	if (!isset($_GET['menu'])) {
	 	header('location:hal_utama.php?menu=home');
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>HOME</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 style="color: #545151; margin-top: -10px;">Selamat Datang <?php echo $_SESSION['nama_petugas']; ?>, di Aplikasi Pembayaran Listrik UBSI Pasca Bayar</h3>
				<center style="margin-top:30px;"><img src="../images/logo_pln5.png" width="81%"></center>
			</div>
		</div>
	</div>
</body>
</html>