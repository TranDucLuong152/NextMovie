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
			action="/Assignment_Java4/thongkeVideo" method="post">
			<h1 class="text-center text-light">Thống kê yêu thích</h1>
			<div class="d-flex m-2 ms-5">
				<div class="col-9 me-2">
					<input type="text" class="form-control " name="title_tk_user"
						placeholder="Tìm kiếm">
				</div>

				<button class="btn btn-success col-2 ms-3">tìm kiếm</button>
			</div>
			<div class="d-flex m-2 ms-5">
				<div class="col-4 me-2">
					<input type="date" class="form-control " placeholder="Tìm kiếm">
				</div>
				<div class="col-4 me-2">
					<input type="date" class="form-control " placeholder="Tìm kiếm">
				</div>
				<button class="btn btn-success col-2 ms-3" formaction="">bộ
					lọc</button>
				<a class="nav-link badge text-bg-success text-warning p-3 ms-2"
					href="/Assignment_Java4/video_ql">Quay lại</a>
			</div>
			<div class="p-3 tab-pane">
				<table class="table table-dark table-hover">
					<thead>
						<tr>
							<th scope="col">videoID</th>
							<th scope="col">Tên Video</th>
							<th scope="col">Lượt Xem</th>
							<th scope="col">Thể Loại</th>
							<th scope="col">Ngày Ra Mắt</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="items" items="${fillAllfavorite}">
							<tr>
								<th scope="row">${items.videoID}</th>
								<td>${items.tenVideo}</td>
								<td>${items.luotXem}</td>
								<td>${items.theLoai}</td>
								<td>${items.ngayRaMat}</td>
							</tr>
						</c:forEach>


					</tbody>

				</table>
			</div>
		</form>

	</main>
</body>
</html>