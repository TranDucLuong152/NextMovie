<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.form_login {
	width: 350px;
	height: 50vh;
	border-radius: 3%;
	background: linear-gradient(#1e241f, #f2f6f3);
}

.bg_title {
	background: linear-gradient(rgba(134, 135, 176, 0.8),
		rgba(125, 177, 177, 0.9), rgba(134, 135, 176, 0.8));
}
</style>
</head>
<body>

	<form class="form rounded-3" action="/Assignment_Java4/Main_servlet"
		method="post">
		<div class="form_login">
			<h2
				class="rounded-top-3 text-success d-flex justify-content-center bg_title text-uppercase p-2">Đăng
				nhập</h2>

			<br> <input class="form-control" placeholder="Username"
				name="tenTaiKhoan"> <br> <input class="form-control"
				type="password" placeholder="matKhau" name="matKhau"> <br>
			<div class="d-flex">
				<input class="ms-2 " type="checkbox" name="remember">
				<p class="text-light m-2">Nhớ mật khẩu ?</p>
			</div>
			<hr>
			<div class="d-grid gap-2 col-8 m-2 mx-auto">
				<button class="btn btn-success" formaction="/Assignment_Java4/login">Đăng
					nhập</button>
				<h6 class="text-danger ms-3">${thongBaoLogin}</h6>
			</div>

		</div>
	</form>

</body>
</html>