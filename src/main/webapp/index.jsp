<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!-- BootStrap search-->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<link rel="stylesheet" type="text/css" href="${root }/resources/css/index.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<%@ include file="WEB-INF/views/header/header.jsp"%>
<%@ include file="WEB-INF/views/menu/nav.jsp"%>


<script>
	$(document).ready(function() {
		$('#myCarousel').carousel({
			interval : 10000
		})
	});

	function pageMove_search() {
		var word = document.getElementById("search_word").value;
		location.href = "${root}/house/main?pg=1&group=all&contents=" + word;
	}
</script>

<body>
	<div align="center">

		<c:set var="root" value="${pageContext.request.contextPath }" />

		<div style="padding: 30px" id="title_area">
			<p
				style="font-size: 26px; font-family: sans-serif; font-weight: lighter; margin: 20px">
				<span class="text-primary font-weight-bold">어떤 동네, 어떤 집</span>에서 <br>살고 싶으신가요?
			</p>


			<!-- search -->
			<link rel="stylesheet"
				href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
				integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
				crossorigin="anonymous">
			<div class="search-container">
				<br />
				
				<div class="row justify-content-center">
						<div class="input-group col-10 col-md-8 col-lg-6">
							<input type="search" class="form-control dropdown-toggle" placeholder="정보 찾기" id="search_word" name="search_word">
							<span class="mdi mdi-magnify search-icon"></span>
							<div class="input-group-append">
								<button class="btn btn-primary" type="button" onclick="javascript:pageMove_search();">검색</button>
							</div>
						</div>
					</div>
			</div>

		</div>

		

		<!-- thumbnail -->
		<div>
			<div class="row min-vh-50 align-items-center"
				style="margin: 25px; max-width: 50%">
				<div class="col-lg-8 offset-lg-2" id="slider">
					<div id="myCarousel" class="carousel slide shadow-sm">
						<!-- main slider carousel items -->
						<div class="carousel-inner">
							<div class="active carousel-item" data-slide-number="0">
								<a
									href="${root}/score/main?contents=&order=TRANS&pg=1">
									<img src="${root}/resources/img/trans.jpg" class="img-fluid">
								</a>
								<p class="text-primary">접근성</p>
							</div>
							<div class="carousel-item" data-slide-number="1">
								<a href="${root}/score/main?contents=&order=SOUNDPROOT&pg=1">
									<img src="${root}/resources/img/sound.png" class="img-fluid">
								</a>
								<p class="text-primary">방음</p>
							</div>
							<div class="carousel-item" data-slide-number="2">
								<a href="${root}/score/main?contents=&order=FACILITY&pg=1">
									<img src="${root}/resources/img/facility.jpg" class="img-fluid">
								</a>
								<p class="text-primary">편의시설</p>
							</div>
							<div class="carousel-item" data-slide-number="3">
								<a href="${root}/score/main?contents=&order=LIGHTING&pg=1">
									<img src="${root}/resources/img/light.jpg" class="img-fluid">
								</a>
								<p class="text-primary">채광</p>
							</div>
							<div class="carousel-item" data-slide-number="4">
								<a href="${root}/score/main?contents=&order=AVG&pg=1"> <img
									src="${root}/resources/img/avg.png" class="img-fluid"></a>
								<p class="text-primary">평점</p>
							</div>


							<a class="carousel-control-prev" href="#myCarousel" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>

						</div>
						<!-- main slider carousel nav controls -->

						<ul class="carousel-indicators list-inline mx-auto border px-2">
							<li class="list-inline-item active"><a
								id="carousel-selector-0" class="selected" data-slide-to="0"
								data-target="#myCarousel"> <img
									src="${root}/resources/img/trans.jpg" class="img-fluid_list">
							</a></li>
							<li class="list-inline-item"><a id="carousel-selector-1"
								data-slide-to="1" data-target="#myCarousel"> <img
									src="${root}/resources/img/sound.png" class="img-fluid_list">
							</a></li>
							<li class="list-inline-item"><a id="carousel-selector-2"
								data-slide-to="2" data-target="#myCarousel"> <img
									src="${root}/resources/img/facility.jpg" class="img-fluid_list">
							</a></li>
							<li class="list-inline-item"><a id="carousel-selector-3"
								data-slide-to="3" data-target="#myCarousel"> <img
									src="${root}/resources/img/light.jpg" class="img-fluid_list">
							</a></li>
							<li class="list-inline-item"><a id="carousel-selector-4"
								data-slide-to="4" data-target="#myCarousel"> <img
									src="${root}/resources/img/avg.png" class="img-fluid_list">
							</a></li>
						</ul>
					</div>
				</div>

			</div>
			<!--/main slider carousel-->
		</div>

		<!-- dialogflow -->
		<iframe
		    allow="microphone;"
		    width="350"
		    height="430"
		    src="https://console.dialogflow.com/api-client/demo/embedded/c61d6723-8bf7-46d4-b3ac-1d1d39ea26bb">
		</iframe>

		<!-- footer -->
		<footer>
			<div>
				<h6>Find Us</h6>
				<hr width="40%">
				<ul style="padding: 0; margin-left: -10px">
					<li>만든이 : 김민건, 이정훈</li>
					<li>HappyHouse_Final project</li>
					<li>Completion date : 2020-06-12</li>
				</ul>
			</div>
		</footer>
	</div>
</body>
</html>