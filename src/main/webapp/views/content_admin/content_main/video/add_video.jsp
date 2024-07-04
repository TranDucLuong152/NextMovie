<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.form_video {
	width: 100%;
	height: 100vh;
	background-color: rgba(128, 147, 149, 0.2);
}

.bg_img {
	background-color: rgba(128, 147, 149, 0.4)
}
</style>
</head>
<body>

	<main class="d-flex justify-content-center">
		<form class="form_video me-2 rounded d-flex flex-column"
			action="/Assignment_Java4/add_video" method="post">
			<h1 class="text-center text-light">Thêm tiểu phẩm</h1>
			<div class="d-flex">

				<div class=" ms-3 col-4 bg_img rounded position-relative">
					<img class="position-absolute top-50 start-50 translate-middle"
						src="img/logo_img.png">

				</div>

				<div class="col-6 ms-5">
					<input type="text" class="form-control border-success m-2 ms-5"
						placeholder="Tên phim" name="tenVideo"> <input type="text"
						class="form-control border-success m-2 ms-5"
						placeholder="thể loại" name="theLoai"> <input type="text"
						class="form-control border-success m-2 ms-5"
						placeholder="link hình ảnh" name="hinhAnh"> <input
						type="text" class="form-control border-success m-2 ms-5"
						placeholder="link phim" name="linkVideo"> <input
						type="number" class="form-control border-success m-2 ms-5"
						placeholder="view count" value=0 name="luotXem">

				</div>

			</div>
			<div class="d-flex">
				<input class="ms-3" type="file" value="đổi ảnh"><label
					class="text-light">lấy ảnh có sẵn</label>
			</div>

			<div class="form-floating m-2">

				<textarea class="form-control" placeholder="Ghi chú"
					id="floatingTextarea2" style="height: 100px" name="ghiChu"></textarea>
				<label for="floatingTextarea2">Ghi chú</label>
			</div>


			<div class="d-grid gap-2 col-6 mx-auto m-2">
				<button type="submit" class="btn btn-primary">Create video</button>

			</div>

		</form>

	</main>
</body>
</html>