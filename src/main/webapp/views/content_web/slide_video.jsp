<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/Assignment_Java4/img/slide_img1.jpg" alt="Los Angeles"
					class="d-block rounded" style="width: 100% ">
				<div class="carousel-caption">
					<h3>NextMoviez</h3>
					<p>Web xem phim trực tuyến miễn phí!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/Assignment_Java4/img/slide_img2.jpg" alt="Chicago"
					class="d-block rounded" style="width: 100%">
				<div class="carousel-caption">
					<h3>NextMoviez</h3>
					<p>Trải nghiệm tốt hơn khi đăng ký gói VIP!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/Assignment_Java4/img/slide_img3.jpg" alt="New York"
					class="d-block rounded" style="width: 100%">
				<div class="carousel-caption">
					<h3>NextMoviez</h3>
					<p>Có đủ các thể loại phim mong muốn!</p>
				</div>
			</div>
		</div>


		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
</body>
</html>