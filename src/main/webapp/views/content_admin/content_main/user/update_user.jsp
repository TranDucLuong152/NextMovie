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
<style>
.delete_video {
	width: 100%;
	height: 100vh;
}

.tab-pane {
	height: 100vh;
	width: 100%;
	overflow: auto;
	border-radius: 3px 3px;
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

.bg_img_admin {
	width: 100%;
	height: 33vh;
}
</style>
</head>

<body>
	<div class="bg-secondary update_video">
		<div class="">
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"><a
					class="nav-link bg-secondary text-light active"
					data-bs-toggle="tab" href="#home">Chỉnh sửa</a></li>
				<li class="nav-item"><a
					class="nav-link bg-secondary text-light" data-bs-toggle="tab"
					href="#menu1">Kho User</a></li>
				<li class="nav-item"><a
					class="nav-link bg-secondary text-light"
					href="/Assignment_Java4/video_ql">quay lại</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div id="home" class="tab-pane active">
					<br>
					<main class="">
						<form class="form_video me-2 rounded d-flex flex-column"
							action="/Assignment_Java4/update_user" method="post">
							<h1 class="text-center text-light">Sửa người dùng</h1>
							<div class="d-flex">

								<div class=" ms-3 col-4 bg_img rounded position-relative	">
									<img
										class="position-absolute top-50 start-50 translate-middle bg_img_admin"
										src="${fill_one_user.img}">

								</div>

								<div class="col-6 ms-5">
									<input type="text" class="form-control border-success m-2 ms-5"
										placeholder="username" value="${fill_one_user.tenTaiKhoan}"
										name="tenTaiKhoan"> <input type="text"
										class="form-control border-success m-2 ms-5"
										placeholder="password" value="${fill_one_user.matKhau}"
										name="matKhau"> <input type="text"
										class="form-control border-success m-2 ms-5"
										placeholder="fullname" value="${fill_one_user.hoTen}"
										name="hoTen"> <input type="email"
										class="form-control border-success m-2 ms-5"
										placeholder="email" value="${fill_one_user.email}"
										name="email"> <input type="text"
										class="form-control border-success m-2 ms-5"
										placeholder="link Ảnh" value="${fill_one_user.img}" name="img">


									<div class="ms-3">
										<div class="form-check">
											<h6 class=" m-2 text-light">Role:</h6>
											<input id="admin" class="m-2" name="chucNang" type="radio"
												value="true" ${fill_one_user.chucNang?'checked':''}><label
												for="admin" class="text-light">Aimin</label> <input
												id="user" class="m-2 " name="chucNang" type="radio"
												value="false" ${fill_one_user.chucNang?'':'checked'}><label
												for="user" class="text-light">User</label> <br>
										</div>
									</div>

								</div>

							</div>
							<div class="d-flex">
								<input class="ms-3 " type="file" name="photo_file"
									value="đổi ảnh"><label class="text-light">lấy
									ảnh có sẵn</label>
							</div>


							<div class="d-grid gap-2 col-6 mx-auto m-2">
								<button class="btn btn-primary">Update</button>

							</div>

						</form>

					</main>
				</div>
				<div id="menu1" class="tab-pane fade border border-0">
					<table class="table table-dark table-hover">
						<thead>
							<tr class="d-flex">
								<th class="col-1" scope="col">Tài khoản</th>
								<th class="col-1" scope="col">Mật khẩu</th>
								<th class="col-2" scope="col">Email</th>
								<th class="col-1" scope="col">Họ tên</th>
								<th class="col-5" scope="col">Hình ảnh</th>
								<th class="col-1" scope="col">Chức năng</th>
								<th class="col-1 pe-2 text-start" scope="col">Chỉnh sửa</th>

							</tr>
						</thead>


						<tbody>
							<c:forEach var="items" items="${filluser}">
								<tr class="d-flex">
									<th class="col-1" scope="row">${items.tenTaiKhoan}</th>
									<td class="col-1 flex-wrap">${items.matKhau}</td>
									<td class="col-2 flex-wrap">${items.email}</td>
									<td class="col-1 flex-wrap">${items.hoTen}</td>
									<td class="col-5 flex-wrap">${items.img}</td>
									<td class="col-1">${items.chucNang}</td>
									<td class="col-1" scope="col"><a
										class="text-decoration-none "
										href="/Assignment_Java4/edit_user/?id_user=${items.tenTaiKhoan}">Chỉnh
											sửa</a>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
</body>
</html>