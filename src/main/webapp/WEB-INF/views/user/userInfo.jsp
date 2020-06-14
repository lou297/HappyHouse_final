<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<%@ include file="../menu/nav.jsp"%>
<head>
<meta charset="UTF-8">
<title>회원 정보 확인</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container" align="center">
		<h2>회원 정보 확인</h2>
		<div>
			<c:if test="${userinfo != null}">
				<div class="userId">아이디 : ${userinfo.userid}</div>
				<div class="userPw">비밀번호 : ${userinfo.userpwd}</div>
				<div class="userName">이름 : ${userinfo.username}</div>
				<div class="userAddr">주소 : ${userinfo.address}</div>
				<div class="userPhone">이메일 : ${userinfo.email}</div>
				<div class="joinDate">가입한 날 : ${userinfo.joindate}</div>
			</c:if>
			<c:if test="${userinfo == null}">
				null
			</c:if>
		</div>
		<button class="btn btn-primary" onClick = "location.href='${root}/index.jsp'">확인</button>
		<button class="btn btn-primary" onClick = "location.href='${root}/user/modifyPage'">수정</button>
	</div>
</body>
</html>