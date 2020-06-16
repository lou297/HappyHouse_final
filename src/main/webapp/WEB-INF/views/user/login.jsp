<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<%@ include file="../menu/nav.jsp"%>
<meta charset="UTF-8">
<title>로그인</title>


<script type="text/javascript">
function login() {
	 if (document.getElementById("userid").value == "") {
			alert("아이디를 입력해주세요");
			return;
		}else if (document.getElementById("userpwd").value == "") {
			alert("비밀번호를 입력해주세요");
			return;
		} else {
		document.getElementById("loginForm").action = "${root}/user/login";
		document.getElementById("loginForm").submit();
	}
}
</script>
</head>
<body>
	<div class="container" align="center" style="margin-top:100px">
		<h2>로그인</h2>
		<form id="loginForm" method="post" action="">
			<input type="hidden" name="act" value="loginCheck">
			
			<div class="form-group row justify-content-center">
				<label for="id" class="col-2 mb-0 align-middle">아이디</label> 
				<input type="text" class="form-control col-4" id="userid" name="userid">
			</div>
			<div class="form-group row justify-content-center">
				<label for="password" class="col-2">비밀번호</label> 
				<input type="password" class="form-control col-4" id="userpwd" name="userpwd">
			</div>
			
			<button type="button" class="btn btn-primary" onclick="javascript:login();">로그인</button>
			<button type="button" class="btn btn-primary" onclick="location.href='${root}/user/registPage'">회원가입</button>
			<button type="button" class="btn btn-primary" onclick="location.href='${root}/user/findPwPage'">비밀번호 찾기</button>
		</form>
	
	</div>
</body>
</html>