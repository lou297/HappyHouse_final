<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="../header/header.jsp"%>
<%@ include file="../menu/nav.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	function pageMove(pg) { 
		document.getElementById("pg").value=pg;
		requestFilteredHouses();
	}
	
	function requestFilteredHouses() {
		<!--
		var group = document.getElementsByName("group");
		-->
		var g = $("#group").val();
		
		if( $("#dong").val() != "0" )
			location.href="${root}/house/main?group=" + g+"&contents=" + $("#contents").val()+"&pg="+$("#pg").val() +"&dong="+$("#dong").val();
		else
			location.href="${root}/house/main?group=" + g+"&contents=" + $("#contents").val()+"&pg="+$("#pg").val();
		
	}
	
	$(document).ready(function(){
		

		$.get("${root}/select/sido"
			,function(data, status){
				$.each(data, function(index, vo) {
					$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
				});//each
			}//function
			, "json"
		);//get
		
		
		$("#groupall").click(function() {
			if( $("#dong").val() != "0" )
				location.href="${root}/house/main?group=all&contents=" + $("#contents").val()+"&pg="+$("#pg").val() +"&dong="+$("#dong").val();
			else
				location.href="${root}/house/main?group=all&contents=" + $("#contents").val()+"&pg="+$("#pg").val();
		});
		$("#groupapt").click(function() {
			if( $("#dong").val() != "0" )
				location.href="${root}/house/main?group=apt&contents=" + $("#contents").val()+"&pg="+$("#pg").val() +"&dong="+$("#dong").val();
			else
				location.href="${root}/house/main?group=apt&contents=" + $("#contents").val()+"&pg="+$("#pg").val();
		});
		$("#grouphouse").click(function() {
			if( $("#dong").val() != "0" )
				location.href="${root}/house/main?group=house&contents=" + $("#contents").val()+"&pg="+$("#pg").val() +"&dong="+$("#dong").val();
			else
				location.href="${root}/house/main?group=house&contents=" + $("#contents").val()+"&pg="+$("#pg").val();
				
		});
		
	});//ready
	$(document).ready(function(){
		$("#sido").change(function() {
			$.get("${root}/select/gugun"
					,{sido:$("#sido").val()}
					,function(data, status){
						$("#gugun").empty();
						$("#gugun").append('<option value="0">구군</option>');
						$.each(data, function(index, vo) {
							$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
						});//each
					}//function
					, "json"
			);//get
		});//change
		$("#gugun").change(function() {
			$.get("${root}/select/dong"
					,{gugun:$("#gugun").val()}
					,function(data, status){
						$("#dong").empty();
						$("#dong").append('<option value="0">동</option>');
						$.each(data, function(index, vo) {
							$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
						});//each
					}//function
					, "json"
			);//get
		});//change
		
		$("#dong").change(function() {
			var group = document.getElementsByName("group");
			var g;
			
			for(var i=0;i<group.length;i++){
				if(group[i].checked==true){
					g = group[i].value;
				}
			}
			
			requestFilteredHouses();
		});
		
		<!--
		$("#dong").change(function() {
			$.get("${root}/select/apt"
					,{dong:$("#dong").val()}
					,function(data, status){
						$("#searchResult").empty();
						$.each(data, function(index, vo) {
							let str = "<div class='justify-content-center border-bottom' align='left' style='margin-top:20px'>"
							+ "<a href='${root}/house.do?act=house_info&no=" + vo.no +"'  style='font-size:20px'><b>"+vo.aptName+"</b></a>"
							+ "<p>거래금액 : "+vo.dealAmount+"만원</p>"
							+ "<p>면적 : "+vo.area+"</p>"
							+ "<p>"+vo.dealYear+"."+vo.dealMonth+"."+vo.dealDay+"</p>"
							+ "</div>";
							
							//<div class="justify-content-center border-bottom" align="left" style="margin-top:20px">
							//<a href="${root}/house.do?act=house_info&no=${deal.no}"  style="font-size:20px"><b>${deal.aptName }</b></a>
							//<p>거래금액 : ${deal.dealAmount }만원</p>
							//<p>면적 : ${deal.area }</p>
							//<p>${deal.dealYear }.${deal.dealMonth }.${deal.dealDay }</p>
							//</div>
							$("#searchResult").append(str);
						});//each
					}//function
					, "json"
			);//get
		});//change
		
		 -->
		
		
	});//ready

</script>


<body>
	<div class="container">

		<div class="col-lg-12" style="margin-top : 100px">
		
			<div align="center">
				<h2>거래 목록</h2>
				
				<div style="margin-top: 50px">
					<select id="sido">
						<option value="0">시</option>
					</select>
					<select id="gugun">
						<option value="0">구군</option>
					</select>
					<select id="dong">
						<option value="0">동</option>
					</select>
				</div>
				
				<input type="hidden" name="pg" id="pg" value="1"> 
				<input type="hidden" name="group" id="group" value="${group }">
				<div class="form-group input-group col-6">
						<input type="text" class="form-control" id="contents" name="contents"
							placeholder="" value="${search}">
						<div class="input-group-append">
							<button type="button" class="btn btn-primary" onclick="javascript:requestFilteredHouses();">검색</button>
						</div>
					</div>
				
			</div>
			
			
			
			
			<div>
				<button type="button" class="btn btn-primary btn-sm" id="groupall">전체</button>
				<button type="button" class="btn btn-primary btn-sm" id="groupapt">아파트</button>
				<button type="button" class="btn btn-primary btn-sm" id="grouphouse">주택</button>
			</div>


			<div id="searchResult">
				<c:if test="${total ne null}">
					<p style = "color: red; font-size : 22px; margin-bottom : 0px">total : ${total }</p>
				</c:if>
			
				<c:forEach var="deal" items="${dealList}">
				
					<div class="justify-content-center border-top list_form" align="left" style="margin-top:20px">
						<a href="${root}/house/detail?no=${deal.no}"  style="font-size:20px"><b>${deal.aptName }</b></a>
						<p>거래금액 : ${deal.dealAmount }만원</p>
						<p>면적 : ${deal.area }</p>
						<p>${deal.dealYear }.${deal.dealMonth }.${deal.dealDay }</p>
					</div>
	
	
				</c:forEach>
			 </div>


			${navigation.navigator}


		</div>
	</div>
</body>
</html>