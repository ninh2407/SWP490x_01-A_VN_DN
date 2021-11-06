<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- External css -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/style-login.css" />">
<!-- Import Icon library -->
<script src="https://kit.fontawesome.com/5375cbd5e7.js"
	crossorigin="anonymous"></script>
<!--Import Boottrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>

<!-- JQuery -->
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

<!-- External js -->
<script type="text/javascript"
	src="<c:url value="/resources/javascrip/login.js" />"></script>

</head>

<body>
	<div class="flex box">
		<div class="flex login">
			<div class="flex items1">
				<h4>Đăng nhập</h4>
				<form class="form-login"
					action="${pageContext.request.contextPath}/j_spring_security_check"
					method="post">
					<div>
						<label for="user">Tài khoản</label> <input class='form-control'
							type='email' name='username' id='user' placeholder='Tài khoản'
							required>
					</div>
					<div>
						<label for="password">Mật khẩu</label> <input class="form-control"
							type="password" name="password" id="password"
							placeholder="Mật khẩu" required>
					</div>
					<div class="arlet">
						<p>${mess}</p>
					</div>
					<button class="btn-items1" type="submit">Đăng nhập</button>
					<a
						href="https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile&state=profile&redirect_uri=http://localhost:8080/final/login-google&response_type=code&client_id=720148636339-tetsb4j3crv6ic40ao04gbrgu89b71af.apps.googleusercontent.com&approval_prompt=auto&access_type=online">
						<button class="btn btn-outline-primary btn-google" type="button">
							<img class="google-icon"
								src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg" />
							Đăng nhập với Google
						</button>
					</a> <span class="form-check"> <input class="form-check-input"
						type="checkbox" id="checkbox" name="remember-me" checked>
						<label class="form-check-label" for="checkbox">Ghi nhớ</label> <a
						href="#" style="float: right;" data-bs-toggle="modal"
						data-bs-target="#staticBackdrop">Quên mật khẩu</a>
					</span>
				</form>
			</div>
			<div class="flex items2">
				<h4>Chào mừng bạn tới Xổ số Việt</h4>
				<p>Bạn chưa có tài khoản?</p>
				<a href="./register"><button>Đăng ký ngay</button></a> <a
					href="./home">Quay lại trang chủ</a>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Reset mật
						khẩu</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="email-reset" class="form-label">Chúng
							tôi sẽ gửi mật khẩu mới qua email của bạn</label> <input type="email"
							class="form-control" id="email-reset" name="usermail"
							form="reset-form" placeholder="Nhập email của bạn" required>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Hủy</button>
					<button id="btn-email" type="submit" class="btn btn-primary"
						form="reset-form">Xác
						nhận</button>
				</div>
				<form action="./user-reset-password" method="post" id="reset-form"></form>
			</div>
		</div>
	</div>

	<c:if test="${param.success != null}">
		<div class="my-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close modal-close"></button>
					</div>
					<div class="my-modal-body">
						<p>Thành công! Hãy kiểm tra hộp thư của bạn.</p>
						<button type="button" class="btn btn-primary modal-close">Đóng</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${param.failed != null}">
		<div class="my-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close modal-close"></button>
					</div>
					<div class="my-modal-body">
						<p style="color: red">Thất bại, email không tồn tại trong hệ
							thống.</p>
						<button type="button" class="btn btn-primary modal-close">Đóng</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${param.error != null}">
		<div class="my-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close modal-close"></button>
					</div>
					<div class="my-modal-body">
						<p style="color: red">Thất bại, tài khoản hoặc mật khẩu không
							chính xác!</p>
						<button type="button" class="btn btn-primary modal-close">Đóng</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<div class="my-modal" id="my-modal-hidden">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="my-modal-body">
					<div class="text-center">
						<div class="spinner-border" role="status">
							<span class="visually-hidden">Đang cập nhật...</span>
						</div>
						<div style="margin-top: 50px">Đang thực hiện</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>