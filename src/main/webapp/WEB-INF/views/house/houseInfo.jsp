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


<!-- charts.js -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<script type="text/javascript" src="${root }/resources/js/charts.js"></script>

<link rel="stylesheet" type="text/css" href="${root }/resources/css/houseinfo.css">
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



<body>
	<div id="data">
		<input type="hidden" name="dong" id="dong" value="${deal.dong }">
		<input type="hidden" name="no" id="no" value="${deal.no }">
	</div>
	<div class="container">
		<div id="house_info_area">
			<img src="${root}/resources/img/${deal.img}"  class="img-thumbnail" style="width: 350px; height : 300px; float:left">
			<div style="float:left; margin-left:50px; margin-top:20px" class="col-6">
				<p class="text-danger">${deal.dong }</p>
				<h3>${deal.aptName }</h3>
				<p class="house_info_p"><span>거래일자: </span>${deal.dealYear }<span>년 </span>${deal.dealMonth }<span>월 </span>${deal.dealDay }<span>일</span></p>
				<p class="house_info_p"><span>거래액: </span>${deal.dealAmount }<span> 만원</span></p>
				<p class="house_info_p"><span>면적: </span>${deal.area }<span> m2</span></p>
				<!-- 
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
				
				 -->
			</div>
			
			<div style="clear : both"></div>
		</div>
		
		
		<div id="chart_title">
			<span class="text-primary title_p">사용자 평가</span>
			<button type="button" class="btn  btn-light eval_btn"" data-toggle="modal" data-target="#evaluationFormModal">평가 작성하기</button>
			<button type="button" class="btn  btn-light eval_btn" onclick="location.href='${root}/score/main?houseno=${deal.no }&pg=1&order=DATE'">평가 상세보기</button>
		</div>
		
		<!-- 
		<div id="chart" style="width: 900px; height: 500px;"></div>
		 -->
		 <div id="chart_container">
		 	<div class="chart">
		 		<canvas id="myChart1" width="220px" height="250px" style="float : left"></canvas>
		 		<p>교통 편의</p>
		 	</div>
		 	<div class="chart">
				<canvas id="myChart2" width="220px" height="250px" style="float : left"></canvas>
		 		<p>방음</p>
		 	</div>
		 	<div class="chart">
		 		<canvas id="myChart3" width="220px" height="250px" style="float : left"></canvas>
		 		<p>편의 시설</p>
		 	</div>
		 	<div class="chart">
		 		<canvas id="myChart4" width="220px" height="250px" style="float : left"></canvas>
		 		<p>채광</p>
		 	</div>
		 	<div class="chart">
		 		<canvas id="myChart5" width="220px" height="250px" style="float : left"></canvas>
		 		<p>평가 평균</p>
		 	</div>
			
		 </div>
		
		<!-- 
		<div style="height: 200px; display: table-cell; vertical-align: middle;">
			<button type="button" class="btn btn-primary" style="margin:auto auto;" data-toggle="modal" data-target="#evaluationFormModal">평가 작성하기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='${root}/score/main?houseno=${deal.no }&pg=1&order=DATE'">평가 상세보기</button>
		</div>
		 
		<div style="height: 200px; position: relative;">
			<div style="position: absolute; right: 0px; bottom : 0px;">
				<button type="button" class="btn btn-primary" style="margin:auto auto;" data-toggle="modal" data-target="#evaluationFormModal">평가 작성하기</button>
				<button type="button" class="btn btn-primary" onclick="location.href='${root}/score/main?houseno=${deal.no }&pg=1&order=DATE'">평가 상세보기</button>
			</div>
			
		</div>
		-->
		
		<p class="text-primary title_p">주변 상권 정보</p>
		<div id="category_container">
			<select	name = "category" id="category" class="custom-select custom-select-sm col-1">
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
		<div id="map_canvas" class="embed-container"></div>
		<div>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/food.png">
			<span>음식</span>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/life.png">
			<span>생활</span>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/sales.png">
			<span>소매</span>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/medical.png">
			<span>의료</span>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/education.png">
			<span>교육</span>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/game.png">
			<span>오락</span>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/estate.png">
			<span>부동산</span>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/sleep.png">
			<span>숙박</span>
			<img src=  "http://localhost:7070/happyhouse/resources/icon/sports.png">
			<span>스포츠</span>
		</div>
		
		<div id="selected">
			<p>상호명 : <span id="selected_shop_name"></span></p>
			<p>분류 : <span id="selected_shop_category"></span></p>
			<p>도로명주소 : <span id="selected_shop_address"></span></p>
			
		</div>
		
		<!-- 
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
		 -->
	</div>
	
	<%@ include file="../evaluation/evaluationFormModal.jsp" %>
	
	
	
</body>
</html>