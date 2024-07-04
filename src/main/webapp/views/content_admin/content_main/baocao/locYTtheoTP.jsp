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
.form_video {
	width: 100%;
	height: 100%;
}

.tab-pane {
	height: 72vh;
	width: 100%;
	overflow: auto;
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
	<main class="d-flex justify-content-center me-2">
		<form class="form_video bg-secondary rounded d-flex flex-column"
			action="/Assignment_Java4/thongkeUser" method="post">
			<h1 class="text-center text-light">Lọc người yêu thích theo tiểu
				phẩm</h1>
			<div class="d-flex m-2 ms-5">
				<div class="col-9 me-1">
					<input type="text" class="form-control mt-1" name="title_tk"
						placeholder="Tìm kiếm">
				</div>

				<button class="btn btn-success col-2 ms-1">bộ lọc</button>
				<a class="nav-link badge text-bg-success text-warning p-3 ms-2"
					href="/Assignment_Java4/video_ql">Quay lại</a>
			</div>

			<div class="p-3 tab-pane">
				<table class="table table-dark table-hover">
					<thead>
						<tr>
							<th scope="col">Tên tài khoản</th>
							<th scope="col">Họ và Tên</th>
							<th scope="col">email</th>
							<th scope="col">Hình ảnh</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="items" items="${findFavorite_user}">
							<tr>
								<th scope="row">${items.tenTaiKhoan}</th>
								<td>${items.hoTen}</td>
								<td>${items.email}</td>
								<td>${items.img}</td>

							</tr>
						</c:forEach>


					</tbody>

				</table>
			</div>
		</form>

	</main>
</body>
</html>