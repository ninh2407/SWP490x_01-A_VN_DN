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
<!-- Google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300&family=Lobster&family=Roboto+Slab:wght@500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300&family=Lobster&family=Philosopher&family=Roboto+Slab:wght@500&display=swap"
	rel="stylesheet">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- External css -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/style-home.css" />">
<!-- External js -->
<script type="text/javascript"
	src="<c:url value="/resources/javascrip/home-js.js" />"></script>
</head>

<body>
	<div class="container-fluid px-0">
		<div class="flex nav-bar" id="navbar">
			<div class="flex logo">
				<img
					src="<c:url value="/resources/assets/imgs/logoVip-removebg-preview.png"/>"
					alt="logo">
			</div>

			<div class="flex nav-list">
				<ul>
					<a href="./MB">
						<li>XỔ SỐ MIỀN BẮC</li>
					</a>
					<a href="./MT">
						<li>XỔ SỐ MIỀN TRUNG</li>
					</a>
					<a href="./MN">
						<li>XỔ SỐ MIỀN NAM</li>
					</a>
				</ul>
			</div>

			<c:if test="${pageContext.request.userPrincipal.name == null}">
				<div class="flex login">
					<div class="flex logo-acc">
						<i class="far fa-user-circle icon"
							style="color: white; font-size: 40px;"></i>
					</div>
					<div class="flex sign-in">
						<a href="../login">Đăng nhập</a>
					</div>
					<div class="flex register">
						<a href="../register">Đăng ký</a>
					</div>
				</div>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<div class="flex user">
					<button class="flex btn user-logo">
						<i class="far fa-user-circle icon"
							style="color: white; font-size: 40px;"></i> <span>${name}</span>
						<div class="flex user-drop">
							<a href="../user/profile">Thông tin tài khoản</a> <a
								href="../user/history">Lịch sử dò vé</a>
							<c:if test="${isAdmin!=null}">
								<a href="../admin">Trang quản lý</a>
							</c:if>
							<a href="../logout">Đăng xuất</a>
						</div>
					</button>
				</div>
			</c:if>
		</div>

		<div class="flex nav-bar-mobile">
			<div class="flex btn-moblie">
				<button class="btn" type="button" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasWithBothOptions"
					aria-controls="offcanvasWithBothOptions">
					<i class="fas fa-bars" style="color: white;"></i>
				</button>
			</div>
			<div class="flex logo-moblie">
				<img
					src="<c:url value="/resources/assets/imgs/logoVip-removebg-preview.png"/>"
					alt="logo">
			</div>
			<div class="flex logo-acc">
				<button class="btn" type="button" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
					<i class="far fa-user-circle icon"
						style="color: white; font-size: 30px;"></i>
				</button>
			</div>
		</div>

		<div class="banner">
			<img src="<c:url value="/resources/assets/imgs/banner.jpg"/>"
				alt="banner">
			<div class="slogan">
				<h5>XỔ SỐ VIỆT</h5>
				<p style="margin-left: 50px;">
					<i class="fas fa-check"></i> Kết quả xổ số các tỉnh mới nhất
				</p>
				<p style="margin-left: 80px;">
					<i class="fas fa-check"></i> Cập nhật kết quả hàng ngày, hàng giờ
				</p>
				<p style="margin-left: 110px;">
					<i class="fas fa-check"></i> Thống kê, dự đoán kết quả xổ số tốt
					nhất
				</p>
				<div class="btn-search" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<button type="button">Dò vé số ngay</button>
				</div>
			</div>
		</div>

		<div class="flex body">
			<div class="flex adv"></div>

			<div class="flex main">
				<div class="flex menu">
					<div class="menu-title">Kết quả xổ số các tỉnh</div>
					<ul id="tag">
						<c:forEach items="${listCompany}" var="c">
							<li><a href="./${c.getId()}">${c.getProvince()}</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="flex result">
					<div class="flex result-header">
						<h2>Kết quả xổ số ${province}</h2>
					</div>

					<c:forEach items="${listResult}" var="rl">

						<div class="flex box-result">
							<div class="result-title">
								<span>KẾT QUẢ XỔ SỐ ${rl.getProvince().toUpperCase()}</span> <span>NGÀY
									${rl.getOpenDateFormat()}</span>
							</div>
							<table class="table table-bordered table-striped">
								<c:if test="${rl.getEighthPrize() != ''}">
									<tr>
										<td class="prize">
											<p>G.8</p>
										</td>
										<td class="flex row-result"><span
											class="flex result-number">${rl.getEighthPrize()}</span></td>
									</tr>
								</c:if>

								<tr>
									<td class="prize">
										<p>G.7</p>
									</td>
									<td class="flex row-result"><c:forEach
											items="${rl.getListPrize(rl.getSeventhPrize())}" var="s">
											<span class="flex result-number">${s}</span>
										</c:forEach></td>
								</tr>

								<tr>
									<td class="prize">
										<p>G.6</p>
									</td>
									<td class="flex row-result"><c:forEach
											items="${rl.getListPrize(rl.getSixthPrize())}" var="s">
											<span class="flex result-number">${s}</span>
										</c:forEach></td>
								</tr>

								<tr>
									<td class="prize">
										<p>G.5</p>
									</td>
									<td class="flex row-result"><c:forEach
											items="${rl.getListPrize(rl.getFifthPrize())}" var="s">
											<span class="flex result-number">${s}</span>
										</c:forEach></td>
								</tr>

								<tr>
									<td class="prize">
										<p>G.4</p>
									</td>
									<td class="flex row-result"><c:forEach
											items="${rl.getListPrize(rl.getFourthPrize())}" var="s">
											<span class="flex result-number">${s}</span>
										</c:forEach></td>
								</tr>

								<tr>
									<td class="prize">
										<p>G.3</p>
									</td>
									<td class="flex row-result"><c:forEach
											items="${rl.getListPrize(rl.getThirdPrize())}" var="s">
											<span class="flex result-number">${s}</span>
										</c:forEach></td>
								</tr>

								<tr>
									<td class="prize">
										<p>G.2</p>
									</td>
									<td class="flex row-result"><c:forEach
											items="${rl.getListPrize(rl.getSecondPrize())}" var="s">
											<span class="flex result-number">${s}</span>
										</c:forEach></td>
								</tr>

								<tr>
									<td class="prize">
										<p>G.1</p>
									</td>
									<td class="flex row-result"><span
										class="flex result-number">${rl.getFirstPrize()}</span></td>
								</tr>

								<tr>
									<td class="prize">
										<p>ĐB</p>
									</td>
									<td class="flex row-result"><span
										class="flex result-number special">${rl.getSpecialPrize()}</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
					<div class="page-number">
						<a href="${tag==1?'#':'./'+=pageId+='?index='+=tag-1}"><button
								type="button" class="btn">
								<i class="fas fa-caret-left"></i>
							</button></a>

						<c:forEach begin="${pageGroup*5 + 1}"
							end="${endP>(pageGroup*5+5)?(pageGroup*5+5):endP}" var="i">
							<a class="${tag==i?'active':''}" href="./${pageId}?index=${i}"><button
									type="button" class="btn">${i}</button></a>
						</c:forEach>

						<a href="${tag==endP?'#':'./'+=pageId+='?index='+=tag+1}"><button
								type="button" class="btn">
								<i class="fas fa-caret-right"></i>
							</button></a>
					</div>
				</div>
			</div>

			<div class="flex check-lottery" id="check">
				<div class="check-title">Dò vé số online</div>
				<form class="flex form-lottery" action="../search-lottery"
					method="get">
					<div class="flex date-lottery">
						<label for="">Ngày:</label> <input class="form-control"
							type="date" name="date" id="" required>
					</div>
					<div class="flex">
						<label for="province" class="form-label">Tỉnh</label> <input
							class="form-control" name="province"
							list="datalistOptions" id="province" required>
						<datalist id="datalistOptions">
							<c:forEach items="${listCompany}" var="c">
								<option value="${c.getProvince()}">
							</c:forEach>
						</datalist>
					</div>
					<div class="flex">
						<label for="">Vé số: </label> <input class="form-control"
							type="text" name="code" id="" maxlength="6" pattern="^\d{1,6}$"
							title="Vui lòng nhập chữ số" required>
					</div>
					<div class="flex submit-lottery">
						<button type="submit">DÒ NGAY</button>
					</div>
				</form>
			</div>

			<div class="flex adv"></div>

		</div>

		<!-- Footer -->
		<footer class="footer container-fluid pt-1">
			<div class="row">
				<div class="col-sm-3">
					<div class="flex items-footer1">
						<img
							src="<c:url value="/resources/assets/imgs/logoVip-removebg-preview.png"/>"
							alt="logo">
					</div>
				</div>
				<div class="col-sm-5">
					<div class="flex items-footer">
						<h5>Công ty xổ số Việt</h5>
						<p>Địa chỉ: 98 đường A, phường B, Quận C, TP.HCM</p>
						<p>Điện thoại: 0333833908</p>
						<p>Email: ninh2407@gmail.com</p>
					</div>

				</div>
				<div class="col-sm-4">
					<div class="flex items-footer">
						<h5>Kết quả xổ số</h5>
						<a href="./MB">Kết quả xổ số Miền Bắc</a> <a href="./MT">Kết
							quả xổ số Miền Trung</a> <a href="./MN">Kết quả xổ số Miền Nam</a>
					</div>
				</div>
			</div>
		</footer>

		<div class="offcanvas offcanvas-start" data-bs-scroll="true"
			tabindex="-1" id="offcanvasWithBothOptions"
			aria-labelledby="offcanvasWithBothOptionsLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Kết
					quả xổ số các tỉnh</h5>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<div class="flex menu-moblie">
					<ul>
						<c:forEach items="${listCompany}" var="c">
							<li><a href="./${c.getId()}">${c.getProvince()}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
			aria-labelledby="offcanvasRightLabel">
			<div class="offcanvas-header">
				<h5 id="offcanvasRightLabel" class="flex user-logo-moblie">
					<i class="far fa-user-circle icon"
						style="color: white; font-size: 40px;"></i><span>${name==null?'Tài khoản':name}</span>
				</h5>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<div class="login-moblie">
						<a href="../login">Đăng nhập</a>

					</div>
					<div class="login-moblie">
						<a href="../register">Đăng ký</a>
					</div>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<div class="login-moblie">
						<a href="../user/profile">Thông tin tài khoản</a>

					</div>
					<div class="login-moblie">
						<a href="./user/history">Lịch sử dò vé</a>
					</div>
					<c:if test="${isAdmin!=null}">
						<div class="login-moblie">
							<a href="../admin">Trang quản lý</a>
						</div>
					</c:if>
					<div class="login-moblie">
						<a href="../logout">Đăng xuất</a>
					</div>
				</c:if>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Dò xổ số
							online</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form class="flex form-lottery" action="../search-lottery"
							method="get">
							<div class="flex date-lottery">
								<label for="">Ngày:</label> <input class="form-control"
									type="date" name="date" id="" required>
							</div>
							<div class="flex">
								<label for="province-moblie" class="form-label">Tỉnh</label> <input
									class="form-control" name="province"
									list="datalistOptions" id="province-moblie" required>
							</div>
							<div class="flex">
								<label for="">Vé số: </label> <input class="form-control"
									type="text" name="code" id="" maxlength="6" pattern="^\d{1,6}$"
									title="Vui lòng nhập chữ số" required>
							</div>
							<div class="flex submit-lottery">
								<button type="submit">DÒ NGAY</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>