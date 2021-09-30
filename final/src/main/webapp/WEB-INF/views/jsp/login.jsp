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
<link rel="stylesheet" href="<c:url value="/resources/css/style-login.css" />">
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

</head>

<body>
	<div class="flex box">
		<div class="flex login">
			<div class="flex items1">
				<h4>Đăng nhập</h4>
				<form class="form-login" action="./doLogin" method="post">
					<div>
						<label for="user">Tài khoản</label>
						<%
						Cookie cookie[] = request.getCookies();
						String userName = "";
						if (cookie != null) {
							for (int i = 0; i < cookie.length; i++) {
								if (cookie[i].getName().equals("userMail")) {
							userName = cookie[i].getValue();
							break;
								}
							}
						}
						%>
						<input class='form-control' type='email' name='usermail' id='user'
							placeholder='Tài khoản' value="<%=userName%>" required>
					</div>
					<div>
						<label for="password">Mật khẩu</label>
						<%
						String pwd = "";
						if (cookie != null) {
							for (int i = 0; i < cookie.length; i++) {
								if (cookie[i].getName().equals("userPass")) {
							pwd = cookie[i].getValue();
							break;
								}
							}
						}
						%>
						<input class="form-control" type="password" name="password"
							id="password" placeholder="Mật khẩu" value="<%=pwd%>" required>
					</div>
					<div class="arlet">
						<p>${mess}</p>
					</div>
					<button type="submit">Đăng nhập</button>
					<span class="form-check"> <input class="form-check-input"
						type="checkbox" id="checkbox" name="remember" checked> <label
						class="form-check-label" for="checkbox">Ghi nhớ</label> <a
						href="#" style="float: right;">Quên mật khẩu</a>
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
</body>

</html>