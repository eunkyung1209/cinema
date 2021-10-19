<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/resources/sample/css/sample.css"> -->
<style type="text/css">
body{
	background-color: black;
	color: white;
 	margin: 0;
    padding: 0;
}
.mainBigPicture_j{
	position: relative;
	background-image: url(resources/images/main/메인사진.jpg);
	background-size: cover;
	background-position: center;
	height: 684px;
}
.logo{
	margin-top : 250px;
	margin-bottom : 200px;
	border-bottom: solid 5px white;
	opacity:0.2;
	text-align: center;
}
.nowTime{
	font-size: 15px;
}
.nowTime > img{
	width: 25px;
	height: 25px;
}
p > img{
	width: 17px;
	height: 17px;
}
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="mainBigPicture_j"></div>
	<div class="row logo">
		<img src="/resources/images/main/로고.png">
	</div>
	<div class="row text-right nowTime">
		<div class="col">
			<!-- 시간 바뀌게.. -->
			<img src="/resources/images/main/메인서브-시계.png">
			10.19 17:01 기준
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<div class="card text-white bg-dark mb-3">
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
		</div>
		<div class="col-2">
			<div class="card text-white bg-dark mb-3">
				<a href="#"><img src="/resources/images/main/메인서브02.png" class="card-img-top" alt="..."></a>
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
		</div>
		<div class="col-2">
			<div class="card text-white bg-dark mb-3">
				<a href="#"><img src="/resources/images/main/메인서브03.png" class="card-img-top" alt="..."></a>
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
		</div>
		<div class="col-2">
			<div class="card text-white bg-dark mb-3">
				<a href="#"><img src="/resources/images/main/메인서브04.png" class="card-img-top" alt="..."></a>
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
		</div>
		<div class="col-2">
			<div class="card text-white bg-dark mb-3">
				<a href="#"><img src="/resources/images/main/메인서브-01.png" class="card-img-top" alt="..."></a>
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
		</div>
		<div class="col-2">
			<div class="card text-white bg-dark mb-3">
				<a href="#"><img src="/resources/images/main/메인서브02.png" class="card-img-top" alt="..."></a>
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
		</div>
	</div>
</div>
</body>
</html>