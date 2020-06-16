<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var='root' value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html>

<%@ include file="../header/header.jsp"%>
<%@ include file="../menu/nav.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<c:set var="house_scores" value="${house_scores }"></c:set>

<head>
<meta charset="UTF-8">
<title>도서 등록</title>


<script type="text/javascript" src="${root }/resources/js/evaluationForm.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/evaluationForm.css">
<link href="${root}/resources/css/basic.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	
/*
	window.onload = function() {
		var btn = document.getElementById("btn1");
		btn.addEventListener('click', function() {
			var frm = document.getElementById("frm");
			frm.submit();
		})
		
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  return false;
			});
	}

	function getParam(sname) {
		var params = location.search.substr(location.search.indexOf("?") + 1);
		var sval = "";
		params = params.split("&");
		for (var i = 0; i < params.length; i++) {
			temp = params[i].split("=");
			if ([ temp[0] ] == sname) {
				sval = temp[1];
			}
		}
		return sval;
	}

	function returnPage() {
		var no = getParam("no");
		location.href = "${root}/house/detail?no=" + no;
	}
	*/
</script>

</head>
<body>
	<table align="center" cellspacing="0" class="table-borderless" style="margin-top : 150px">
		<thead>
			<tr class="top">
			</tr>
			<tr>
				<td colspan="2" class="caption bg-primary text-white"><p>평가 화면</p></td>
			</tr>
			<tr>
				<td colspan="2" class="bpadding">&nbsp;</td>
			</tr>
		</thead>
		<form id="frm" name="frm" method="post" action="${root}/score/evaluationForm">
			<tbody>
				<input type="hidden" name="houseNo" value="${houseno }" />
				<input type="hidden" name="dong" value="" />
				<input type="hidden" name="aptName" value="" />
		
				<tr>
					<td class="tbasic"><p>교통편의</p></td>
					<td class="tbasic">
						<div class="starRevT">
						  <span class="starR on">별1</span>
						  <span class="starR">별2</span>
						  <span class="starR">별3</span>
						  <span class="starR">별4</span>
						  <span class="starR">별5</span>
	  					</div>
					<input type="hidden"
						id="transportationConvenience" name="transportationConvenience" value="1"/></td>
				</tr>
				<tr>
					<td class="tbasic"><p>방음</p></td>
					<td class="tbasic">
						<div class="starRevS">
						  <span class="starR on">별1</span>
						  <span class="starR">별2</span>
						  <span class="starR">별3</span>
						  <span class="starR">별4</span>
						  <span class="starR">별5</span>
	  					</div>
					<input type="hidden"
						id="soundProof" name="soundProof" value="1"/></td>
				</tr>
				<tr>
					<td class="tbasic"><p>편의 시설</p></td>
					<td class="tbasic">
						<div class="starRevC">
						  <span class="starR on">별1</span>
						  <span class="starR">별2</span>
						  <span class="starR">별3</span>
						  <span class="starR">별4</span>
						  <span class="starR">별5</span>
	  					</div>
					<input type="hidden" size="40"
						id="convenientFacilities" name="convenientFacilities" value="1"/></td>
				</tr>
				<tr>
					<td class="tbasic"><p>채광</p></td>
					<td class="tbasic">
						<div class="starRevL">
						  <span class="starR on">별1</span>
						  <span class="starR">별2</span>
						  <span class="starR">별3</span>
						  <span class="starR">별4</span>
						  <span class="starR">별5</span>
	  					</div>
					<input type="hidden" size="40" id="lighting"
						name="lighting" value="1"/></td>
				</tr>
				<tr>
					<td class="tbasic"><p>총점</p></td>
					<td class="tbasic"><input type=text size="40" id="scoreAvg"
						name="scoreAvg" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="tbasic"><p>코멘트</p></td>
					<td class="tbasic"><textarea rows="3" cols="42"
							id="comment" name="comment"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="bpadding">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center" class=" tfoot">

						<button type="button" onclick="javascript:returnPage();" class="btn btn-primary">돌아가기</button>
						<input type="button" value="평가 등록" id="btn1" class="btn btn-primary"> <input
						type="reset" value="취소" class="btn btn-primary">
					</td>
				</tr>
			</tbody>
		</form>
	</table>
</body>
</html>
