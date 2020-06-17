<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="../header/header.jsp"%>
<%@ include file="../menu/nav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">

	
	function search() {
		var search = $("#search").val();
		
		console.log(search);
		if(search.length > 0 ){
			location.href="${root}/recommend/info?category=" + $("#category").val()+"&search=" + search;
		}
	}
	
	function requestFilteredHouses() {
		<!--
		var group = document.getElementsByName("group");
		-->
		var g = $("#group").val();
		
		if( $("#dong").val() != "0" )
			location.href="${root}/house/tradeHubBaseSearch?group=" + g+"&contents=" + $("#contents").val()+"&pg="+$("#pg").val() +"&dong="+$("#dong").val();
		else
			location.href="${root}/house/tradeHubBaseSearch?group=" + g+"&contents=" + $("#contents").val()+"&pg="+$("#pg").val();
		
	}


</script>


<body>
	<div class="container">

		<div class="col-lg-12" style="margin-top : 100px">
		
			<div align="center">
				<h2>상권 접근성</h2>

				<div class="col-8">
					<select	id="category" class="custom-select col-2" style="float : left">
						<option value="전체" <c:if test="${category eq '전체'}">selected="selected"</c:if>>전체</option>
						<option value="음식" <c:if test="${category eq '음식'}">selected="selected"</c:if>>음식</option>
						<option value="생활서비스" <c:if test="${category eq '생활서비스'}">selected="selected"</c:if>>생활서비스</option>
						<option value="소매" <c:if test="${category eq '소매'}">selected="selected"</c:if>>소매</option>
						<option value="의료" <c:if test="${category eq '의료'}">selected="selected"</c:if>>의료</option>
						<option value="학문/교육" <c:if test="${category eq '학문/교육'}">selected="selected"</c:if>>학문/교육</option>
						<option value="관광/여가/오락" <c:if test="${category eq '관광/여가/오락'}">selected="selected"</c:if>>관광/여가/오락</option>
						<option value="부동산" <c:if test="${category eq '부동산'}">selected="selected"</c:if>>부동산</option>
						<option value="숙박" <c:if test="${category eq '숙박'}">selected="selected"</c:if>>숙박</option>
					</select>
					
					<div id="search_container" class="form-group input-group col-9" style="float : left">
						<input type="text" class="form-control" id="search" name="search"
							placeholder="" value="${search}">
						<div class="input-group-append">
							<button type="button" class="btn btn-primary" onclick="javascript:search();">검색</button>
						</div>
					</div>
					<div style="clear : both"></div>
					<c:if test="${recommends eq null}">
						<p style = "color: red; font-size : 22px; margin-bottom : 0px">지역과 카테고리를 입력해주세요.</p>
					</c:if>
				</div>
				

				
			


			<div id="searchResult" style="margin-top : 50px">
				
				
				<c:if test="${cnt ne null}">
					<p style = "font-size : 18px;" align="left"><span style = "color: red;">${search}의 (${category }) 상권 ${cnt }개에 대한 접근성 순위</span><span>  점수 : 100 - (해당 아파트의 상권 거리 / 상권 거리가 가장 먼 아파트의 상권 거리) * 100</span></p>
				</c:if>
				<c:forEach var="recommend" items="${recommends}" varStatus="status">
					
					<div class="justify-content-center border-bottom list_form" align="left" style="margin-top:20px">
						<p style="font-size : 20px; padding-left : 50px;">
							<span style="display:inline-block; width : 500px">
								<span style="display:inline-block; width : 150px">${status.count }. ${recommend.dong}</span> 
								<a href="${root}/house/detail?no=${recommend.houseNo}"  style="font-size:20px">${recommend.aptName }</a>
							</span>
							<span>${recommend.recommendPoint }점</span>
							
						</p>
						
					</div>
	
				</c:forEach>
			 </div>



		</div>
	</div>
</body>
</html>