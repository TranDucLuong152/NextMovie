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
.update_video {
	width: 100%;
	height: 100vh;
}

.form_video {
	width: 100%;
	height: 100%;
	border-radius: 3px 3px;
}

.bg_img {
	background-color: rgba(128, 147, 149, 0.5);
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

.id {
	width: 3%;
}

.img_video {
	width: 100%;
	height: 33vh;
}
</style>
</head>
<body>

	<div class="bg-secondary update_video">
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a
				class="nav-link bg-secondary text-light active" data-bs-toggle="tab"
				href="#home">Chỉnh sửa</a></li>
			<li class="nav-item"><a class="nav-link bg-secondary text-light"
				data-bs-toggle="tab" href="#menu1">Kho video</a></li>
			<li class="nav-item"><a class="nav-link bg-secondary text-light"
				href="/Assignment_Java4/video_ql">quay lại</a></li>

		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="home" class="tab-pane active">
				<br>
				<main class="d-flex justify-content-center">
					<form class="form_video me-2 rounded d-flex flex-column"
						action="/Assignment_Java4/update_video" method="post">
						<h1 class="text-center text-light">Sửa tiểu phẩm</h1>
						<div class="d-flex">

							<div class="ms-3 col-4 bg_img rounded position-relative	">
								<img class="img_video" src="${video_id.hinhAnh}">

							</div>

							<div class="col-6 ms-5">
								<input type="number"
									class="form-control border-success m-2 ms-5"
									placeholder="view count" value="${video_id.videoID}"
									name="videoID"> <input type="text"
									class="form-control border-success m-2 ms-5"
									placeholder="Tên phim" value="${video_id.tenVideo}"
									name="tenVideo"> <input type="text"
									class="form-control border-success m-2 ms-5"
									placeholder="thể loại" value="${video_id.theLoai}"
									name="theLoai"> <input type="text"
									class="form-control border-success m-2 ms-5"
									placeholder="link hình ảnh" value="${video_id.hinhAnh}"
									name="hinhAnh"> <input type="text"
									class="form-control border-success m-2 ms-5"
									placeholder="link phim" value="${video_id.linkVideo}"
									name="linkVideo"> <input type="number"
									class="form-control border-success m-2 ms-5"
									placeholder="view count" value="${video_id.luotXem}"
									name="luotXem">

							</div>

						</div>
						<div class="d-flex">
							<input class="ms-3" type="file" name="photo_file" value="đổi ảnh"><label
								class="text-light">lấy ảnh có sẵn</label>
						</div>

						<div class="form-floating m-2">

							<textarea class="form-control" placeholder="Ghi chú"
								id="floatingTextarea2" style="height: 150px" name="ghiChu">${video_id.ghiChu}</textarea>
							<label for="floatingTextarea2">Ghi chú</label>
						</div>


						<div class="d-grid gap-2 col-6 mx-auto m-2">
							<button class="btn btn-primary">Update</button>

						</div>

					</form>

				</main>
			</div>

			<div id="menu1" class="tab-pane fade border border-0 ms-5">
				<table class="table table-dark table-hover ms-5 ">
					<thead>
						<tr class="d-flex">
							<th class="id" scope="col">ID</th>
							<th class="col-1" scope="col">Tên phim</th>
							<th class="col-1" scope="col">Thể loại</th>
							<th class="col-4" scope="col">Link ảnh</th>
							<th class="col-2" scope="col">Link phim</th>
							<th class="col-1" scope="col">Ngày ra mắt</th>
							<th class="col-1" scope="col">Lượt xem</th>
							<th class="col-1 pe-2 text-start" scope="col">Chỉnh sửa</th>

						</tr>
					</thead>


					<tbody>
						<c:forEach var="items" items="${fillvideo}">
							<tr class="d-flex">
								<th class="id" scope="row">${items.videoID}</th>
								<td class="col-1 flex-wrap">${items.tenVideo}</td>
								<td class="col-1 flex-wrap">${items.theLoai}</td>
								<td class="col-4 flex-wrap">${items.hinhAnh}</td>
								<td class="col-2 flex-wrap">${items.linkVideo}</td>
								<td class="col-1 flex-wrap">${items.ngayRaMat}</td>
								<td class="col-1 flex-wrap">${items.luotXem}</td>
								<td class="col-1 pe-2" scope="col"><a
									class="text-decoration-none "
									href="/Assignment_Java4/edit_video/?id_video=${items.videoID}">Chỉnh
										sửa</a>
							</tr>
						</c:forEach>


					</tbody>
				</table>
			</div>

		</div>

	</div>



</body>
</html>