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
</head>
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

.btn_delete {
	position: absolute;
	z-index: 999;
	border: 0;
}

.id {
	width: 5%;
}
</style>
<body>
	<div class="bg-secondary update_video">
		<main class="d-flex justify-content-center me-2">
			<form class="form_video bg-secondary rounded d-flex flex-column"
				action="/Assignment_Java4/login" method="post">
				<h1 class="text-center text-light">Xóa tiểu phẩm</h1>
				<div class="d-flex m-2 ms-5">
					<div class="col-9 me-2">
						<input type="text" class="form-control" name="title_video_delete"
							placeholder="Tìm kiếm">
					</div>

					<button formaction="/Assignment_Java4/find_video_delete"
						type="submit" class="btn btn-success col-2 ms-3">tìm kiếm</button>
					<a class="nav-link badge text-bg-success text-warning p-3 ms-2"
						href="/Assignment_Java4/video_ql">Quay lại</a>
				</div>

				<div class="tab-pane border border-0">
					<table class=" ms-2 table table-dark table-hover">
						<thead>
							<tr class="d-flex">
								<th class="id" scope="col">ID</th>
								<th class="col-1" scope="col">Tên phim</th>
								<th class="col-1" scope="col">Thể loại</th>
								<th class="col-3" scope="col">Link ảnh</th>
								<th class="col-2" scope="col">Link phim</th>
								<th class="col-1" scope="col">Ngày ra mắt</th>
								<th class="col-1" scope="col">Lượt xem</th>
								<th class="col-1" scope="col">Xóa Video</th>

							</tr>
						</thead>


						<tbody>
							<c:forEach var="items" items="${fillvideo}">
								<tr class="d-flex">
									<th class="id" scope="row">${items.videoID}</th>
									<td class="col-1 flex-wrap">${items.tenVideo}</td>
									<td class="col-1 flex-wrap">${items.theLoai}</td>
									<td class="col-3 flex-wrap">${items.hinhAnh}</td>
									<td class="col-2 flex-wrap">${items.linkVideo}</td>
									<td class="col-1 flex-wrap">${items.ngayRaMat}</td>
									<td class="col-1 flex-wrap">${items.luotXem}</td>
									<td class="col-1" scope="col"><a
										class="text-decoration-none "
										href="/Assignment_Java4/remove_video/?id_video=${items.videoID}">Xóa
											Video</a>
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