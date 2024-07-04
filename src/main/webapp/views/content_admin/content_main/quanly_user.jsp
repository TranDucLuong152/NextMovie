<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.find_video {
	width: 100%;
	height: 75vh;
}

.tab-pane {
	height: 75vh;
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
</style>
</head>
<body>
	<div class="d-flex">
		<div class="col-2">
			<h3 class="ms-4 text-light">Quản lý user</h3>
			<div class="list-group ms-2 me-2" id="list-tab" role="tablist">
				<a
					class="list-group-item list-group-item-action active bg-secondary border border-0"
					id="list-home-list" data-bs-toggle="list" href="#list-home"
					role="tab" aria-controls="list-home">Sửa User</a> <a
					class="list-group-item list-group-item-action bg-secondary border border-0"
					id="list-messages-list" data-bs-toggle="list" href="#list-messages"
					role="tab" aria-controls="list-messages">Xóa User</a> <a
					class="list-group-item list-group-item-action bg-secondary border border-0"
					id="list-settings-list" data-bs-toggle="list" href="#list-settings"
					role="tab" aria-controls="list-settings">Tìm User</a>
			</div>
		</div>
		<div class="col-10">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list">
					<div class="">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a
								class="nav-link bg-secondary text-light active"
								data-bs-toggle="tab" href="#home">Chỉnh sửa</a></li>
							<li class="nav-item"><a
								class="nav-link bg-secondary text-light" data-bs-toggle="tab"
								href="#menu1">Kho User</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div id="home" class="tab-pane active">
								<br>
								<main class="">
									<form class="form_video me-2 rounded d-flex flex-column"
										action="/Assignment_Java4/login" method="post">
										<h1 class="text-center text-light">Thêm người dùng</h1>
										<div class="d-flex">

											<div class=" ms-3 col-4 bg_img rounded position-relative	">
												<img
													class="position-absolute top-50 start-50 translate-middle"
													src="img/logo_img.png">

											</div>

											<div class="col-6 ms-5">
												<input type="text"
													class="form-control border-success m-2 ms-5"
													placeholder="username"> <input type="text"
													class="form-control border-success m-2 ms-5"
													placeholder="password"> <input type="text"
													class="form-control border-success m-2 ms-5"
													placeholder="fullname"> <input type="email"
													class="form-control border-success m-2 ms-5"
													placeholder="email"> <input type="text"
													class="form-control border-success m-2 ms-5"
													placeholder="link Ảnh">


												<div class="ms-3">
													<div class="form-check">
														<h6 class=" m-2 text-light">Role:</h6>
														<input id="admin" class="m-2" name="admin" type="radio"
															value="true"><label for="admin"
															class="text-light">Aimin</label> <input id="user"
															class="m-2 " name="admin" type="radio" value="false"><label
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
											<button class="btn btn-primary" formaction="">Update</button>

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
													href="/Assignment_Java4/edit_user/?id_user=${items.tenTaiKhoan}">chỉnh
														sửa</a>
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="list-messages" role="tabpanel"
					aria-labelledby="list-messages-list">
					<main class="d-flex justify-content-center me-2">
						<form class="form_video bg-secondary rounded d-flex flex-column"
							action="/Assignment_Java4/login" method="post">
							<h1 class="text-center text-light">Xóa người dùng</h1>
							<div class="d-flex m-2 ms-5">
								<div class="col-9 me-2">
									<input type="text" class="form-control " placeholder="Tìm kiếm">
								</div>

								<button class="btn btn-success col-2 ms-3">tìm kiếm</button>
							</div>

							<div class="p-3">
								<table class="table table-dark table-hover">
									<thead>
										<tr class="d-flex">
											<th class="col-1" scope="col">Tài khoản</th>
											<th class="col-1" scope="col">Mật khẩu</th>
											<th class="col-2" scope="col">Email</th>
											<th class="col-2" scope="col">Họ tên</th>
											<th class="col-4 " scope="col">Hình ảnh</th>
											<th class="col-1" scope="col">Chức năng</th>
											<th class="col-1 pe-2 text-start" scope="col">Xóa</th>

										</tr>
									</thead>


									<tbody>
										<c:forEach var="items" items="${filluser}">
											<tr class="d-flex">
												<th class="col-1" scope="row">${items.tenTaiKhoan}</th>
												<td class="col-1 flex-wrap">${items.matKhau}</td>
												<td class="col-2 flex-wrap">${items.email}</td>
												<td class="col-2 flex-wrap">${items.hoTen}</td>
												<td class="col-4  flex-wrap">${items.img}</td>
												<td class="col-1 flex-wrap">${items.chucNang}</td>
												<td class="col-1" scope="col"><a
													class="text-decoration-none "
													href="/Assignment_Java4/remove_user/?id_user=${items.tenTaiKhoan}">Xóa</a>
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>


						</form>

					</main>
				</div>
				<div class="tab-pane fade" id="list-settings" role="tabpanel"
					aria-labelledby="list-settings-list">
					<main class="d-flex justify-content-center me-2">
						<form class="form_video bg-secondary rounded d-flex flex-column"
							action="/Assignment_Java4/find_user" method="post">
							<h1 class="text-center text-light">Tìm người dùng</h1>
							<div class="d-flex m-2 ms-5">
								<div class="col-9 me-2">
									<input type="text" class="form-control" name="title_user"
										placeholder="Tìm kiếm">
								</div>

								<button class="btn btn-success col-2 ms-3">tìm kiếm</button>
							</div>

							<div class="p-3">
								<table class="table table-dark table-hover">
									<thead>
										<tr class="d-flex">
											<th class="col-1" scope="col">Tài khoản</th>
											<th class="col-1" scope="col">Mật khẩu</th>
											<th class="col-2" scope="col">Email</th>
											<th class="col-2" scope="col">Họ tên</th>
											<th class="col-5" scope="col">Hình ảnh</th>
											<th class="col-1" scope="col">Chức năng</th>


										</tr>
									</thead>


									<tbody>
										<c:forEach var="items" items="${filluser}">
											<tr class="d-flex">
												<th class="col-1" scope="row">${items.tenTaiKhoan}</th>
												<td class="col-1 flex-wrap">${items.matKhau}</td>
												<td class="col-2 flex-wrap">${items.email}</td>
												<td class="col-2 flex-wrap">${items.hoTen}</td>
												<td class="col-5 flex-wrap">${items.img}</td>
												<td class="col-1 flex-wrap">${items.chucNang}</td>

											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>


						</form>
					</main>
				</div>
			</div>
		</div>
	</div>
</body>
</html>