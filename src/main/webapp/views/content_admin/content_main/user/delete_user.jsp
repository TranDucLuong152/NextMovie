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

.form_video {
	width: 100%;
	height: 100vh;
	border-radius: 3px 3px;
}

.tab-pane {
	height: 100%;
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
	<div class="bg-secondary update_video">
		<main class="d-flex justify-content-center me-2">
			<form class="form_video bg-secondary rounded d-flex flex-column"
				action="/Assignment_Java4/find_user" method="post">
				<h1 class="text-center text-light">Xóa người dùng</h1>
				<div class="d-flex m-2 ms-5">
					<div class="col-8 me-2">
						<input type="text" class="form-control " placeholder="Tìm kiếm">
					</div>

					<button class="btn btn-success col-2 ms-3 me-3">tìm kiếm</button>
					<a class="nav-link badge text-bg-success text-warning p-3 ms-2"
						href="/Assignment_Java4/video_ql">Quay lại</a>
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

</body>
</html>