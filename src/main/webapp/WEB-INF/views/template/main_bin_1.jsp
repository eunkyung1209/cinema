<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/resources/sample/css/sample.css"> -->
<style type="text/css">
body{
	background-color: black;
 	margin: 0;
    padding: 0;
}
/* .mainBigPicture_j{
	position: relative;
	background-size: cover;
	background-position: center;
	height: 684px;
	
} */
.b{
	margin-top : 250px;
	margin-bottom : 200px;
	border-bottom: solid 5px white;
	opacity:0.2;
}
.c{
	text-align: center;
}
.subMain{
	padding-left: 60px;
}
.subMainTable{
	margin: 0 auto;
}
.subMenuTd_j{
	padding-left: 20px;
	padding-right: 20px;
}
.card{
	width: 13rem;
	background-color: black;
	color: white;
}

.card-body{
	text-align: center;
	padding: 1.2rem 1rem;
}
.card-title{
	font-size: 14px;
	font-weight: bold;
}
.card-text{
	font-size: 11.5px;
	font-weight: bold;
}
.number{
	padding: none;
	background-color: white;
	color:red;
	font-size: 40px;
	text-align: center;
	position: absolute;
	top: 2%;
	left: 2%;
}
.subToday_j{
	color: white;
	text-align: right;
	font-size: 15px;
	padding-bottom: 14px;
}
.subToday_time_j{
	width: 25px;
	height: 25px;
}
.subToday_score_j{
	width: 17px;
	height: 17px;
}

/* ---------------------- */

.itemBannerTitle {
	display: table;
	margin: 1rem auto;
	border-bottom: 1px solid black
}
a img {
}
.mainBannerSwiper {
	z-index: 3;
}
.sideBannerGrid {
	margin: 0 auto;
	width: 100%;
}
.sideBannerDiv {
	margin: 0;
	width: 100%;
}

</style>
</head>
<body>


<div>

<!-- Swiper -->
			<div class="swiper mainBannerSwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><a><img src="/resources/images/main/메인사진.jpg" width="50%;"></img></a></div>
					<div class="swiper-slide"><a><img src="/resources/images/main/로고.png" width="50%;"></img></a></div>
			      
				</div>
				<div class="swiper-button-next" style="background-color: yellow;">  1</div>
				<div class="swiper-button-prev"> 2</div>
				<div class="swiper-pagination"> 3</div>
			</div>
			
	<div class="row">
		<div class="col-12">
			<!-- Swiper -->
			<!-- <div class="itemBannerTitle">
				NEW ITEM
			</div> -->
			<div class="swiper itemSwiper">
				<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="/resources/images/main/메인사진.jpg"></img>
							<img src="/resources/images/main/로고.png"></img>
						</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>
			
			<div style="color: gray; font-size: 20px;"> gggggggggg</div>

<!-- <div>
  <div class="d"></div>
</div> -->
  	
  <div>
	  	<table class="subMainTable">
	  		<tr>
	  			<td colspan="5" class="subToday_j">
	  			 <img src="/resources/images/main/메인서브-시계.png" class="subToday_time_j">
	  				10.17 15:28 기준
	  			</td>
	  		</tr>
	  		<tr>
	  			<td class="subMenuTd_j">
		  			<div class="card">
						 <a href="#"><img src="/resources/images/main/메인서브-01.png" class="card-img-top" alt="..."></a>
						 <div class="card-body">
						 	 <div class="number">1</div>
							 <h5 class="card-title">영화제목</h5>
							 <p class="card-text">
							  	예매율 34% &nbsp;|&nbsp; 
							  	<img src="/resources/images/main/메인서브-별점.PNG" class="subToday_score_j"> 7.5 &nbsp;|&nbsp;
							    <img src="/resources/images/main/메인서브-좋아요.PNG" class="subToday_score_j">
							 </p>
						 </div>
					</div>
	  			</td>
	  			<td class="subMenuTd_j">
		  			<div class="card">
						 <img src="/resources/images/main/메인서브02.png" class="card-img-top" alt="...">
						 <div class="card-body">
						 	 <div class="number">2</div>
							 <h5 class="card-title">영화제목</h5>
							 <p class="card-text">
							  	예매율 34% &nbsp;|&nbsp; 
							  	<img src="/resources/images/main/메인서브-별점.PNG" class="subToday_score_j"> 7.5 &nbsp;|&nbsp;
							    <img src="/resources/images/main/메인서브-좋아요.PNG" class="subToday_score_j">
							 </p>
						 </div>
					</div>
	  			</td>
	  			<td class="subMenuTd_j">
		  			<div class="card">
						 <img src="/resources/images/main/메인서브03.png" class="card-img-top" alt="...">
						 <div class="card-body">
						 	 <div class="number">3</div>
							 <h5 class="card-title">영화제목</h5>
							 <p class="card-text">
							  	예매율 34% &nbsp;|&nbsp; 
							  	<img src="/resources/images/main/메인서브-별점.PNG" class="subToday_score_j"> 7.5 &nbsp;|&nbsp;
							    <img src="/resources/images/main/메인서브-좋아요.PNG" class="subToday_score_j">
							 </p>
						 </div>
					</div>
	  			</td>
	  			<td class="subMenuTd_j">
		  			<div class="card">
						 <img src="/resources/images/main/메인서브04.png" class="card-img-top" alt="...">
						 <div class="card-body">
						 	 <div class="number">4</div>
							 <h5 class="card-title">영화제목</h5>
							 <p class="card-text">
							  	예매율 34% &nbsp;|&nbsp; 
							  	<img src="/resources/images/main/메인서브-별점.PNG" class="subToday_score_j"> 7.5 &nbsp;|&nbsp;
							    <img src="/resources/images/main/메인서브-좋아요.PNG" class="subToday_score_j">
							 </p>
						 </div>
					</div>
	  			</td>
	  			<td class="subMenuTd_j">
		  			<div class="card">
						 <img src="/resources/images/main/메인서브-01.png" class="card-img-top" alt="...">
						 <div class="card-body">
						 	 <div class="number">5</div>
							 <h5 class="card-title">영화제목</h5>
							  <p class="card-text">
							  	예매율 34% &nbsp;|&nbsp; 
							  	<img src="/resources/images/main/메인서브-별점.PNG" class="subToday_score_j"> 7.5 &nbsp;|&nbsp;
							    <img src="/resources/images/main/메인서브-좋아요.PNG" class="subToday_score_j">
							  </p>
						 </div>
					</div>
	  			</td>
	  			
	  		</tr>
	  	</table>
  </div>
</div>	


</body>

<script>
	var swiper = new Swiper(".mainBannerSwiper", {
		slidesPerView : 1,
		spaceBetween : 30,
		centeredSlides : true,
		autoplay : {
			delay : 2500,
			disableOnInteraction : false,
		},
		loop : true,
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});

	var swiper = new Swiper(".itemSwiper", {
		slidesPerView : 1,
		spaceBetween : 10,
		autoplay : {
			delay : 2000,
			disableOnInteraction : true,
			loop : true,
		},
			loop : true,
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		breakpoints : {
			640 : {
				slidesPerView : 2,
				spaceBetween : 20,
			},
			768 : {
				slidesPerView : 4,
				spaceBetween : 40,
			},
			1024 : {
				slidesPerView : 5,
				spaceBetween : 50,
			},
		},
	});
</script>

</html>







