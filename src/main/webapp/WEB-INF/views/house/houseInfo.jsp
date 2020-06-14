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

<script type="text/javascript">

	google.charts.load('current', {'packages':['bar']});
  	google.charts.setOnLoadCallback(loadData);

	//$(document).ready(function(){
	//	loadData();
	//});
	
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
	
	function calculData(dong, house) {
		var dLength = dong.length;
		
		var dongAvg = {
			transportationConvenience : 0,
			soundProof : 0,
			convenientFacilities : 0,
			lighting : 0,
			scoreAvg : 0
		}
		
		dong.forEach(function(item) {
			dongAvg.transportationConvenience += item.transportationConvenience;
			dongAvg.soundProof += item.soundProof;
			dongAvg.convenientFacilities += item.convenientFacilities;
			dongAvg.lighting += item.lighting;
			dongAvg.scoreAvg += item.scoreAvg;
		});
		
		dongAvg.transportationConvenience = dongAvg.transportationConvenience/dLength;
		dongAvg.soundProof = dongAvg.soundProof/dLength;
		dongAvg.convenientFacilities = dongAvg.convenientFacilities/dLength;
		dongAvg.lighting = dongAvg.lighting/dLength;
		dongAvg.scoreAvg = dongAvg.scoreAvg/dLength;
		
	
		
		///////////////////////////////////////////////////////////////
		var hLength = house.length;
		
		var houseAvg = {
				transportationConvenience : 0,
				soundProof : 0,
				convenientFacilities : 0,
				lighting : 0,
				scoreAvg : 0
			}
			
		house.forEach(function(item) {
			houseAvg.transportationConvenience += item.transportationConvenience;
			houseAvg.soundProof += item.soundProof;
			houseAvg.convenientFacilities += item.convenientFacilities;
			houseAvg.lighting += item.lighting;
			houseAvg.scoreAvg += item.scoreAvg;
		});
			
		houseAvg.transportationConvenience = houseAvg.transportationConvenience/hLength;
		houseAvg.soundProof = houseAvg.soundProof/hLength;
		houseAvg.convenientFacilities = houseAvg.convenientFacilities/hLength;
		houseAvg.lighting = houseAvg.lighting/hLength;
		houseAvg.scoreAvg = houseAvg.scoreAvg/hLength;
		
		//////////////////////////////////////////////
      	
		loadChart(dongAvg, houseAvg);
	}
	
	function loadChart(dongAvg, houseAvg) {
		
		var dongA = dongAvg;
		var houseA = houseAvg;
		var data = new google.visualization.arrayToDataTable([
	          ['기준', '해당 주택 평점', '해당 지역 주택 평균'],
	          ['교통 편의', houseAvg.transportationConvenience, dongAvg.transportationConvenience],
	          ['방음', houseAvg.soundProof, dongAvg.soundProof],
	          ['편의 시설', houseAvg.convenientFacilities, dongAvg.convenientFacilities],
	          ['채광', houseAvg.lighting, dongAvg.lighting],
	          ['평가 평균', houseAvg.scoreAvg, dongAvg.scoreAvg]
	        ]);
		
		console.log(data);
		
		var options = {
		          width: 800,
		          chart: {
		            title: '주민 평가',
		            subtitle: '해당 주택의 점수를 비교하세요'
		          },
		          bars: 'horizontal', // Required for Material Bar Charts.
		          series: {
		            0: { axis: 'score' }, // Bind series 0 to an axis named 'distance'.
		          },
		          axes: {
		            x: {
		              score: {label: '평점'}, // Bottom x-axis.
		            }
		          }
		        };
		
		
		var chart = new google.charts.Bar(document.getElementById('chart'));
	    chart.draw(data, options);
	}
	
</script>



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
	
		<c:choose>
			<c:when test="${shops.size() ==0 }">
				<h3 class="text-info">상권 정보가 없습니다.</h3>
			
			</c:when>
			
			<c:otherwise>
				<c:forEach var="shop" items="${shops}">
				
				<%--
				</br>
				</br>
		  		<table class = "table table-striped table-dark table-bordered">
		  			<tbody align="center">
			  			<tr>
			  				<th>상호명</th>
			  				<th>분류</th>
			  				<th>층 정보</th>
			  			</tr>
			  			
			  			<tr>
			  				<td>${shop.shopName }</td>
			  				<td>${shop.smallCategoryName }</td>
			  				<td>${shop.floorInfo }</td>
			  			</tr>
			  			
			  			<tr>
			  				<th>도로명주소</th>
			  				<th>위도</th>
			  				<th>경도</th>
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
	</div>
	
	
	
	
	
</body>
</html>