<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex">
		<div class="col-2">
			<h3 class="ms-1 text-light">Báo cáo thống kê</h3>
			<div class="list-group ms-2 me-2" id="list-tab" role="tablist">
				<a
					class="list-group-item list-group-item-action active bg-secondary border border-0"
					id="list-home-list" data-bs-toggle="list" href="#list-home"
					role="tab" aria-controls="list-home">Thống kê yêu thích </a> <a
					class="list-group-item list-group-item-action bg-secondary border border-0"
					id="list-profile-list" data-bs-toggle="list" href="#list-profile"
					role="tab" aria-controls="list-profile">Lọc người yêu thích </a> <a
					class="list-group-item list-group-item-action bg-secondary border border-0"
					id="list-messages-list" data-bs-toggle="list" href="#list-messages"
					role="tab" aria-controls="list-messages">Lọc người nhận</a>
			</div>
		</div>
		<div class="col-10 mt-4">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list"><jsp:include
						page="baocao/thongke.jsp"></jsp:include>
				</div>
				<div class="tab-pane fade" id="list-profile" role="tabpanel"
					aria-labelledby="list-profile-list"><jsp:include
						page="baocao/locYTtheoTP.jsp"></jsp:include>
				</div>

				<div class="tab-pane fade" id="list-messages" role="tabpanel"
					aria-labelledby="list-messages-list"><jsp:include
						page="baocao/locNNTP.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</body>
</html>