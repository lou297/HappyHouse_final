<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<%@ include file="../header/header.jsp"%>
<%@ include file="../menu/nav.jsp"%>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function find() {
		if (document.getElementById("userid").value == "") {
			alert("아이디를 입력해주세요");
			return;
		} else if (document.getElementById("username").value == "") {
			alert("이름을 입력해주세요");
			return;
		} else {
			document.getElementById("findForm").action = "${root}/user/findPw";
			document.getElementById("findForm").submit();
		}
	}
</script>
</head>
<body>
	<c:if test="${user eq null}">
		<div class="container" align="center">
			<h2>비밀번호 찾기</h2>
			<form id="findForm" method="post" action="">
				<input type="hidden" name="act" value="findpassword">

				<div class="form-group">
					<label for="userid">아이디</label> <input type="text" class="" id="userid"
						name="userid">
				</div>
				<div class="form-group">
					<label for="password">이름</label> <input type="password" class=""
						id="username" name="username">
				</div>

				<button type="button" class="btn btn-primary" onclick="javascript:find();">비밀번호
					찾기</button>

			</form>

		</div>
	</c:if>
	<c:if test="${user != null }">
		<div align="center">
			<div>비밀번호 : ${user}</div>
			<a href="${root}/user/loginPage">로그인</a>
		</div>
	</c:if>
</body>
</html>