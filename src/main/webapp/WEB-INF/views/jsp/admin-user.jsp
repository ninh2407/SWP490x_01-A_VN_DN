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

<script type="text/javascript"
	src="<c:url value="/resources/javascrip/register-js.js" />"></script>
</head>

<body>
	<div class="flex box">
		<div class="flex menu">
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
				<li><a href="../admin">Bảng điều khiển</a></li>
				<li><a id="menu-active" href="./manager-user">Quản lý tài
						khoản</a></li>
				<li><a href="./manager-lottery">Quản lý kết quả xổ số</a></li>
				<li><a href="../home">Trang chủ</a></li>
				<li><a href="../logout">Đăng xuất</a></li>
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
			<div class="content">
				<div class="header-content">
					<div class="flex search-box">
						<form action="./search-user" method="get" class="search-form">
							<p>Tìm kiếm tài khoản</p>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Email </span>
								</div>
								<input type="text" name="username" class="form-control">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Tên </span>
								</div>
								<input type="text" name="name" class="form-control">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Điện thoại </span>
								</div>
								<input type="text" name="phone" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">
								<i class="fas fa-search"></i> Tìm kiếm
							</button>
						</form>
					</div>
				</div>

				<div class="container">
					<div class="row mb-3 header-list-user">
						<div class="col-6 flex title-user">Danh sách tài khoản</div>
						<div class="col-6 flex btn-header-user">
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">Tạo
								tài khoản mới</button>
						</div>
					</div>
				</div>

				<div class="main-content">
					<c:if test="${userList.size() == 0}">
						<div class="no-result">Không tìm thấy kết quả phù hợp</div>
					</c:if>
					<c:if test="${userList.size() > 0}">
						<table class="table table-sm table-hover">
							<thead>
								<tr>
									<th id="col1">#</th>
									<th id="col2">Tài khoản/Email</th>
									<th id="col3">Tên</th>
									<th id="col4">Số điện thoại</th>
									<th id="col5">Vai trò</th>
									<th id="col6">Trạng thái</th>
									<th id="col7">Chỉnh sửa</th>
									<th id="col8">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="user" varStatus="i">
									<tr>
										<form id="edit-form${i.count}" action="./edit-user"
											method="post"></form>
										<input type="hidden" name="username"
											value="${user.getUsername()}" form="edit-form${i.count}">
										<input type="hidden" name="index" value="${tag}"
											form="edit-form${i.count}">
										<input type="hidden" name="link" value="${link}"
											form="edit-form${i.count}">
										<td data-label="STT">${i.count}</td>
										<td data-label="Email">${user.getUsername()}</td>
										<td data-label="Tên"><span>${user.getName()}</span><input
											type="text" name="name" id="" value="${user.getName()}"
											form="edit-form${i.count}"></td>
										<td data-label="Số điện thoại"><span>${user.getPhone()}</span><input
											type="text" name="phone" id="" value="${user.getPhone()}"
											form="edit-form${i.count}"></td>
										<td data-label="Vai trò">${user.getRole()}</td>
										<td data-label="Trạng thái">${user.getStatus()==1?'Kích hoạt':'Không kích hoạt'}</td>
										<td data-label="Chỉnh sửa">
											<div class="fix">
												<button type="button" class="b0">
													<i class="fas fa-user-edit"></i> Sửa
												</button>
												<button type="submit" class="b2" form="edit-form${i.count}">
													<i class="fas fa-check-circle"></i> Xác nhận
												</button>
												<button type="reset" class="b1">
													<i class="fas fa-undo-alt"></i> Hủy
												</button>
											</div>
										</td>
										<td data-label="Hành động">
											<form action="./change-status" method="post">
												<input type="hidden" name="username"
													value="${user.getUsername()}"> <input type="hidden"
													name="index" value="${tag}"> <input type="hidden"
													name="enabled" value="${user.getStatus()}"> <input
													type="hidden" name="link" value="${link}">
												<button type="submit">Kích hoạt/dừng</button>
											</form>
											<form action="./reset-password" method="post">
												<input type="hidden" name="username"
													value="${user.getUsername()}"> <input type="hidden"
													name="index" value="${tag}"> <input type="hidden"
													name="link" value="${link}">
												<button>Reset mật khẩu</button>
											</form>
										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="page-number">
							<a href="${tag==1?'#':'.'+=link+='index='+=tag-1}"><button
									type="button" class="btn btn-primary">
									<i class="fas fa-caret-left"></i>
								</button></a>

							<c:forEach begin="${pageGroup*5 + 1}"
								end="${endP>(pageGroup*5+5)?(pageGroup*5+5):endP}" var="i">
								<a class="${tag==i?'active':''}" href=".${link}index=${i}"><button
										type="button" class="btn btn-primary">${i}</button></a>
							</c:forEach>

							<a href="${tag==endP?'#':'.'+=link+='index='+=tag+1}"><button
									type="button" class="btn btn-primary">
									<i class="fas fa-caret-right"></i>
								</button></a>
						</div>
					</c:if>
				</div>

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
						<li><a href="../admin">Bảng điều khiển</a></li>
						<li><a id="menu-active" href="./manager-user">Quản lý tài
								khoản</a></li>
						<li><a href="./manager-lottery">Quản lý kết quả xổ số</a></li>
						<li><a href="../home">Trang chủ</a></li>
						<li><a href="../logout">Đăng xuất</a></li>
					</ul>
				</div>
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
						<p>Thành công!</p>
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
						<c:if test="${param.failed.equalsIgnoreCase('add')}">
							<p style="color: red">Thất bại, email đã tồn tại trong hệ
								thống.</p>
						</c:if>
						<c:if test="${param.failed.equalsIgnoreCase('reset')}">
							<p style="color: red">Thất bại! Không thể dừng hoạt động tài khoản admin.</p>
						</c:if>
						<button type="button" class="btn btn-primary modal-close">Đóng</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<!-- Modal update -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Tạo người dùng
						mới</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="update-lottery">
						<form action="./add-user" method="post">
							<div class="row mb-3">
								<label for="name" class="col-sm-4 col-form-label">Họ và
									tên</label>
								<div class="col-sm-8">
									<input class='form-control' type='text' name='name' id='name'
										placeholder='Nhập tên của bạn' required>
								</div>
							</div>

							<div class="row mb-3">
								<label for="phone" class="col-sm-4 col-form-label">Số
									điện thoại</label>
								<div class="col-sm-8">
									<input class='form-control' type='tel' name='phone' id='phone'
										placeholder='Nhập số điện thoại của bạn'
										pattern="^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$"
										required>
								</div>
							</div>

							<div class="row mb-3">
								<label for="user" class="col-sm-4 col-form-label">Tài
									khoản/Email</label>
								<div class="col-sm-8">
									<input class='form-control' type='email' name='usermail'
										id='user' placeholder='Nhập email của bạn' required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="password" class="col-sm-4 col-form-label">Mật
									khẩu</label>
								<div class="col-sm-8">
									<input class="form-control" type="password" name="password"
										id="password" placeholder="Mật khẩu"
										pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
										title="Mật khẩu phải có ít nhất 8 ký tự bao gồm cả số và chữ"
										required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="re-password" class="col-sm-4 col-form-label">Nhập
									lại mật khẩu</label>
								<div class="col-sm-8">
									<input class="form-control" type="password" name="re-password"
										id="re-password" placeholder="Mật khẩu" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="role" class="col-sm-4 col-form-label">Vai
									trò</label>
								<div class="col-sm-8">
									<select name="role" class="form-select"
										aria-label="Default select example">
										<option value="ROLE_ADMIN">ADMIN</option>
										<option selected value="ROLE_USER">USER</option>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-4"></div>
								<div class="col-sm-8">
									<div class="arlet" id="arlet">
										<p id="error-email"></p>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Hủy</button>
								<input type="reset" class="btn btn-primary" value="Nhập lại">
								<button type="submit" class="btn btn-primary" id="btn-submit">Cập
									nhật</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>