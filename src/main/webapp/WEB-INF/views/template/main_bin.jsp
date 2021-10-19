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

</style>
</head>
<body>


<div>

  <div class="mainBigPicture_j">
      <h2>메인사진</h2>
  </div>

<div>
  <div class="b">
  	<img class="c" src="/resources/images/main/로고.png">
  </div>
  <div class="d">
  </div>
</div>
  	
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
</html>







