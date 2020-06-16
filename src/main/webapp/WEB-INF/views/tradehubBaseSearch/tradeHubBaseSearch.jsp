<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../menu/nav.jsp"%>
<head>
<title>SSAFY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	function requestFilteredHouses() {
		var group = document.getElementsByName("group");

		for (var i = 0; i < group.length; i++) {
			if (group[i].checked == true) {
				var g = group[i].value;

				if ($("#dong").val() != "0")
					location.href = "${root}/house/main?group=" + g
							+ "&contents=" + $("#contents").val() + "&pg="
							+ $("#pg").val() + "&dong=" + $("#dong").val();
				else
					location.href = "${root}/house/main?group=" + g
							+ "&contents=" + $("#contents").val() + "&pg="
							+ $("#pg").val();

			}
		}
	}

	$(document).ready(
			function() {

				$.get("${root}/select/sido", function(data, status) {
					$.each(data, function(index, vo) {
						$("#sido").append(
								"<option value='"+vo.sido_code+"'>"
										+ vo.sido_name + "</option>");
					});//each
				}//function
				, "json");//get
			});//ready
	$(document).ready(
			function() {
				$("#sido").change(
						function() {
							$.get("${root}/select/gugun", {
								sido : $("#sido").val()
							}, function(data, status) {
								$("#gugun").empty();
								$("#gugun").append(
										'<option value="0">구군</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append(
											"<option value='"+vo.gugun_code+"'>"
													+ vo.gugun_name
													+ "</option>");
								});//each
							}//function
							, "json");//get
						});//change
				$("#gugun").change(
						function() {
							$.get("${root}/select/dong", {
								gugun : $("#gugun").val()
							}, function(data, status) {
								$("#dong").empty();
								$("#dong").append(
										'<option value="0">동</option>');
								$.each(data, function(index, vo) {
									$("#dong").append(
											"<option value='"+vo.dong+"'>"
													+ vo.dong + "</option>");
								});//each
							}//function
							, "json");//get
						});//change

				$("#dong").change(function() {
					var group = document.getElementsByName("group");
					var g;

					for (var i = 0; i < group.length; i++) {
						if (group[i].checked == true) {
							g = group[i].value;
						}
					}

					requestFilteredHouses();
				});
			});//ready
</script>

</head>

<body>

	<div class="container" style="margin-top: 100px">

		<!-- 검색 start-->
		<div id="title" align="center" style="margin-bottom: 100px">
			<h1 class="text-primary" style="margin-bottom: 30px">상권 정보</h1>

			<div style="margin-top: 50px">
				<select id="sido">
					<option value="0">시</option>
				</select> <select id="gugun">
					<option value="0">구군</option>
				</select> <select id="dong">
					<option value="0">동</option>
				</select>
			</div>

			<form id="loginform" method="get" action="">
				<div style="margin: 20px">
					<input type="hidden" name="pg" id="pg" value="1"> <input
						type="radio" id="all" value="all" name="group"
						onclick="location.href='javascript:requestFilteredHouses();'"
						<c:if test="${group eq 'all'}">checked="checked"</c:if>> <label
						for="all">전체</label> <input type="radio" id="apt" value="apt"
						name="group"
						onclick="location.href='javascript:requestFilteredHouses();'"
						<c:if test="${group eq 'apt'}">checked="checked"</c:if>> <label
						for="apt">아파트</label> <input type="radio" id="house" value="house"
						name="group"
						onclick="location.href='javascript:requestFilteredHouses();'"
						<c:if test="${group eq 'house'}">checked="checked"</c:if>>
					<label for="house">주택</label> <span style="margin: 20px"> <select
						id="sido">
							<option value="0">음식</option>
							<option value="0">생활서비스</option>
							<option value="0">소매</option>
							<option value="0">의료</option>
							<option value="0">학문/교육</option>
							<option value="0">관광/여가/오락</option>
							<option value="0">부동산</option>
							<option value="0">숙박</option>
					</select>
					</span>
				</div>
				<!--  <input type="text" class="form-control" id="contents"
							name="contents" placeholder="" value="${search}">-->
				<div style="margin: 20px">
					<button type="button" class="btn btn-dark text-white"
						style="width: 10%" onclick="javascript:requestFilteredHouses();">검색</button>
						<button type="button" class="btn btn-dark text-white" onclick="javascript:requestFilteredHouses();">결과 내 재검색</button>
				</div>
			</form>
		</div>
		<!-- 검색 end -->

		<c:choose>
			<c:when test="${shops.size() ==0 }">
				<h3>상권 정보가 없습니다.</h3>

			</c:when>

			<c:otherwise>
				<c:forEach var="shop" items="${shops}">

					<div class="border-bottom" style="margin: 30px">
						<h4>${shop.shopName }</h4>
						<p>${shop.smallCategoryName }</p>
						<p>${shop.roadAddress }</p>
					</div>

				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>