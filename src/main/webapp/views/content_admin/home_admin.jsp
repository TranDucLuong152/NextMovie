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
main_admin {
	width: 100%;
	height: 100vh;
	background: linear-gradient(to right, rgb(126, 131, 131), rgb(0, 0, 0),
		rgb(15, 12, 32), rgb(126, 131, 131));
}

.content_admin {
	width: 100%;
	height: 91vh;
	background: linear-gradient(to right, rgb(15, 12, 32),
		rgb(126, 131, 131), rgb(0, 0, 0));
}

.navbar {
	background: linear-gradient(to right, rgb(15, 12, 32),
		rgb(126, 131, 131), rgb(0, 0, 0));
}

.container {
	position: relative;
	width: 90%;
	height: 100%;
}

.logo {
	width: 50px;
	height: 50px;
	filter: drop-shadow(7px 5px 5px rgb(110, 223, 112));
}

.content {
	background-color: #eee;
}

.menu {
	width: 100%;
	height: 15vh;
	position: absolute;
	bottom: 0;
	z-index: 999;
}

.quanLyKhachHang {
	border-radius: 0;
	width: 20%;
}

.baoCaoThongKe {
	width: 25%;
	border-radius: 0 100px 0 0;
}

.admin_img {
	width: 25px;
	height: 25px;
}
</style>
</head>
<body>
	<main class="main_admin">
		<nav class="navbar navbar-expand-lg ">
			<div class="container d-flex justify-content-center">
				<img class="rounded-circle logo" src="img/logo_img.png" alt="">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a
							class="nav-link active ms-3 text-light" aria-current="page"
							href="/Assignment_Java4/Main_servlet">Trang chủ</a></li>
						<li class="nav-item ms-4"><a class="nav-link text-light"
							href="/Assignment_Java4/Main_servlet ">Liên kết</a></li>

						<li class="nav-item ms-3"><a class="nav-link text-light"
							href="/Assignment_Java4/Main_servlet"">Giới thiệu</a></li>
					</ul>
					<div class="d-flex">
						<img class="admin_img rounded-circle mt-2" alt=""
							src="${user.img}">
						<div class="btn-group">
							<button type="button" class="btn dropdown-toggle text-light"
								data-bs-toggle="dropdown" data-bs-display="static"
								aria-expanded="false">${admin_name}</button>
							<ul class="dropdown-menu dropdown-menu-lg-end">
								<li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
								<li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
								<li><a class="dropdown-item"
									href="/Assignment_Java4/DangXuat">Đăng xuất</a></li>
							</ul>
						</div>
					</div>


				</div>
			</div>
		</nav>
		<div class="content_admin" id="content_admin">

			<jsp:include page="${content_admin}"></jsp:include>


		</div>
		<form action="/Assignment_Java4/login" method="post">
			<div class="menu d-flex justify-content-center">
				<button style="width: 25%; border-radius: 100px 0 0 0;"
					class="btn btn-info" formaction="/Assignment_Java4/video">Quản
					lý tiểu phẩm</button>
				<button class="quanLyKhachHang btn  btn-primary"
					formaction="/Assignment_Java4/user">Quản lý khách hàng</button>
				<button style="width: 25%; border-radius: 0 100px 0 0;"
					class="btn btn-info" formaction="/Assignment_Java4/baocao">Báo
					cáo thống kê</button>
			</div>

		</form>

	</main>
</body>
</html>