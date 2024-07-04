<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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

.btn_delete {
	position: absolute;
	z-index: 999;
	border: 0;
}

.id {
	width: 5%;
}

.id {
	width: 5%;
}
</style>
<body>


	<div class="d-flex">

		<div class="col-2 mt-1">
			<h3 class="ms-4 text-light">Quản lý video</h3>
			<div class="list-group me-2 ms-2" id="list-tab" role="tablist">
				<a
					class="list-group-item list-group-item-action active bg-secondary border border-0"
					id="list-home-list" data-bs-toggle="list" href="#list-home"
					role="tab" aria-controls="list-home">Thêm Video</a> <a
					class="list-group-item list-group-item-action bg-secondary border border-0"
					id="list-profile-list" data-bs-toggle="list" href="#list-profile"
					role="tab" aria-controls="list-profile">Sửa Video</a> <a
					class="list-group-item list-group-item-action bg-secondary border border-0"
					id="list-messages-list" data-bs-toggle="list" href="#list-messages"
					role="tab" aria-controls="list-messages">Xóa Video</a> <a
					class="list-group-item list-group-item-action bg-secondary border border-0"
					id="list-settings-list" data-bs-toggle="list" href="#list-settings"
					role="tab" aria-controls="list-settings">Tìm Video</a>
			</div>
		</div>
		<div class="col-10">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list"><jsp:include
						page="video/add_video.jsp"></jsp:include></div>
				<div class="tab-pane fade" id="list-profile" role="tabpanel"
					aria-labelledby="list-profile-list">
					<div class="bg-secondary">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a
								class="nav-link bg-secondary text-light active"
								data-bs-toggle="tab" href="#home">Chỉnh sửa</a></li>
							<li class="nav-item"><a
								class="nav-link bg-secondary text-light" data-bs-toggle="tab"
								href="#menu1">Kho video</a></li>
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
												<img
													class="position-absolute top-50 start-50 translate-middle"
													src="img/logo_img.png">

											</div>

											<div class="col-6 ms-5">
												<input type="text"
													class="form-control border-success m-2 ms-5"
													placeholder="Tên phim" value="${video_id.tenVideo}">
												<input type="text"
													class="form-control border-success m-2 ms-5"
													placeholder="thể loại" value="${video_id.theLoai}">
												<input type="text"
													class="form-control border-success m-2 ms-5"
													placeholder="link hình ảnh" value="${video_id.hinhAnh}">
												<input type="text"
													class="form-control border-success m-2 ms-5"
													placeholder="link phim" value="${video_id.linkVideo}">
												<input type="date"
													class="form-control border-success m-2 ms-5"
													placeholder="ngày ra mắt" value="${video_id.ngayRaMat}">
												<input type="number"
													class="form-control border-success m-2 ms-5"
													placeholder="view count" value="${video_id.luotXem}">

											</div>

										</div>
										<div class="d-flex">
											<input class="ms-3" type="file" name="photo_file"
												value="đổi ảnh"><label class="text-light">lấy
												ảnh có sẵn</label>
										</div>

										<div class="form-floating m-2">

											<textarea class="form-control" placeholder="Ghi chú"
												id="floatingTextarea2" style="height: 50px"
												value="${video_id.ghiChu}"></textarea>
											<label for="floatingTextarea2">Ghi chú</label>
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
											<th class="id" scope="col">ID</th>
											<th class="col-1" scope="col">Tên phim</th>
											<th class="col-1" scope="col">Thể loại</th>
											<th class="col-3" scope="col">Link ảnh</th>
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
												<td class="col-3 flex-wrap">${items.hinhAnh}</td>
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
				</div>
				<div class="tab-pane fade" id="list-messages" role="tabpanel"
					aria-labelledby="list-messages-list">
					<main class="d-flex justify-content-center me-2">
						<form class="form_video bg-secondary rounded d-flex flex-column"
							action="/Assignment_Java4/login" method="post">
							<h1 class="text-center text-light">Xóa tiểu phẩm</h1>
							<div class="d-flex m-2 ms-5">
								<div class="col-9 me-2">
									<input type="text" class="form-control " placeholder="Tìm kiếm">
								</div>

								<button class="btn btn-success col-2 ms-3">tìm kiếm</button>
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
				<div class="tab-pane fade" id="list-settings" role="tabpanel"
					aria-labelledby="list-settings-list">
					<div class="bg-secondary find_video">
						<main class="d-flex justify-content-center">
							<form class="form_video bg-secondary rounded d-flex flex-column "
								action="/Assignment_Java4/find_video" method="post">
								<h1 class="text-center text-light">Tìm tiểu phẩm</h1>
								<div class="d-flex m-2 ms-5">
									<div class="col-9 me-2">
										<input type="text" class="form-control" name="title_video"
											placeholder="Tìm kiếm theo thể loại và tên phim">
									</div>

									<button class="btn btn-success col-2 ms-3">tìm kiếm</button>
								</div>

								<div class="tab-pane border border-0">
									<table class=" ms-4 table table-dark table-hover ">
										<thead>
											<tr class="d-flex">
												<th class="col-1" scope="col">ID</th>
												<th class="col-1" scope="col">Tên phim</th>
												<th class="col-1" scope="col">Thể loại</th>
												<th class="col-3" scope="col">Link ảnh</th>
												<th class="col-3" scope="col">Link phim</th>
												<th class="col-1" scope="col">Ngày ra mắt</th>
												<th class="col-1" scope="col">Lượt xem</th>


											</tr>
										</thead>


										<tbody>
											<c:forEach var="items" items="${fillvideo}">
												<tr class="d-flex">
													<th class="col-1" scope="row">${items.videoID}</th>
													<td class="col-1 flex-wrap">${items.tenVideo}</td>
													<td class="col-1 flex-wrap">${items.theLoai}</td>
													<td class="col-3 flex-wrap">${items.hinhAnh}</td>
													<td class="col-3 flex-wrap">${items.linkVideo}</td>
													<td class="col-1 flex-wrap">${items.ngayRaMat}</td>
													<td class="col-1 flex-wrap">${items.luotXem}</td>

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

	</div>

</body>
</html>