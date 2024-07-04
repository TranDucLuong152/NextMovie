<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
<style type="text/css">
.main {
	width: 100%;
	height: 100vh;
	background: linear-gradient(to right, rgb(126, 131, 131), rgb(0, 0, 0),
		rgb(126, 131, 131));
}

.logo {
	width: 100px;
	height: 100px;
	filter: drop-shadow(7px 5px 5px rgb(110, 223, 112));
}

.text-linear-gradient {
	font-size: 37px;
	background: -webkit-linear-gradient(rgb(43, 62, 138), rgb(64, 167, 176));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.nav-link {
	color: white;
}

.nav-item:hover .nav-link {
	color: blue;
}

.content {
	height: 100vh;
	overflow: auto;
	border: 1px solid #ccc;
}

.scrollbar {
	overflow-y: scroll;
	scrollbar-width: thin;
	scrollbar-color: rgba(0, 0, 0, .00) rgba(0, 0, 0, .00);
}

::-webkit-scrollbar {
	width: 12px;
}

::-webkit-scrollbar-thumb {
	background-color: rgba(0, 0, 0, .00);
}

::-webkit-scrollbar-track {
	background-color: rgba(0, 0, 0, .00);
}

.show-content {
	margin-top: 15vh;
	width: 100%;
}

.navbar {
	position: fixed;
	top: 0;
	z-index: 999;
	height: 13vh;
	width: 959px;
	background-color: linear-gradient(rgba(0, 0, 0, .12), rgba(0, 0, 0, .02));
	width: 959px;
}

.card {
	width: 12rem;
	height: 30vh;
}

.card-body {
	display: none;
	position: absolute;
	z-index: 999;
}

.card:hover .card-body {
	width: 100%;
	height: 30vh;
	background-color: rgba(64, 61, 61, 0.4);
	display: block;
	position: absolute;
	z-index: 999;
}

.btn_icon_color {
	width: 35px;
	background-color: rgba(247, 247, 245, 0.1);
}

.card-img-top {
	height: 30vh;
}

.menu_right {
	height: 15vh;
}

.admin_img {
	width: 30px;
	height: 30px;
}

.img_video_list1 {
	height: 15vh;
}

.video_list1 {
	width: 12rem;
	height: 15vh;
}

.icon_play {
	position: absolute;
	z-index: 999;
	display: none;
}

.video_list1:hover .icon_play {
	width: 100%;
	height: 15vh;
	background-color: rgba(64, 61, 61, 0.4);
	display: block;
	position: absolute;
	z-index: 999;
}

.btn_video {
	width: 100%;
	height: 15vh;
	background-color: rgba(0, 0, 0, .00);
}

.pe-none {
	pointer-events: none;
	user-select: none;
}
</style>
</head>
<body>

	<main class="main d-flex">
		<div class="col-2 border-0 d-flex flex-column">
			<div class="m-3">
				<img class="rounded-circle logo ms-5"
					src="/Assignment_Java4/img/logo_img.png">
				<h2 class="text-linear-gradient">NextMoviez</h2>
			</div>
			<div class="mt-3 ms-3 d-flex flex-column">
				<h6 class="text-light">Menu</h6>
				<a href="#home" class="m-2 text-decoration-none text-light"><i
					class="bi bi-house-fill text-info  me-2"></i>Trang chủ</a> <a
					href="#movie" class="m-2 text-decoration-none text-light"><i
					class="bi bi-film text-success me-2"></i>Phim thịnh hành</a> <a
					href="#" class="m-2 text-decoration-none text-light"><i
					class="bi bi-card-list text-primary me-2"></i>Kho phim</a> <a href="#"
					class="m-2 text-decoration-none text-light"><i
					class="bi bi-arrow-down-square-fill text-warning  me-2"></i>Tải
					xuống</a>
			</div>
			<div class="mt-3 ms-3 d-flex flex-column">
				<h6 class="text-light">Library</h6>
				<a href="/Assignment_Java4/favorite"
					class="m-2 text-decoration-none text-light"><i
					class="bi bi-postcard-heart text-danger-emphasis me-2"></i>Phim yêu
					thích</a> <a href="#" class="m-2 text-decoration-none text-light"><i
					class="bi bi-stack text-primary-emphasis me-2"></i>Phim xếp hạng</a> <a
					href="#" class="m-2 text-decoration-none text-light"><i
					class="bi bi-share-fill text-info  me-2"></i>Phim đã chia sẽ</a>
			</div>
			<div class="mt-3 ms-3 d-flex flex-column">
				<h6 class="text-light">General</h6>
				<a href="#" class="m-2 text-decoration-none text-light"><i
					class="bi bi-gear text-primary-emphasis me-2"></i>Cài đặt</a> <a
					href="/Assignment_Java4/DangXuat"
					class="m-2 text-decoration-none text-light"><i
					class="bi bi-box-arrow-right text-danger me-2 "></i>Đăng xuất</a>

			</div>

		</div>
		<div class="col-8 border-0 content ">
			<nav class="navbar navbar-expand-lg">
				<div class="container ms-5 me-5">
					<div class="nav-item">
						<a class="navbar-brand nav-link" href="#movie">Movies</a>
					</div>

					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="#newmovie">TV Shows</a></li>
							<li class="nav-item item-anime"><a class="nav-link"
								href="#anime">Phim ma</a></li>

						</ul>
						<form class="d-flex bg-light rounded" role="search">
							<input class="form-control me-2 border border-0" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn" type="submit">
								<i class="bi bi-search"></i>
							</button>
						</form>
					</div>
				</div>
			</nav>






			<div class="show-content">

				<div class="d-flex justify-content-center m-2  rounded" id="home">
					<jsp:include page="${video_jsp}"></jsp:include>
				</div>
				<div class="m-5" id="movie">
					<div class="hstack gap-3">

						<h2 class="text-light p-2">Phim đặc sắc</h2>
						<div class="btn-group p-2 ms-auto" role="group"
							aria-label="Basic outlined example">
							<button class="btn ${btnper_phimds}">
								<i class="bi bi-arrow-left-short text-light"></i>
							</button>
							<label class="m-2 text-light">1/${size_phimds}</label>
							<button class="btn">
								<i class="bi bi-arrow-right-short text-light"></i>
							</button>
						</div>
					</div>


					<div class="video_item d-flex">
						<c:forEach var="item" items="${phim_DS}" begin="0" end="3">
							<div class="card ms-3 border-0">
								<img src="${item.hinhAnh}" class="card-img-top rounded"
									alt="...">



								<div class="card-body">
									<h6 class="card-title text-light">${item.tenVideo}</h6>
									<div class="d-flex">
										<i class="bi bi-star-fill text-warning"></i> <i
											class="bi bi-star-fill text-warning"></i> <i
											class="bi bi-star-fill text-warning"></i> <i
											class="bi bi-star-fill text-warning"></i> <i
											class="bi bi-star-half text-warning"></i>

									</div>
									<div class="mt-4">
										<p class="text-light">lượt xem:</p>
									</div>
									<div class="mt-4 d-flex">
										<button class="m-1 mt-2 mb-2 rounded border-0 btn_icon_color"
											type="button" data-bs-toggle="modal"
											data-bs-target="#exampleModal">
											<i class="bi bi-share text-primary"></i>
										</button>
										<a
											href="/Assignment_Java4/favorite_video/?id_video=${item.videoID}"><button
												class="mt-2 p-2  rounded border-0 btn_icon_color">
												<i class="bi bi-heart-fill text-light"></i>
											</button></a> <a href="/Assignment_Java4/fill_video/?id=${item.videoID}"><button
												type="button" class="btn btn-info m-2">Xem</button></a>

									</div>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="m-5 " id="newmovie">

					<div class="hstack gap-3">

						<h2 class="text-light">Phim khoa học viễn tưởng</h2>
						<div class="btn-group p-2 ms-auto" role="group"
							aria-label="Basic outlined example">
							<button class="btn ${btnper_phimkh}">
								<i class="bi bi-arrow-left-short text-light "></i>
							</button>
							<label class="m-2 text-light">1/${size_phimkh}</label>
							<button class="btn">
								<i class="bi bi-arrow-right-short text-light"></i>
							</button>
						</div>
					</div>
					<div class="video_item d-flex">
						<c:forEach var="item" items="${phim_KH}" begin="0" end="3">
							<div class="card ms-3 border-0">
								<img src="${item.hinhAnh}" class="card-img-top rounded"
									alt="...">
								<div class="card-body">
									<h6 class="card-title text-light">${item.tenVideo}</h6>
									<div class="d-flex">
										<i class="bi bi-star-fill text-warning"></i> <i
											class="bi bi-star-fill text-warning"></i> <i
											class="bi bi-star-fill text-warning"></i> <i
											class="bi bi-star-fill text-warning"></i> <i
											class="bi bi-star-half text-warning"></i>

									</div>
									<div class="mt-4">
										<p class="text-light">lượt xem:</p>
									</div>
									<div class="mt-4 d-flex">
										<button class="m-1 mt-2 mb-2 rounded border-0 btn_icon_color"
											type="button" data-bs-toggle="modal"
											data-bs-target="#exampleModal">
											<i class="bi bi-share text-primary"></i>
										</button>
										<a
											href="/Assignment_Java4/favorite_video/?id_video=${item.videoID}"><button
												class="mt-2 p-2  rounded border-0 btn_icon_color">
												<i class="bi bi-heart-fill text-light"></i>
											</button></a> <a href="/Assignment_Java4/fill_video/?id=${item.videoID}"><button
												type="button" class="btn btn-info m-2">Xem</button></a>

									</div>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="m-5 " id="anime">

					<div class="hstack gap-3">

						<h2 class="text-light">Phim Hành Động</h2>
						<div class="btn-group p-2 ms-auto" role="group"
							aria-label="Basic outlined example">
							<a href="/Assignment_Java4/per?id_per=${phimhd}"
								class="${btnper_phimhd1}"><button class="btn">
									<i class="bi bi-arrow-left-short text-light"></i>
								</button> </a> <label class="m-2 text-light">${demTLHD}/${size_phimhd}</label>
							<a href="/Assignment_Java4/next?id_next=${phimhd}"
								class="${btnper_phimhd2}"><button class="btn">
									<i class="bi bi-arrow-right-short text-light"></i>
								</button></a>
						</div>
					</div>

					<c:choose>
						<c:when test="${demTLHD==1}">
							<div class="video_item d-flex">
								<c:forEach var="item" items="${phim_HD}" begin="0" end="3">
									<div class="card ms-3 border-0">
										<img src="${item.hinhAnh}" class="card-img-top rounded"
											alt="...">
										<div class="card-body">
											<h6 class="card-title text-light">${item.tenVideo}</h6>
											<div class="d-flex">
												<i class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-half text-warning"></i>

											</div>
											<div class="mt-4">
												<p class="text-light">lượt xem:</p>
											</div>
											<div class="mt-4 d-flex">
												<button
													class="m-1 mt-2 mb-2 rounded border-0 btn_icon_color"
													type="button" data-bs-toggle="modal"
													data-bs-target="#exampleModal">
													<i class="bi bi-share text-primary"></i>
												</button>
												<a
													href="/Assignment_Java4/favorite_video/?id_video=${item.videoID}"><button
														class="mt-2 p-2  rounded border-0 btn_icon_color">
														<i class="bi bi-heart-fill text-light"></i>
													</button></a> <a href="/Assignment_Java4/fill_video/?id=${item.videoID}"><button
														type="button" class="btn btn-info m-2">Xem</button> </a>
											</div>

										</div>
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${demTLHD==2}">
							<div class="video_item d-flex">
								<c:forEach var="item" items="${phim_HD}" begin="4" end="7">
									<div class="card ms-3 border-0">
										<img src="${item.hinhAnh}" class="card-img-top rounded"
											alt="...">
										<div class="card-body">
											<h6 class="card-title text-light">${item.tenVideo}</h6>
											<div class="d-flex">
												<i class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-half text-warning"></i>

											</div>
											<div class="mt-4">
												<p class="text-light">lượt xem:</p>
											</div>
											<div class="mt-4 d-flex">
												<button
													class="m-1 mt-2 mb-2 rounded border-0 btn_icon_color"
													type="button" data-bs-toggle="modal"
													data-bs-target="#exampleModal">
													<i class="bi bi-share text-primary"></i>
												</button>
												<a
													href="/Assignment_Java4/favorite_video/?id_video=${item.videoID}"><button
														class="mt-2 p-2  rounded border-0 btn_icon_color">
														<i class="bi bi-heart-fill text-light"></i>
													</button></a> <a href="/Assignment_Java4/fill_video/?id=${item.videoID}"><button
														type="button" class="btn btn-info m-2">Xem</button> </a>
											</div>

										</div>
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="video_item d-flex">
								<c:forEach var="item" items="${phim_HD}" begin="0" end="3">
									<div class="card ms-3 border-0">
										<img src="${item.hinhAnh}" class="card-img-top rounded"
											alt="...">
										<div class="card-body">
											<h6 class="card-title text-light">${item.tenVideo}</h6>
											<div class="d-flex">
												<i class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-half text-warning"></i>

											</div>
											<div class="mt-4">
												<p class="text-light">lượt xem:</p>
											</div>
											<div class="mt-4 d-flex">
												<button
													class="m-1 mt-2 mb-2 rounded border-0 btn_icon_color"
													type="button" data-bs-toggle="modal"
													data-bs-target="#exampleModal">
													<i class="bi bi-share text-primary"></i>
												</button>
												<a
													href="/Assignment_Java4/favorite_video/?id_video=${item.videoID}"><button
														class="mt-2 p-2  rounded border-0 btn_icon_color">
														<i class="bi bi-heart-fill text-light"></i>
													</button></a> <a href="/Assignment_Java4/fill_video/?id=${item.videoID}"><button
														type="button" class="btn btn-info m-2">Xem</button> </a>
											</div>

										</div>
									</div>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>

				</div>
				<div class="m-5" id="anime">


					<div class="hstack gap-3">

						<h2 class="text-light">Phim ma</h2>
						<div class="btn-group p-2 ms-auto" role="group"
							aria-label="Basic outlined example">
							<button class="btn" ${btnper_phimma}>
								<i class="bi bi-arrow-left-short text-light"></i>
							</button>
							<label class="m-2 text-light">1/${size_phimma}</label>
							<button class="btn">
								<i class="bi bi-arrow-right-short text-light"></i>
							</button>
						</div>
					</div>
					<div class="video_item d-flex">
						<c:forEach var="item" items="${phim_ma}" begin="0" end="3">
							<div class="card ms-3 border-0">
								<img src="${item.hinhAnh}" class="card-img-top rounded"
									alt="...">
								<div class="card-body">
									<h6 class="card-title text-light">${item.tenVideo}<h6>
											<div class="d-flex">
												<i class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-fill text-warning"></i> <i
													class="bi bi-star-half text-warning"></i>

											</div>
											<div class="mt-4">
												<p class="text-light">lượt xem:</p>
											</div>
											<div class="mt-4 d-flex">
												<button
													class="m-1 mt-2 mb-2 rounded border-0 btn_icon_color"
													type="button" data-bs-toggle="modal"
													data-bs-target="#exampleModal">
													<i class="bi bi-share text-primary"></i>
												</button>
												<a
													href="/Assignment_Java4/favorite_video/?id_video=${item.videoID}"><button
														class="mt-2 p-2  rounded border-0 btn_icon_color">
														<i class="bi bi-heart-fill text-light"></i>
													</button></a> <a href="/Assignment_Java4/fill_video/?id=${item.videoID}"><button
														type="button" class="btn btn-info m-2">Xem</button></a>

											</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>


				<footer class="d-flex">
					<div class="col-4 ms-5">
						<h5 class="text-light">Thỏa thuận điều kiện</h5>
						<hr>
						<a class="text-light ms-4 pt-4 text-decoration-none" href="#">Thỏa
							thuận quyền riêng tư </a><br> <a
							class="text-light ms-4 pt-4 text-decoration-none" href="#">Thỏa
							thuận và điều khoản </a><br> <a
							class="text-light ms-4 pt-4 text-decoration-none" href="#">Chính
							sách cookie</a><br> <br>
					</div>
					<div class="col-3"></div>
					<div class="col-4">
						<h5 class="text-light">Liên hệ</h5>
						<hr class="me-5">
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
						<br>
						<p class="text-light ms-4 ">
							<i style="width: 125px; height: 125px;"
								class="bi bi-houses-fill text-success me-3"></i>Cẩm lệ-Liên
							Chiểu-Đà Nẵng
						</p>
					</div>

				</footer>
			</div>

		</div>

		<div class="col-2">
			<div class="menu_right d-flex ">
				<div class="col-5 mt-2">
					<a href="#"> <i class="bi bi-bell-fill m-4 p-2 text-warning"></i>
					</a>

				</div>
				<div class="col-7 d-flex">

					<img class="admin_img rounded-circle mt-2" alt="" src="${user.img}">
					<h6 class="mt-3 ms-2 text-light d-flex flex-wrap">${user.tenTaiKhoan}</h6>
				</div>
			</div>
			<div class="">
				<h4 class="text-light m-1">Phim vừa yêu thích</h4>
				<div class="video_item d-flex m-2">
					<div class="card video_list1 ms-3 border-0">
						<img src="${video_id.hinhAnh}" class="img_video_list1 rounded"
							alt="...">
						<div class="icon_play ">
							<div class="d-flex justify-content-center">
								<button formaction="/Assignment_Java4/xem"
									class="border-0 btn_video">
									<i class="bi text-light bi-play-circle-fill"></i>
								</button>
							</div>

						</div>
					</div>

				</div>

			</div>
			<div class="content_video">
				<h4 class="text-light m-1">Phim Liên quan</h4>
				<c:forEach var="items" items="${video_LQ}" begin="0" end="2">
					<h6 class="text-light ms-3">${items.tenVideo}</h6>
					<div class="video_item d-flex m-2">
						<div class="card video_list1 ms-3 border-0">
							<img src="${items.hinhAnh}" class="img_video_list1 rounded"
								alt="...">
							<div class="icon_play rounded">
								<div class="d-flex justify-content-center">
									<button type="button" class="border-0 btn_video">
										<i class="bi text-light bi-play-circle-fill"></i>
									</button>
								</div>

							</div>
						</div>

					</div>
				</c:forEach>
			</div>

		</div>
	</main>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Share mail</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="text" class="form-control border-success"
						placeholder="Email" name="email">
					<textarea class="form-control mt-3" placeholder="Nội dung"
						id="floatingTextarea2" style="height: 60px" name="noidung"></textarea>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>