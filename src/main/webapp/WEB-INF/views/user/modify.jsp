<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../menu/nav.jsp"%>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
function modifyMember() {
	 if (document.getElementById("userid").value == "") {
			alert("아이디를 입력해주세요");
			return;
		}else if (document.getElementById("userpwd").value == "") {
			alert("비밀번호를 입력해주세요");
			return;
		} else if (document.getElementById("username").value == "") {
			alert("이름을 입력해주세요");
			return;
		} else if (document.getElementById("address").value == "") {
			alert("주소를 입력해주세요");
			return;
		} else if(document.getElementById("email").value == ""){
			alert("전화번호를 입력해주세요");
			return;
		} else {
		document.getElementById("modifyForm").action = "${root}/user/modify";
		document.getElementById("modifyForm").submit();
	}
}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2>회원 정보 확인</h2>
		<div>
			<c:if test="${userinfo != null}">
				<form id="modifyForm" method="post" action="">
					<input type="hidden" name="act" value="modifyCheck">

					<div class="form-group">
						<label for="id">아이디 :</label> 
						<input type="text" class="form-control" id="userid" name="userid" value="${userinfo.userid}" readonly>
					</div>
					<div class="form-group">
						<label for="password">비밀번호 :</label> 
						<input type="password" class="form-control" id="userpwd" name="userpwd" value="${userinfo.userpwd}">
					</div>
					<div class="form-group">
						<label for="name">이름 :</label> 
						<input type="text" class="form-control" id="username" name="username" value="${userinfo.username}">
					</div>
					<div class="form-group">
						<label for="address">주소 :</label> 
						<input type="text" class="form-control" id="address" name="address" value="${userinfo.address}">
					</div>
					<div class="form-group">
						<label for="phone">전화번호 :</label> 
						<input type="text" class="form-control" id="email" name="email" value="${userinfo.email}">
					</div>

					<button class="btn btn-primary" onclick="javascript:modifyMember();">등록</button>
				</form>
			</c:if>
			<c:if test="${userinfo == null}">
				<p>회원 정보 로드 실패</p>
			</c:if>
		</div>
	</div>
</body>
</html>