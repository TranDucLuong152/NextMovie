<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	background: linear-gradient(#1e241f, #f2f6f3);
	border-radius: 30px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
}

.container p {
	font-size: 14px;
	list-style: 20px;
	letter-spacing: 0.3px;
	margin: 20px 0;
}

.container span {
	font-size: 12px;
}

.container button {
	background-color: #512da8;
	color: #fff;
	font-size: 12px;
	padding: 10px 45px;
	border: 1px solid transparent;
	border-radius: 8px;
	font-weight: 600;
	letter-spacing: 0.5px;
	text-transform: uppercase;
	margin-top: 10px;
	cursor: pointer;
}

.container button.hidden {
	background-color: transparent;
	border-color: #fff;
}

.container .form {
	background: linear-gradient(#1e241f, #f2f6f3);
	height: 65vh;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
}

.container input {
	background: #eee;
	border: none;
	margin: 8px 0;
	padding: 10px 15px;
	font-size: 13px;
	border-radius: 8px;
	width: 100%;
	outline: none;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-up-user {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.active .sign-up-user {
	transform: translateX(100%);
}

.sign-up-admin {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.active .sign-up-admin {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: move 0.6s;
}

@
keyframes move { 0%,49.99%{
	opacity: 0;
	z-index: 1;
}

50








%
,
100








%
{
opacity








:








1






;
z-index








:








5






;
}
}
.toggle-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: all 0.6s ease-in-out;
	border-radius: 80px 0 0 50px;
	z-index: 1000;
}

.container.active .toggle-container {
	transform: translateX(-100%);
	border-radius: 0 80px 50px 0;
}

.toggle {
	background-color: #35c348;
	height: 100%;
	background: linear-gradient(to right, #018513, #35c85e);
	color: #fff;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
	transform: translateX(0);
	transition: all 0.6s ease-in-out;
}

.container.active .toggle {
	transform: translateX(50%);
}

.toggle-panel {
	position: absolute;
	width: 50%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 30px;
	text-align: center;
	top: 0;
	transform: translateX(0);
	transition: all 0.6s ease-in-out;
}

.toggle-left {
	transform: translateX(-200%);
}

.container.active .toggle-left {
	transform: translateX(0);
}

.toggle-right {
	right: 0;
	transform: translateX(0);
}

.container.active .toggle-right {
	transform: translateX(200%);
}
</style>
</head>
<body>

	<div class="container" id="container">

		<div class="form-container sign-up-user">
			<form class="form_register rounded-3"
				action="/Assignment_Java4/Main_servlet" method="post">
				<div class="form">
					<h1 class="text-warning">Đăng ký user</h1>
					<span class="text-light">đăng ký bằng enmai và số điện thoại</span>
					<input type="text" placeholder="tên tài khoản" name="tenTaiKhoan">
					<input type="password" placeholder="mật khẩu" name="matKhau">
					<input type="text" placeholder="email" name="email"> <input
						type="text" placeholder="họ tên" name="hoTen">
					<button class="bg-warning"
						formaction="/Assignment_Java4/sign_up_user">Đăng ký</button>
				</div>
			</form>
		</div>
		<div class="form-container sign-up-admin">
			<form class="form_register rounded-3"
				action="/Assignment_Java4/Main_servlet" method="post">
				<div class="form">
					<h1 class="text-warning">Đăng ký admin</h1>
					<span class="text-light">đăng ký bằng enmai và số điện thoại</span>
					<input type="text" placeholder="tên tài khoản" name="tenTaiKhoan">
					<input type="password" placeholder="mật khẩu" name="matKhau">
					<input type="text" placeholder="email" name="email"> <input
						type="text" placeholder="họ tên" name="hoTen">
					<button class="bg-warning"
						formaction="/Assignment_Java4/sign_up_admin">Đăng ký</button>
				</div>
			</form>
		</div>
		<div class="toggle-container">
			<div class="toggle">
				<div class="toggle-panel toggle-left">
					<h1>Xin chào bạn !</h1>
					<p>Nhấn vào đây để đăng ký người dùng</p>
					<button class="hidden" id="sign_up_user">Đăng ký người
						dùng</button>

				</div>
				<div class="toggle-panel toggle-right">
					<h1>Xin chào bạn !</h1>
					<p>Nhấn vào đây để đăng ký quản lý</p>
					<button class="hidden" id="sign_up_admin">Đăng ký quản lý</button>

				</div>
			</div>
		</div>
	</div>



	<script>
    const container = document.getElementById('container');
    const registerBtn = document.getElementById('sign_up_admin');
    const loginBtn = document.getElementById('sign_up_user');
    registerBtn.addEventListener('click',()=>{
      container.classList.add("active");
    });
    loginBtn.addEventListener('click',()=>{
      container.classList.remove("active");
    });
	</script>
</body>
</html>