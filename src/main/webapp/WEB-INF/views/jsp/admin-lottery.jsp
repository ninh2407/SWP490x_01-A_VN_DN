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
	href="<c:url value="/resources/css/style-lottery-result.css" />">
<!-- External js -->
<script type="text/javascript"
	src="<c:url value="/resources/javascrip/lottery-result.js" />"></script>
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
				<li><a href="./manager-user">Quản lý tài khoản</a></li>
				<li><a id="menu-active" href="./manager-lottery">Quản lý
						kết quả xổ số</a></li>
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

			<div class="lottery-result container">
				<div class="flex search-box">
					<form action="./manager-lottery" method="get" class="search-form">
						<p>Tìm kiếm kết quả</p>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Ngày </span>
							</div>
							<input type="date" name="search-date" class="form-control">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Tỉnh </span>
							</div>
							<input class="form-control" list="datalistOptions"
								name="search-province" id="province">
						</div>
						<button type="submit" class="btn btn-primary">
							<i class="fas fa-search"></i> Tìm kiếm
						</button>
					</form>
				</div>
				<form action="./autoUpdate" id="auto-update"></form>
				<div class="row mb-3 header-list-lottery">
					<div class="col-6 flex title-lottery">Danh sách kết quả xổ số
					</div>
					<div class="col-6 flex btn-header">
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
							Cập nhật kết quả</button>
						<button type="submit" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#loading"
							form="auto-update">Tự động cập nhật</button>
					</div>
				</div>
				<c:if test="${listLottery.size() == 0}">
					<div class="notice">
						<p style="text-align: center;">Không tìm thấy kết quả</p>
					</div>
				</c:if>
				<c:if test="${listLottery.size() > 0}">
					<div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col" class="col_1"><input type="checkbox"
										name="" id="check-box-all"></th>
									<th scope="col" class="col_2">Ngày mở thưởng</th>
									<th scope="col" class="col_3">Tỉnh</th>
									<th scope="col" class="col_4">Giải thưởng</th>
									<th scope="col" class="col_5">Xóa</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listLottery}" var="i">
									<tr>
										<th scope="row"><input type="checkbox"
											class="check-items" name="list-date-id"
											value="${i.getOpenDate()}&${i.getCompanyId()}"
											form="delete-many"></th>
										<td>${i.getOpenDateFormat()}</td>
										<td>${i.getProvince()}</td>
										<td><button type="button" class="btn btn-info btn-show"
												data-bs-toggle="modal" data-bs-target="#exampleModal1"
												g0="${i.getSpecialPrize()}" g1="${i.getFirstPrize()}"
												g2="${i.getSecondPrize()}" g3="${i.getThirdPrize()}"
												g4="${i.getFourthPrize()}" g5="${i.getFifthPrize()}"
												g6="${i.getSixthPrize()}" g7="${i.getSeventhPrize()}"
												g8="${i.getEighthPrize()}" hidden-date="${i.getOpenDate()}"
												hidden-companyId="${i.getCompanyId()}"
												hidden-province="${i.getProvince()}"
												dateFormat="${i.getOpenDateFormat()}">Chi tiết</button></td>
										<td><button type="button"
												class="btn btn-info submit-delete-one"
												data-bs-toggle="modal" data-bs-target="#confirm1"
												date-and-id="${i.getOpenDate()}&${i.getCompanyId()}">Xóa</button></td>
									</tr>
								</c:forEach>

								<tr>
									<th scope="row" colspan="2"><button type="button"
											class="btn btn-info" data-bs-toggle="modal"
											data-bs-target="#confirm2" id="btn-delete-many" disabled>Xóa
											kết quả đã chọn</button></th>
									<th scope="row" colspan="3"></th>
								</tr>
							</tbody>
						</table>

						<div class="page-number">
							<a href="${tag==1?'#':'.'+=link+='index='+=tag-1}"><button
									type="button" class="btn btn-primary">
									<i class="fas fa-caret-left"></i>
								</button></a>

							<c:forEach begin="${pageGroup*10 + 1}"
								end="${endP>(pageGroup*10+10)?(pageGroup*10+10):endP}" var="i">
								<a class="${tag==i?'active':''}" href=".${link}index=${i}"><button
										type="button" class="btn btn-primary">${i}</button></a>
							</c:forEach>

							<a href="${tag==endP?'#':'.'+=link+='index='+=tag+1}"><button
									type="button" class="btn btn-primary">
									<i class="fas fa-caret-right"></i>
								</button></a>
						</div>
					</div>
				</c:if>
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
						<li><a href="./manager-user">Quản lý tài khoản</a></li>
						<li><a id="menu-active" href="./manager-lottery">Quản lý
								kết quả xổ số</a></li>
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
						<c:if test="${param.failed.equalsIgnoreCase('exist')}">
							<p style="color: red">Thất bại, kết quả đã tồn tại trong hệ
								thống.</p>
						</c:if>
						<c:if test="${param.failed.equalsIgnoreCase('province')}">
							<p style="color: red">Thất bại. Tên tỉnh không hợp lệ</p>
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
					<h5 class="modal-title" id="exampleModalLabel">Cập nhật kết
						quả xổ số</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="update-lottery">
						<form action="./add-lottery" method="get">
							<input type="hidden" name="url"
								value="${pageContext.request.queryString}">
							<div class="row mb-3">
								<div class="col-6">
									<label for="province" class="form-label">Tỉnh</label> <input
										class="form-control" name="province-lottery"
										list="datalistOptions" id="province-lottery" required>
									<datalist id="datalistOptions">
										<c:forEach items="${listCompany}" var="c">
											<option value="${c.getProvince()}">
										</c:forEach>
									</datalist>
								</div>
								<div class="col-6">
									<label for="date-lottery" class="form-label">Ngày mở
										thưởng</label> <input class="form-control" type="date"
										id="date-lottery" name="date-lottery" value="${currentDate}" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-0" class="col-sm-2 col-form-label">Giải
									đặc biệt</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g0" id="g-0"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-1" class="col-sm-2 col-form-label">Giải
									nhất</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g1" id="g-1"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-2" class="col-sm-2 col-form-label">Giải
									nhì</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g2" id="g-2"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-3" class="col-sm-2 col-form-label">Giải ba</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g3" id="g-3"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-4" class="col-sm-2 col-form-label">Giải tư</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g4" id="g-4"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-5" class="col-sm-2 col-form-label">Giải
									năm</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g5" id="g-5"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-6" class="col-sm-2 col-form-label">Giải
									sáu</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g6" id="g-6"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-7" class="col-sm-2 col-form-label">Giải
									bảy</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g7" id="g-7"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g-8" class="col-sm-2 col-form-label">Giải
									tám</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g8" id="g-8"
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<p>Kết quả phải được cách nhau bằng ký tự "-". Ví dụ:
									1234-1234-1234</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Hủy</button>
								<input type="reset" class="btn btn-primary" value="Nhập lại">
								<button type="submit" class="btn btn-primary">Cập nhật</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Modal fix -->
	<div class="modal fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Chi tiết giải
						thưởng</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="fix-lottery">
						<form action="./edit-lottery" method="post">
							<input type="hidden" name="companyId" id="hidden-companyId">
							<input type="hidden" name="date" id="hidden-date"> <input
								type="hidden" name="url"
								value="${pageContext.request.queryString}">
							<div class="row mb-3">
								<div class="col-6 text-mid">
									Tỉnh: <span id="province-head"></span>
								</div>
								<div class="col-6 text-mid">
									Ngày: <span id="date-head"></span>
								</div>
							</div>
							<div class="row mb-3">
								<label for="g0" class="col-sm-2 col-form-label">Giải đặc
									biệt</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g0" id="g0"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g1" class="col-sm-2 col-form-label">Giải
									nhất</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g1" id="g1"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g2" class="col-sm-2 col-form-label">Giải nhì</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g2" id="g2"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g3" class="col-sm-2 col-form-label">Giải ba</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g3" id="g3"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g4" class="col-sm-2 col-form-label">Giải tư</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g4" id="g4"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g5" class="col-sm-2 col-form-label">Giải năm</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g5" id="g5"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g6" class="col-sm-2 col-form-label">Giải sáu</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g6" id="g6"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g7" class="col-sm-2 col-form-label">Giải bảy</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g7" id="g7"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<label for="g8" class="col-sm-2 col-form-label">Giải tám</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="g8" id="g8"
										disabled
										pattern="(^\d{1,6}$|^([^-\D]{1,6}[\s]{0,1}-[\s]{0,1}[^-\D]{1,6}[\s]{0,1})+$)">
								</div>
							</div>
							<div class="row mb-3">
								<p>* Lưu ý: Kết quả phải được cách nhau bằng ký tự "-". Ví
									dụ: 1234-1234-1234</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									id="cancel-fix-lottery" data-bs-dismiss="modal">Hủy</button>
								<button type="button" class="btn btn-primary"
									id="btn-fix-lottery">Chỉnh sửa</button>
								<button type="submit" class="btn btn-primary"
									id="submit-fix-lottery" style="display: none;">Cập
									nhật</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Confirm box -->
	<div class="modal fade" id="confirm1" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="my-modal-body">Lưu ý dữ liệu sau khi xóa sẽ không
						thể phục hồi. Vẫn tiếp tục xóa?</div>
				</div>
				<form action="./delete-lottery" method="post" id="delete-one">
					<input type="hidden" name="url"
						value="${pageContext.request.queryString}"> <input
						type="hidden" name="date-and-id" id="date-and-id-form">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Hủy</button>
						<button type="submit" class="btn btn-primary">Xác nhận</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Confirm box -->
	<div class="modal fade" id="confirm2" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="my-modal-body">Lưu ý dữ liệu sau khi xóa sẽ không
						thể phục hồi. Vẫn tiếp tục xóa?</div>
				</div>
				<form action="./delete-many-lottery" method="post" id="delete-many">
					<input type="hidden" name="url"
						value="${pageContext.request.queryString}">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Hủy</button>
						<button type="submit" class="btn btn-primary">Xác nhận</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal loading -->
	<div class="modal fade" id="loading" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="text-center">
						<div class="spinner-border" role="status">
							<span class="visually-hidden">Đang cập nhật...</span>
						</div>
						<div style="margin-top: 50px">Đang cập nhật.....</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>