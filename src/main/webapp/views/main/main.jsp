<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap_css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<!-- bootstrap_icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- bootstrap_js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

<style>
.main {
	background-color: aqua;
	width: 100%;
	height: 100vh;
}

.nav {
	background: linear-gradient(#000, rgba(0, 0, 0, .98) 10%,
		rgba(0, 0, 0, .95) 18%, rgba(0, 0, 0, .88) 25%, rgba(0, 0, 0, .8) 32%,
		rgba(0, 0, 0, .71) 38%, rgba(0, 0, 0, .61) 44%, rgba(0, 0, 0, .5) 50%,
		rgba(0, 0, 0, .39) 57%, rgba(0, 0, 0, .29) 63%, rgba(0, 0, 0, .2) 69%,
		rgba(0, 0, 0, .12) 76%, rgba(0, 0, 0, .05) 83%, rgba(0, 0, 0, .02) 91%);
	height: 20vh;
	position: absolute;
	top: 0;
	z-index: 999;
	width: 100%;
}

.logo {
	width: 100px;
	height: 100px;
	filter: drop-shadow(7px 5px 5px rgb(110, 223, 112));
}

#offcanvasRight1, #offcanvasRight2 {
	width: 100%;
	height: 100%;
	background-color: rgba(51, 50, 49, 0.5);
}

.footer {
	width: 100%;
	height: 33vh;
	background: linear-gradient(rgba(0, 0, 0, .02) 10%, rgba(0, 0, 0, .05)
		18%, rgba(0, 0, 0, .12) 25%, rgba(0, 0, 0, .2) 32%, rgba(0, 0, 0, .29)
		38%, rgba(0, 0, 0, .39) 44%, rgba(0, 0, 0, .5) 50%, rgba(0, 0, 0, .61)
		57%, rgba(0, 0, 0, .71) 63%, rgba(0, 0, 0, .8) 69%, rgba(0, 0, 0, .88)
		76%, rgba(0, 0, 0, .95) 83%, rgba(0, 0, 0, .98) 91%, #000);
	position: absolute;
	bottom: 0;
	z-index: 999;
}

.name-gioiThieu {
	position: absolute;
	top: 180px;
	left: 50px;
}

.store {
	width: 120px;
	height: 7vh;
}
</style>
</head>

<body>


	<nav class="navbar nav">

		<div class="container-fluid">
			<div class="d-flex ">
				<img class="rounded-circle logo m-4"
					src="/Assignment_Java4/img/logo_img.png" alt="">
				<h2 class="mt-5 text-success">NextMoviez</h2>
			</div>
			<div class="d-flex mb-5">
				<button class="btn btn-success me-5 ${btn_text}" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight1"
					aria-controls="offcanvasRight">Đăng nhập</button>
				<button class="btn  btn-warning me-5" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight2"
					aria-controls="offcanvasRight">Đăng ký</button>
			</div>
		</div>
	</nav>

	<main>
		<div id="carouselExampleDark" class="carousel carousel-dark slide">

			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img src="/Assignment_Java4/img/slide_img1.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption name-gioiThieu d-none d-md-block">
						<div class="d-flex align-items-end flex-column mb-3"
							style="height: 100px;">
							<div class="p-2">
								<h1 class="text-light">NextMoviez</h1>
								<p class="text-light">Website chia sẽ video.</p>
							</div>


						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/Assignment_Java4/img/slide_img2.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption name-gioiThieu d-none d-md-block">
						<div class="d-flex align-items-end flex-column mb-3"
							style="height: 100px;">
							<div class="p-2">
								<h1 class="text-danger">NextMoviez</h1>
								<p class="text-light">Website chia sẽ video.</p>
							</div>


						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/Assignment_Java4/img/slide_img3.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption name-gioiThieu d-none d-md-block">
						<div class="d-flex align-items-end flex-column mb-3"
							style="height: 100px;">
							<div class="p-2">
								<h1 class="text-success">NextMoviez</h1>
								<p class="text-light">Website chia sẽ video.</p>
							</div>


						</div>

					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
			<footer class="footer d-flex justify-content-evenly">
				<div class="">
					<h3 class="m-3 text-light">TV</h3>
					<h5 class="ms-4 text-light">Tải và xem phim tại app</h5>
					<div class="m-3">
						<div class="d-flex ms-4">
							<a class="text-decoration-none" href="#"> <img class="store"
								alt="" src="/Assignment_Java4/img/icon_store.png">
							</a> <a class="text-decoration-none" href="#"> <img class="store"
								alt="" src="/Assignment_Java4/img/icon_play.png">


							</a>
						</div>
					</div>



				</div>
				<div class="">
					<div class="m-3">
						<h3 class="text-light">Thỏa thuận điều kiện</h3>
						<a class="text-light ms-4 mt-4 text-decoration-none" href="#">Thỏa
							thuận quyền riêng tư </a><br> <a
							class="text-light ms-4 mt-4 text-decoration-none" href="#">Thỏa
							thuận và điều khoản </a><br> <a
							class="text-light ms-4 mt-4 text-decoration-none" href="#">Chính
							sách cookie</a><br>
					</div>
				</div>
				<div class="">
					<div class="m-3">
						<h3 class="text-light">Về chúng tôi</h3>

						<p class="text-light ms-4 ">
							<i style="width: 125px; height: 125px;"
								class="bi bi-houses-fill text-success me-3"></i>Cẩm lệ-Liên
							Chiểu-Đà Nẵng
						</p>
						<p class="text-light ms-4 ">
							<i class="bi bi-telephone-inbound-fill text-info me-3"></i>
							0912223333
						</p>
						<p class="text-light ms-4">liên hệ với chúng tôi</p>
						<div class="d-flex ms-4">

							<a class="text-light ms-4 text-decoration-none"
								href=" https://github.com/"><i
								class="bi bi-github text-secondary"></i></a> <a
								class="text-light ms-4 text-decoration-none"
								href="https://vi-vn.facebook.com/"> <i
								class="bi bi-facebook text-primary "></i></a> <a
								href="https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&emr=1&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&osid=1&passive=1209600&service=mail&ifkv=ARZ0qKKkvmm2vgZ92NQW-FUmBc4Gr867AH4qu-uE5Pgf_0sAvkpLIsKlkuk4Pfmnt3ev1K-3sANs&theme=mn&ddm=0&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
								class="text-light ms-4 text-decoration-none"><i
								class="bi bi-envelope-at-fill text-warning"></i></a> <a
								class="text-light ms-4 text-decoration-none"
								href=" https://github.com/"><i
								class="bi bi-youtube text-danger"></i></a>
						</div>

					</div>
				</div>
			</footer>
		</div>

	</main>






	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight1"
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title text-light" id="offcanvasRightLabel">Đăng
				nhập</h5>
			<button type="button" class="btn-close bg-light"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body d-flex justify-content-center">
			<div>
				<jsp:include page="login.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight2"
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title text-light" id="offcanvasRightLabel">Đăng
				ký</h5>
			<button type="button" class="btn-close bg-light"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body d-flex justify-content-center">
			<div>
				<jsp:include page="register.jsp"></jsp:include>

			</div>
		</div>
	</div>



</body>
</html>