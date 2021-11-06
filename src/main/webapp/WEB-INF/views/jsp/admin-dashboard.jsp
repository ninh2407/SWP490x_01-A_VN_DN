<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

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

<!-- External css -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/style-admin.css" />">
<!-- External js -->
<script type="text/javascript"
	src="<c:url value="/resources/javascrip/admin.js" />"></script>
</head>

<body>
	<div class="flex box">
		<div class="flex menu" style="height: 980px;">
			<div class="logo">
				<img
					src="<c:url value="/resources/assets/imgs/logoVip-removebg-preview.png"/>"
					alt="logo">
			</div>
			<div>
				<p class="admin">Admin:
					${pageContext.request.userPrincipal.name}</p>
			</div>
			<ul>
				<li><a id="menu-active" href="#">Bảng điều khiển</a></li>
				<li><a href="./admin/manager-user">Quản lý tài khoản</a></li>
				<li><a href="./admin/manager-lottery">Quản lý kết quả xổ số</a></li>
				<li><a href="./home">Trang chủ</a></li>
				<li><a href="./logout">Đăng xuất</a></li>
			</ul>
		</div>
		<div class="flex main">
			<div class="flex nav-moblie">
				<div class="nav-icon">
					<button class="btn" type="button" data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasWithBothOptions"
						aria-controls="offcanvasWithBothOptions">
						<i class="fas fa-bars" style="color: white; font-size: 30px;"></i>
					</button>
				</div>
				<div class="flex nav-logo-moblie">
					<img
						src="<c:url value="/resources/assets/imgs/logoVip-removebg-preview.png"/>"
						alt="logo">
				</div>
			</div>
			<div class="banner">
				<img src="<c:url value="/resources/assets/imgs/dash-board.jpg"/>"
					alt="">
			</div>
		</div>
		<div class="offcanvas offcanvas-start" data-bs-scroll="true"
			tabindex="-1" id="offcanvasWithBothOptions"
			aria-labelledby="offcanvasWithBothOptionsLabel">
			<div class="offcanvas-header">
				<button type="button" class="btn-close text-reset btn-menu-close"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<div class="flex menu moblie">
					<ul>
						<li><a id="menu-active" href="#">Bảng điều khiển</a></li>
						<li><a href="./admin/manager-user">Quản lý tài khoản</a></li>
						<li><a href="./admin/manager-lottery">Quản lý kết quả xổ
								số</a></li>
						<li><a href="./home">Trang chủ</a></li>
						<li><a href="./logout">Đăng xuất</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

</html>