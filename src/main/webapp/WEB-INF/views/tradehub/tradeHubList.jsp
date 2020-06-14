<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../menu/nav.jsp"%>
<head>
<title>SSAFY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<c:set var="root" value="${pageContext.request.contextPath }"/>
<script type="text/javascript">
	function findCategory(str) {
		location.replace("${root}/tradehub/category?selected=" + str);
	}
	
	function findDongName(str) {
		location.replace("${root}/tradehub/dong?selected=" + str);
	}
</script>

</head>

<body>
	
	<div class="container" style="margin-top:100px">
	
		<div id="title" align="center" style="margin-bottom:100px">
			<h1 class="text-primary" style="margin-bottom:30px">상권 정보</h1>
			
			<c:choose>
				<c:when test="${categorys ne null }">
					<select name="category"  onchange="javascript:findCategory(this.value)" > 
						<c:forEach var="category" items="${categorys }">
							<option value="${category }" <c:if test="${category eq selected}">selected="selected"</c:if>>${category}</option>
						</c:forEach>
					</select>
				</c:when>
				
				<c:when test="${dongNames ne null }">
					<select name="dongName"  onchange="javascript:findDongName(this.value)" > 
						<c:forEach var="dongName" items="${dongNames }">
							<option value="${dongName }" <c:if test="${dongName eq selected}">selected="selected"</c:if>>${dongName}</option>
						</c:forEach>
					</select>
				</c:when>
				
			</c:choose>
		</div>
		
		
		
		
		
		
		<c:choose>
			<c:when test="${shops.size() ==0 }">
				<h3>상권 정보가 없습니다.</h3>
			
			</c:when>
			
			<c:otherwise>
				<c:forEach var="shop" items="${shops}">
				<%--
		  		<table class = "table table-striped table-dark">
		  			<tbody align="center">
			  			<tr>
			  				<th scope="col">상호명</th>
			  				<th scope="col">분류</th>
			  				<th scope="col">층 정보</th>
			  			</tr>
			  			
			  			<tr>
			  				<td>${shop.shopName }</td>
			  				<td>${shop.smallCategoryName }</td>
			  				<td>${shop.floorInfo }</td>
			  			</tr>
			  			
			  			<tr>
			  				<th scope="col">도로명주소</th>
			  				<th scope="col">위도</th>
			  				<th scope="col">경도</th>
			  			</tr>
			  			
			  			<tr>
			  				<td>${shop.roadAddress }</td>
			  				<td>${shop.longitude}</td>
			  				<td>${shop.latitude }</td>
			  			</tr>
		  			</tbody>
		  		</table>
		  		
		  		 --%>
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