<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<%@ include file="../header/header.jsp" %>
<%@ include file="../menu/nav.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<c:set var="house_scores" value="${house_scores }"></c:set>



<!-- 구글 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyCjA0YjA7wIVIwwsqyx8kj3qTbbUuA3ATg&sensor=true"></script>
<script type="text/javascript" src="${root }/resources/js/houseInfo.js"></script>


<script type="text/javascript">
google.charts.load('current', {
	'packages' : [ 'bar' ]
});
google.charts.setOnLoadCallback(loadData);

$(document).ready(function() {
	$.ajax({
		type : "get",
		url : "${root}/tradehub/dong/${deal.dong}",
		success : function(shops) {
			$.ajax({
				type : "get",
				url : "${root}/house/info?dong=${deal.dong}&aptname=${deal.aptName}",
				success : function(info) {
					mapInitialize(shops, info);
				}
			});
		}
	});
	
	
	$("#category").change(onRadioChange);
});
					
function loadData() {
	var house;
	var dong;

	$.ajax({
		type : "get",
		url : "${root}/score/dong?dong=${deal.dong}",
		success : function(data) {
			dong = data;
			$.ajax({
				type : "get",
				url : "${root}/score/house?houseno=${deal.no}",
				success : function(data) {
					house = data;
					calculData(dong, house);
				}
			});
		}
	});
}

</script>

<style>
#map_canvas{
	height: 400px;
	width: 100%;	
}

.embed-container {
	position: relative;
	padding-bottom: 15.25%;
	height: 0;
	overflow: hidden;
	max-width: 100%;
}

.embed-container iframe, .embed-container object, .embed-container embed
	{
	position: absolute;
	top: 0;
	left: 0;
	width: 50%;
	height: 50%;
}
</style>



<body>
	<div id="data">
		<input type="hidden" name="dong" id="dong" value="${deal.dong }">
		<input type="hidden" name="no" id="no" value="${deal.no }">
	</div>
	<div class="container" style="margin-top: 100px">
		<img src="${root}/resources/img/${deal.img}"  class="img-thumbnail" style="width: 200px; height : 200px; float:left">
		<div style="float:left; margin-left:50px; margin-top:20px" class="col-8">
			<h5 class="text-primary"><b>${deal.dong } ${deal.aptName }</b></h5>
			<table>
				<tbody>
					<tr>
						<th>건설년도</th>
			  			<th>거래일자</th>
			  			<th>거래가</th>
					</tr>
					<tr>
						<td><p>${deal.buildYear }</p></td>
						<td><p>${deal.dealYear }.${deal.dealMonth }.${deal.dealDay }</p></td>
						<td><p>${deal.dealAmount }</p></td>
					</tr>
					
					<tr>
			  			<th>면적</th>
			  			<th>층</th>
			  			<th>지번</th>
			  		</tr>
			  		<tr>
			  			<td>${deal.area }</td>
			  			<td>${deal.floor }</td>
			  			<td>${deal.jibun }</td>
			  		</tr>
				</tbody>
			</table>
		</div>
		
		<div style="clear : both"></div>
		
		<div style="margin-top:100px">
		<div id="chart" style="width: 900px; height: 500px;"></div>
		<button type="button" class="btn btn-primary" onclick="location.href='${root}/score/evaluation?no=${deal.no }'">평가 작성하기</button>
		<button type="button" class="btn btn-primary" onclick="location.href='${root}/score/main?houseno=${deal.no }&pg=1&order=DATE'">평가 상세보기</button>
		
		<div style="margin-top:100px">
		
		<h2 class="text-info">주변 상권 정보</h2>
		
		<div id="map_canvas" class="embed-container"></div>
		<div id="category_container">
			<select	name = "category" id="category">
				<option value="all">전체</option>
				<option value="food">음식</option>
				<option value="life">생활</option>
				<option value="retail">소매</option>
				<option value="medical">의료</option>
				<option value="education">교육</option>
				<option value="entertain">오락</option>
				<option value="estate">부동산</option>
				<option value="stay">숙박</option>
				<option value="sports">스포츠</option>
			</select>
		</div>
		
		<div id="selected">
			<h4 id="selected_shop_name"></h4>
			<p id="selected_shop_category"></p>
		  	<p id="selected_shop_address"></p>
		  	<p id="selected_shop_floor"></p>
		</div>
		<c:choose>
			<c:when test="${shops.size() ==0 }">
				<h3 class="text-info">상권 정보가 없습니다.</h3>
			
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
	</div>
	
	
	
	
	
</body>
</html>