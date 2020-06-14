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
<link href="${root}/resources/css/basic.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	window.onload = function() {
		var btn = document.getElementById("btn1");
		btn.addEventListener('click', function() {
			var frm = document.getElementById("frm");
			frm.submit();
		})
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
</script>
</head>
<body>
	<table align="center" cellspacing="0">
		<thead>
			<tr class="top">
			</tr>
			<tr>
				<td colspan="2" class="caption">평가 화면</td>
			</tr>
			<tr>
				<td colspan="2" class="bpadding">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" class="tbasic tspacial">&nbsp;</td>
			</tr>
		</thead>
		<form id="frm" name="frm" method="post" action="${root}/score/evaluationForm">
			<tbody>
				<input type="hidden" name="houseNo" value="${houseno }" />
				<input type="hidden" name="dong" value="" />
				<input type="hidden" name="aptName" value="" />
		
				<tr>
					<td class="tbasic">교통편의</td>
					<td class="tbasic">
					<input type="text" size="40"
						id="transportationConvenience" name="transportationConvenience" /></td>
				</tr>
				<tr>
					<td class="tbasic">방음</td>
					<td class="tbasic"><input type="text" size="40"
						id="soundProof" name="soundProof" /></td>
				</tr>
				<tr>
					<td class="tbasic">편의 시설</td>
					<td class="tbasic"><input type="text" size="40"
						id="convenientFacilities" name="convenientFacilities" /></td>
				</tr>
				<tr>
					<td class="tbasic">채광</td>
					<td class="tbasic"><input type="text" size="40" id="lighting"
						name="lighting" /></td>
				</tr>
				<tr>
					<td class="tbasic">총점</td>
					<td class="tbasic"><input type="text" size="40" id="scoreAvg"
						name="scoreAvg" /></td>
				</tr>
				<tr>
					<td class="tbasic">코멘트</td>
					<td class="tbasic"><textarea rows="3" cols="42"
							id="comment" name="comment"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="bpadding">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="tspacial tfoot">

						<button type="button" onclick="javascript:returnPage();">돌아가기</button>
						<input type="button" value="평가 등록" id="btn1"> <input
						type="reset" value="취소">
					</td>
				</tr>
			</tbody>
		</form>
	</table>
</body>
</html>
