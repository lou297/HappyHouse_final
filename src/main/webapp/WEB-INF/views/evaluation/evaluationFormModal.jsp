<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<c:set var="house_scores" value="${house_scores }"></c:set>

<head>
<meta charset="UTF-8">
<title>도서 등록</title>


<script type="text/javascript" src="${root }/resources/js/evaluationForm.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/evaluationForm.css">
<link href="${root}/resources/css/basic.css" rel="stylesheet"
	type="text/css">
	
</head>
<body>
	<div class="modal fade" id="evaluationFormModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header bg-primary text-white">
	        <h5 class="modal-title">평가</h5>
	        <button type="button" class="close " data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      
	      <div class="modal-body">
	      	<table align="center" cellspacing="0" class="table-borderless">

				<form id="frm" name="frm" method="post" action="${root}/score/evaluationForm">
					<tbody>
						<input type="hidden" name="houseNo" id="houseNo" value="${houseno }" />
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
					</tbody>
				</form>
			</table>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <input type="button" value="평가 등록" id="btn1" class="btn btn-primary">
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>