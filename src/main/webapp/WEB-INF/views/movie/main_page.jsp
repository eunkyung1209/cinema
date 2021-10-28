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
	color: white;
 	margin: 0;
    padding: 0;
}
.mainBigPicture_j{
	background-image: url(resources/images/main/메인사진.jpg);
	background-size: cover;
	background-position: center;
	height: 684px;
}
.logo{
	margin-top : 250px;
	margin-bottom : 200px;
	border-bottom: solid 5px white;
	opacity: 0.2;
}
.logo > img{
	text-align: center;
}
.nowTime{
	font-size: 15px;
	text-align: right;
	padding-bottom: 14px;
}
.nowTime img{
	width: 25px;
	height: 25px;
}
.number{
	padding: none;
	background-color: white;
	color:red;
	font-size: 30px;
	text-align: center;
	position: absolute;
	top: 2%;
	left: 2%;
}
.star{
	width: 17px;
	height: 17px;
}
.card{
	background-color: black;
}
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="row mainBigPicture_j">
		
	</div>
	<div class="row logo">
		<img src="/resources/images/main/로고.png">
	</div>
	<div class="row text-right nowTime justify-content-center">
		<div class="col-10">
			<!-- 시간 바뀌게.. -->
			<img src="/resources/images/main/메인서브-시계.png">
			${nowDateTime } 기준
		</div>
	</div>
	<div class="row">
		<!-- 영화 목록 조회 -->
		<div class="col-1"></div>
		<c:forEach items="${movieList }" var="movieInfo" varStatus="status">
			<div class="col-2">
				<div class="card mb-3">
					<a href="/movie/movieDetail?mvCode=${movieInfo.mvCode }"><img src="/resources/images/movie/${movieInfo.attachedImgName }" class="card-img-top"></a>
					<div class="card-body">
						<div class="number">${status.count }</div>
						<h5 class="card-title">${movieInfo.title }</h5>
						<p class="card-text">
							${movieInfo.genre } 
							&nbsp;|&nbsp; 
							<img src="/resources/images/main/메인서브-별점.PNG" class="star">${movieInfo.grade }
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="col-1"></div>
	</div>
	<div class="row"><!-- 영화 예시 -->
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브-01.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">베놈2</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브02.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">영화제목</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브03.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">영화제목</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브04.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">영화제목</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브-01.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">영화제목</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>