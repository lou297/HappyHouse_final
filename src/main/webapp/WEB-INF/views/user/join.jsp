<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value = "${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<%@ include file="../menu/nav.jsp"%>
<meta charset="UTF-8">
<title>회원가입</title>



<script type="text/javascript">
function registerMember() {
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
			alert("이메일을 입력해주세요");
			return;
		} else {
		document.getElementById("registerForm").action = "${root}/user/register";
		document.getElementById("registerForm").submit();
	}
}
</script>
</head>
<body>
	<div class="container" style = "margin-top : 100px">
	<h2>회원 가입</h2>
		<form id="registerForm" method="post" action="">
			<input type="hidden" name="act" value="register">
			
			<div class="form-group">
				<label for="id" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-lg-2 control-label">비밀번호</label> 
				<div class="col-lg-10">
					<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="패스워드" maxlength="30">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-lg-2 control-label">이름</label> 
				<div class="col-lg-10">
                    <input type="text" class="form-control" id="username"name="username" placeholder="한글만 입력 가능합니다." maxlength="15">
                </div>
			</div>
			<div class="form-group">
				<label for="address" class="col-lg-2 control-label">주소</label>
				<div class="col-lg-10"> 
					<input type="text" class="form-control" id="address" name="address" placeholder="주소">
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-lg-2 control-label">이메일</label> 
				<div class="col-lg-10">
                    <input type="tel" class="form-control" id="email" name="email" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                </div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="button" class="btn btn-primary" onclick="javascript:registerMember();">등록</button>
				</div>
			</div>
		</form>
		
	</div>
</body>
</html>