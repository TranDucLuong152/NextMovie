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
</style>
</head>
<body>
	<div class="main">
		<div class="d-flex justify-content-between">
			<h2 class="text-light">Phim đã yêu thích</h2>

			<a href="/Assignment_Java4/quaylai_homePage" class="m-3">Quay lại</a>
		</div>

		<div class="video_item d-flex flex-wrap ">
			<c:forEach var="item" items="${fillfavorite}">

				<div class="card ms-3 border-0 mt-2">
					<img src="${item.hinhAnh}" class="card-img-top rounded" alt="...">
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
								class="m-1 mt-2 mb-2 border rounded border-0 btn_icon_color">
								<i class="bi bi-share text-primary"></i>
							</button>
							<a
								href="/Assignment_Java4/favorite_delete_video/?id_video_dl=${item.videoID}"><button
									class="mt-2 p-2  rounded border-0 btn_icon_color">
									<i class="bi bi-heartbreak-fill text-light"></i>
								</button></a> <a href="/Assignment_Java4/fill_video/?id=${item.videoID}"><button
									type="button" class="btn btn-info m-2">Xem</button> </a>
						</div>

					</div>
				</div>
			</c:forEach>


		</div>
	</div>
</body>
</html>