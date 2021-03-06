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
<link rel="stylesheet"
	href="<c:url value="/resources/css/history.css" />">
<!-- External js -->
<script type="text/javascript"
	src="<c:url value="/resources/javascrip/home-js.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/javascrip/lottery-result.js" />"></script>
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
					<a href="../home/MB">
						<li>X??? S??? MI???N B???C</li>
					</a>
					<a href="../home/MT">
						<li>X??? S??? MI???N TRUNG</li>
					</a>
					<a href="../home/MN">
						<li>X??? S??? MI???N NAM</li>
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
						<a href="../login">????ng nh???p</a>
					</div>
					<div class="flex register">
						<a href="../register">????ng k??</a>
					</div>
				</div>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<div class="flex user">
					<button class="flex btn user-logo">
						<i class="far fa-user-circle icon"
							style="color: white; font-size: 40px;"></i> <span>${name}</span>
						<div class="flex user-drop">
							<a href="./profile">Th??ng tin t??i kho???n</a> <a href="./history">L???ch
								s??? d?? v??</a>
							<c:if test="${isAdmin!=null}">
								<a href="../admin">Trang qu???n l??</a>
							</c:if>
							<a href="../logout">????ng xu???t</a>
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
				<h5>X??? S??? VI???T</h5>
				<p style="margin-left: 50px;">
					<i class="fas fa-check"></i> K???t qu??? x??? s??? c??c t???nh m???i nh???t
				</p>
				<p style="margin-left: 80px;">
					<i class="fas fa-check"></i> C???p nh???t k???t qu??? h??ng ng??y, h??ng gi???
				</p>
				<p style="margin-left: 110px;">
					<i class="fas fa-check"></i> Th???ng k??, d??? ??o??n k???t qu??? x??? s??? t???t
					nh???t
				</p>
				<div class="btn-search" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<button type="button">D?? v?? s??? ngay</button>
				</div>
			</div>
		</div>

		<div class="flex body">
			<div class="flex adv"></div>

			<div class="flex main">
				<div class="flex history">
					<div class="flex history-header">
						<h5>
							<i class="fas fa-book-open"></i> L???ch s??? d?? v?? x???
						</h5>
					</div>

					<div class="flex search-box-history">
						<form action="./search-history" method="get" class="search-form">
							<p>T??m ki???m k???t qu???</p>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Ng??y </span>
								</div>
								<input type="date" name="search-date" class="form-control">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">T???nh </span>
								</div>
								<input class="form-control" list="datalistOptions"
									name="search-province" id="province">
							</div>
							<button type="submit" class="btn btn-primary">
								<i class="fas fa-search"></i> T??m ki???m
							</button>
						</form>
					</div>
					<c:if test="${listTicket.size() == 0}">
						<div class="notice">
							<p>Kh??ng t??m th???y l???ch s??? d?? v?? s??? c???a b???n</p>
						</div>
					</c:if>
					<c:if test="${listTicket.size() > 0}">
						<div class="flex history-ticket">
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th scope="col" class="col1"><input type="checkbox"
											name="" id="check-box-all"></th>
										<th scope="col" class="col2">Ng??y</th>
										<th scope="col" class="col3">T???nh</th>
										<th scope="col" class="col4">V?? s???</th>
										<th scope="col" class="col5">K???t qu???</th>
										<th scope="col" class="col6">X??a</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listTicket}" var="i">
										<tr>
											<td scope="row" data-label="Ch???n"><input type="checkbox"
												class="check-items" name="list-date-id"
												value="${i.getCompanyId()}&${i.getOpenDate()}&${i.getTicketCode()}"
												form="delete-many"></td>
											<td data-label="Ng??y">${i.getOpenDateFormat()}</td>
											<td data-label="T???nh">${i.getProvince()}</td>
											<td data-label="V?? s???">${i.getTicketCode()}</td>
											<td data-label="K???t qu???">${i.getResult()}</td>
											<td data-label="X??a"><button type="button"
													class="btn btn-info submit-delete-one"
													data-bs-toggle="modal" data-bs-target="#confirm1"
													date-and-id="${i.getCompanyId()}&${i.getOpenDate()}&${i.getTicketCode()}">
													<i class="fas fa-trash-alt" style="color: white;"></i>
												</button></td>
										</tr>
									</c:forEach>

									<tr>
										<td scope="row" colspan="6" style="text-align: right;"><button
												type="button" class="btn btn-warning" data-bs-toggle="modal"
												data-bs-target="#confirm2" id="btn-delete-many" disabled>X??a
												v?? s??? ???? ch???n</button></td>
									</tr>
								</tbody>
							</table>
						</div>
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

			<div class="flex check-lottery" id="check">
				<div class="check-title">D?? v?? s??? online</div>
				<form class="flex form-lottery" action="../search-lottery"
					method="get">
					<div class="flex date-lottery">
						<label for="">Ng??y:</label> <input class="form-control"
							type="date" name="date" id="" required>
					</div>
					<div class="flex">
						<label for="province" class="form-label">T???nh</label> <input
							class="form-control" name="province" list="datalistOptions"
							id="province" required>
						<datalist id="datalistOptions">
							<c:forEach items="${listCompany}" var="c">
								<option value="${c.getProvince()}">
							</c:forEach>
						</datalist>
					</div>
					<div class="flex">
						<label for="">V?? s???: </label> <input class="form-control"
							type="text" name="code" id="" maxlength="6" pattern="^\d{1,6}$"
							title="Vui l??ng nh???p ch??? s???" required>
					</div>
					<div class="flex submit-lottery">
						<button type="submit">D?? NGAY</button>
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
						<h5>C??ng ty x??? s??? Vi???t</h5>
						<p>?????a ch???: 98 ???????ng A, ph?????ng B, Qu???n C, TP.HCM</p>
						<p>??i???n tho???i: 0333833908</p>
						<p>Email: ninh2407@gmail.com</p>
					</div>

				</div>
				<div class="col-sm-4">
					<div class="flex items-footer">
						<h5>K???t qu??? x??? s???</h5>
						<a href="../home/MB">K???t qu??? x??? s??? Mi???n B???c</a> <a
							href="../home/MT">K???t qu??? x??? s??? Mi???n Trung</a> <a
							href="../home/MN">K???t qu??? x??? s??? Mi???n Nam</a>
					</div>
				</div>
			</div>
		</footer>

		<c:if test="${param.success != null}">
			<div class="my-modal">
				<div class="modal-dialog md-box">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="btn-close modal-close"></button>
						</div>
						<div class="my-modal-body">
							<p>Th??nh c??ng!</p>
							<button type="button" class="btn btn-primary modal-close">????ng</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<div class="offcanvas offcanvas-start" data-bs-scroll="true"
			tabindex="-1" id="offcanvasWithBothOptions"
			aria-labelledby="offcanvasWithBothOptionsLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">K???t
					qu??? x??? s??? c??c t???nh</h5>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<div class="flex menu-moblie">
					<ul>
						<c:forEach items="${listCompany}" var="c">
							<li><a href="../home/${c.getId()}">${c.getProvince()}</a></li>
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
						style="color: white; font-size: 40px;"></i><span>${name==null?'T??i kho???n':name}</span>
				</h5>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<div class="login-moblie">
						<a href="../login">????ng nh???p</a>

					</div>
					<div class="login-moblie">
						<a href="../register">????ng k??</a>
					</div>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<div class="login-moblie">
						<a href="./profile">Th??ng tin t??i kho???n</a>
					</div>
					<div class="login-moblie">
						<a href="#">L???ch s??? d?? v??</a>
					</div>
					<c:if test="${isAdmin!=null}">
						<div class="login-moblie">
							<a href="../admin">Trang qu???n l??</a>
						</div>
					</c:if>
					<div class="login-moblie">
						<a href="../logout">????ng xu???t</a>
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
						<h5 class="modal-title" id="exampleModalLabel">D?? x??? s???
							online</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form class="flex form-lottery" action="../search-lottery"
							method="get">
							<div class="flex date-lottery">
								<label for="">Ng??y:</label> <input class="form-control"
									type="date" name="date" id="" required>
							</div>
							<div class="flex">
								<label for="province-moblie" class="form-label">T???nh</label> <input
									class="form-control" name="province" list="datalistOptions"
									id="province-moblie" required>
							</div>
							<div class="flex">
								<label for="">V?? s???: </label> <input class="form-control"
									type="text" name="code" id="" maxlength="6" pattern="^\d{1,6}$"
									title="Vui l??ng nh???p ch??? s???" required>
							</div>
							<div class="flex submit-lottery">
								<button type="submit">D?? NGAY</button>
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
					<div class="my-modal-body">L??u ?? d??? li???u sau khi x??a s??? kh??ng
						th??? ph???c h???i. V???n ti???p t???c x??a?</div>
				</div>
				<form action="./delete-ticket" method="post" id="delete-one">
					<input type="hidden" name="username"
						value="${pageContext.request.userPrincipal.name}"> <input
						type="hidden" name="date-and-id" id="date-and-id-form">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">H???y</button>
						<button type="submit" class="btn btn-primary">X??c nh???n</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Confirm box many-->
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
					<div class="my-modal-body">L??u ?? d??? li???u sau khi x??a s??? kh??ng
						th??? ph???c h???i. V???n ti???p t???c x??a?</div>
				</div>
				<form action="./delete-many-ticket" method="post" id="delete-many">
					<input type="hidden" name="username"
						value="${pageContext.request.userPrincipal.name}">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">H???y</button>
						<button type="submit" class="btn btn-primary">X??c nh???n</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

</html>