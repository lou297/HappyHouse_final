<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- BootStrap search-->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%@ include file="WEB-INF/views/header/header.jsp"%>
<%@ include file="WEB-INF/views/menu/nav.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

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


<style>

/* search  */
.form-control-borderless {
	border: none;
}

.form-control-borderless:hover, .form-control-borderless:active,
	.form-control-borderless:focus {
	border: none;
	outline: none;
	box-shadow: none;
}

/* thumbnail */
#myCarousel .list-inline {
	white-space: nowrap;
	overflow-x: auto;
}

#myCarousel .carousel-indicators {
	position: static;
	left: initial;
	width: initial;
	margin-left: initial;
}

#myCarousel .carousel-indicators>li {
	width: initial;
	height: initial;
	text-indent: initial;
}

#myCarousel .carousel-indicators>li.active img {
	opacity: 0.7;
}

.search-container {
	max-width: 50%;
}

.img-fluid {
	padding-top: 10px;
	max-width: 300px;
}

.img-fluid_list {
	max-width: 100px;
}

.embed-container {
	position: relative;
	padding-bottom: 9.25%;
	height: 0;
	overflow: hidden;
	max-width: 50%;
}

.embed-container iframe, .embed-container object, .embed-container embed
	{
	position: absolute;
	top: 0;
	left: 0;
	width: 50%;
	height: 50%;
}

.imgContent {
	padding: 5px;
}

ul {
	list-style: none;
}
</style>

<body>
	<div align="center">

		<c:set var="root" value="${pageContext.request.contextPath }" />

		<div style="padding: 20px">
			<p
				style="font-size: 26px; font-family: sans-serif; font-weight: lighter; margin: 20px">
				<span style="color: blue;">어떤 동네, 어떤 집</span>에서 <br>살고 싶으신가요?
			</p>


			<!-- search -->
			<link rel="stylesheet"
				href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
				integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
				crossorigin="anonymous">
			<div class="search-container">
				<br />
				<div class="row justify-content-center">
					<div class="col-10 col-md-8 col-lg-6">
						<form class="card card-sm">
							<div class="card-body row no-gutters align-items-center">
								<div class="col-auto">
									<i class="fas fa-search h4 text-body"></i>
								</div>
								<!--end of col-->
								<div class="col">
									<input
										class="form-control form-control-lg form-control-borderless"
										type="search" id="search_word" name="search_word"
										placeholder="방찾기">
								</div>
								<!--end of col-->
								<div class="col-auto">
									<button type="button" class="btn btn-lg btn-success"
										onclick="javascript:pageMove_search();">Search</button>
								</div>
								<!--end of col-->
							</div>
						</form>
					</div>
					<!--end of col-->
				</div>
			</div>

		</div>

		<div style="padding: 20px; padding-bottom: 0px">
			<p
				style="text-align: center; font-family: sans-serif; font-weight: border; font-size: 20px;">
				초간단 솔루션!</p>
		</div>

		<!-- thumbnail -->
		<div>
			<div class="row min-vh-50 align-items-center"
				style="margin: 25px; max-width: 50%">
				<div class="col-lg-8 offset-lg-2" id="slider">
					<div id="myCarousel" class="carousel slide shadow">
						<!-- main slider carousel items -->
						<div class="carousel-inner">
							<div class="active carousel-item" data-slide-number="0">
								<a
									href="${root}/recommend/score/main?contents=&order=TRANS&pg=1">
									<img src="${root}/resources/img/trans.jpg" class="img-fluid">
								</a>
								<p>접근성</p>
							</div>
							<div class="carousel-item" data-slide-number="1">
								<a href="${root}/score/main?contents=&order=SOUNDPROOT&pg=1">
									<img src="${root}/resources/img/sound.png" class="img-fluid">
								</a>
								<p>방음</p>
							</div>
							<div class="carousel-item" data-slide-number="2">
								<a href="${root}/score/main?contents=&order=FACILITY&pg=1">
									<img src="${root}/resources/img/facility.jpg" class="img-fluid">
								</a>
								<p>편의시설</p>
							</div>
							<div class="carousel-item" data-slide-number="3">
								<a href="${root}/score/main?contents=&order=LIGHTING&pg=1">
									<img src="${root}/resources/img/light.jpg" class="img-fluid">
								</a>
								<p>채광</p>
							</div>
							<div class="carousel-item" data-slide-number="4">
								<a href="${root}/score/main?contents=&order=AVG&pg=1"> <img
									src="${root}/resources/img/avg.png" class="img-fluid"></a>
								<p>평점</p>
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

		<div>
			<iframe allow="microphone;" width="350" height="430"
				src="https://console.dialogflow.com/api-client/demo/embedded/24a624f5-3656-46df-adbd-59d0eb5aade4">
			</iframe>

		</div>


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