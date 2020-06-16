<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header/header.jsp"%>
<%@ include file="../menu/nav.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${root }/resources/css/evaluationList.css">

<script type="text/javascript">
	function pageMove(pg) { 
		$("#pg").value=pg;
		requestFilteredScores();
	}

	function requestFilteredScores() {
		var group = document.getElementsByName("group");
		
		
		if( $("#houseno").val() != -1 )
			location.href="${root}/score/main?houseno=" + $("#houseno").val()+"&order=" +$("#order").val() + "&pg="+$("#pg").val();
		else
			location.href="${root}/score/main?contents=" + $("#contents").val() +"&order=" +$("#order").val() +"&pg="+$("#pg").val();

	}
	
	$(document).ready(function(){
		$("#select_order").change(function() {
			var selected = $("#select_order").val();
			$("#order").val(selected);
			
			requestFilteredScores();
			
		})
	});
</script>
<<style>
.text-body1{
	top: 0;
	
}

.text-body2{
	display: inline-block;
}

</style>

<body>

	<div class="container" align="center">
		<div class="col-lg-12" style="margin-top : 100px">
			<div id="title_area"">
				<h2 style="vertical-align : middle">평가 목록</h2>
			</div>
			<div id="data">
				<input type="hidden" name="order" id="order" value= "DATE">
				<input type="hidden" name="houseno" id="houseno" value=-1>
				<input type="hidden" name="pg" id="pg" value="1">
				<input type="hidden" name="search" id="search" value="0">
			</div>
			
			
			<!-- 정렬 선택 -->
			<select id="select_order" style="margin-top:50px">
				<option value="DATE" <c:if test="${order eq 'DATE'}">selected="selected"</c:if> >최신 순</option>
				<option value="AVG" <c:if test="${order eq 'AVG'}">selected="selected"</c:if> >통합 평균 순</option>
				<option value="TRANS" <c:if test="${order eq 'TRANS'}">selected="selected"</c:if> >교통 편의 순</option>
				<option value="SOUNDPROOT" <c:if test="${order eq 'SOUNDPROOT'}">selected="selected"</c:if> >방음 순</option>
				<option value="FACILITY" <c:if test="${order eq 'FACILITY'}">selected="selected"</c:if> >편의시설 순</option>
				<option value="LIGHTING" <c:if test="${order eq 'LIGHTING'}">selected="selected"</c:if> >채광 순</option>
			</select>
			
			
			<!-- 검색 창 -->
			<div class="form-group input-group col-6" align="left">
				<input type="text" class="form-control" id="contents" name="contents"
					placeholder="" value="${contents}">
				<div class="input-group-append">
					<button type="button" class="btn btn-primary" onclick="javascript:requestFilteredScores();">검색</button>
				</div>
			</div>

			
			
			<!-- 본문 -->
			<div id="searchResult">
				<c:if test="${total ne null}">
					<p style = "color: red; font-size : 22px;" align="left">total : ${total }</p>
				</c:if>
					
				<c:forEach var="score" items="${scores}">
						
					<div class="justify-content-center border-bottom" align="left" style="margin-top:20px">
						<div class="text-body1">
							<h6 class="text-danger">${score.dong }</h6>
							<a href="${root }/house/detail?no=${score.houseNo}" style="font-size:20px">${score.aptName }</a> 
							<div style="padding: 10px">
								<p id="comment">${score.comment }</p>
							</div>
						</div>
						<div class="text-body2">
							<p>
								<span class="text-info">교통 편의 : </span>
								<c:forEach var = "item" begin="1" end="5">
									<c:if test="${item <= score.transportationConvenience }">
										<span class="starR on">별</span>
									</c:if>
									<c:if test="${item > score.transportationConvenience }">
										<span class="starR">별</span>
									</c:if>
								</c:forEach>
								<span class="text-warning">${score.transportationConvenience}점</span>
								
							</p>
							<p>
								<span class="text-info">방음 : </span>
							
								<c:forEach var = "item" begin="1" end="5">
									<c:if test="${item <= score.soundProof }">
										<span class="starR on">별</span>
									</c:if>
									<c:if test="${item > score.soundProof }">
										<span class="starR">별</span>
									</c:if>
								</c:forEach>
								<span class="text-warning">${score.soundProof }점</span>
							</p>
							<p>
								<span class="text-info">편의 시설 : </span>
							
								<c:forEach var = "item" begin="1" end="5">
									<c:if test="${item <= score.convenientFacilities }">
										<span class="starR on">별</span>
									</c:if>
									<c:if test="${item > score.convenientFacilities }">
										<span class="starR">별</span>
									</c:if>
								</c:forEach>
								<span class="text-warning">${score.convenientFacilities }점</span>
							</p>
							<p>
								<span class="text-info">채광 : </span>
								<c:forEach var = "item" begin="1" end="5">
									<c:if test="${item <= score.lighting }">
										<span class="starR on">별</span>
									</c:if>
									<c:if test="${item > score.lighting }">
										<span class="starR">별</span>
									</c:if>
								</c:forEach>
								<span class="text-warning">${score.lighting }점</span>
							</p>
							<p>
								<span class="text-info">총점 : </span> 
								<c:forEach var = "item" begin="1" end="5">
									<c:if test="${item <= score.scoreAvg }">
										<span class="starR on">별</span>
									</c:if>
									<c:if test="${item > score.scoreAvg }">
										<span class="starR">별</span>
									</c:if>
								</c:forEach>
								<span class="text-warning">${score.scoreAvg }점</span>
							</p>
						</div>	
					</div>
			
			
				</c:forEach>
			</div>
		
		
			${navigation.navigator}
		</div>
	</div>
	
</body>
</html>