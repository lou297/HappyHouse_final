<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<%@ include file="../header/header.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style>
p, span, li, button, a, input, h2, h3, h5, option, select {
	font-family: 'Do Hyeon', sans-serif;
}

a {
	font-size : 18px;
}

.navbar-brand {
	font-size : 35px;
}

</style>

<body>
	<c:set var="root" value="${pageContext.request.contextPath }" />

	<nav class="navbar navbar-expand-md navbar-dark bg-primary">
		<a class="navbar-brand" href="${root}/index.jsp">HAPPY HOUSE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample04" aria-controls="navbarsExample04"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample04">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active" id="main_link"><a class="nav-link"
					href="${root}/index.jsp">메인 페이지 <span class="sr-only">(current)</span></a></li>
				<li class="nav-item active" id="deal_link"><a class="nav-link"
					href="${root}/house/main?group=all&pg=1">아파트 거래 정보<span
						class="sr-only">(current)</span></a></li>

				<!-- 
				<li class="nav-item"><a class="nav-link"
					href="${root}/tradehub/category">업종 별 상권 보기</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${root}/tradehub/dong">동 별 상권 보기</a></li>
					 -->
					
				<li class="nav-item active" id="score_link"><a class="nav-link"
					href="${root}/score/main?pg=1&order=DATE">아파트 평가</a></li>
					<li class="nav-item active" id="recommend_link"><a class="nav-link"
					href="${root}/house/tradeHubBaseSearch?group=all&pg=1">아파트 추천</a></li>
				<li class="nav-item active" id="qnd_link"><a class="nav-link"
					href="${root}/qnapage/main"> QnA 게시판</a></li>
			</ul>

			<form class="form-inline my-2 my-md-0">
				<ul class="navbar-nav mr-auto justify-content-end">
					<c:choose>
						<c:when test="${userinfo eq null }">
							<li class="nav-item active" id="login_link"><a class="nav-link"
								href="${root}/user/loginPage">로그인</a></li>
							<li class="nav-item active" id="regist_link"><a class="nav-link"
								href="${root}/user/registPage">회원 가입</a></li>
						</c:when>

						<c:otherwise>

							<li class="nav-item active" id="inquiry_link"><a class="nav-link"
								href="${root}/user/find">회원 정보 조회</a></li>

							<li class="nav-item active" id="modify_link"><a class="nav-link"
								href="${root}/user/modifyPage">회원 정보 수정</a></li>

							<li class="nav-item active" id="delete_link"><a class="nav-link"
								href="${root}/user/delete">회원 정보 삭제</a></li>

							<li class="nav-item active" id="logout_link"><a class="nav-link"
								href="${root}/user/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</form>

		</div>
	</nav>
</body>
</html>