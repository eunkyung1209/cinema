<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.bodyDiv{
 text-align: center;
 padding: 0px;
}

/* 예매하기 영역 */
.reserveDiv{
	height: 800px;
	margin: 0 auto;
	margin: 20px;
}

/* 예매하기 순서 */
.reserveOrder{
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	border-left: 1px solid gray;

}
.reserveOrder li{
	height: 200px;	
	padding-top: 100px;
}

/* 선택한 타이틀 */
.reserveTitle{
	height: 50px;
	background-color: #f2f2f2;
	padding-top: 20px;
	border-bottom: 1px solid gray;
}

ul{
	padding: 10px;
}

/* 영화관 선택  */
.reserveArea{
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	border-left: 1px solid gray;
}

.reserveMovie{
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	border-left: 1px solid gray;
}

.reservemMovieTime{
	border: 1px solid gray;
}

.ReserveInfoBtn{
	
	border :1px solid #c9c9c8;
	display: inline-block;
	width: 100%;
	height: 60px;
	background-color: #f2f2f2;
	color: black;
	padding: 6px 0;
	border-radius: 6px;
	cursor: pointer;
	-ms-user-select: none; 
    -moz-user-select: -moz-none;
    -khtml-user-select: none;
    -webkit-user-select: none;
     user-select: none;
}
.ReserveInfoBtn:active{
	position: relative;
	left: 2px;
	top:2px;
	background-color: #aaa69d;
}

.screenTimeDiv{
	font-size: 18px;

}

</style>


</head>
<body>
<div class="row bodyDiv justify-content-center">
	<div class="col-12">
		
		<!-- 예매하기 영역 -->
		<div class="row justify-content-center">
			<div class="col-10 reserveDiv" >
				<div class="row justify-content-center">
				
					<!-- 예매순서 -->
					<div class="col-1 reserveOrder" >
						<ul>
							<li>
								<div class="m-1">01</div> 
								<div>상영시간</div> 
							</li>
							<li>
								<div class="m-1">02</div> 
								<div>좌석선택</div>
							</li>
							<li>
								<div class="m-1">03</div>
								<div>결제하기</div>
							</li>
							<li>
								<div class="m-1">04</div>
								<div>결제완료</div>
							</li>
						</ul>
					</div>
					
					
					<!-- 영화관 선택 -->
					<div class="col-2 reserveArea" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12" >
								선택한 영화관
							</div>
						</div>
						<!-- 영화관 목록 -->
						<div class="row justify-content-center reserveAreaList">
							<div class="col-12 align-middle" >
								<ul>
									<li class="m-3">My 영화관</li>
									<c:forEach items="${areaList }" var="areaInfo">
										<li class="m-3">${areaInfo.areaName }</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					
					</div>
					
					<!-- 영화 선택 -->
					<div class="col-3 reserveMovie" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12" >
								선택한 영화
							</div>
						</div>
					</div>
					
					
					<!-- 상영시간 선택 -->
					<div class="col-6 reservemMovieTime" >
						<div class="row justify-content-center reserveTitle" >
							<div class="col-12" >
								선택한 상영시간
							</div>
						</div>
						
						<!-- 달력이 들어갈 공간 -->
						<div class="row">
							<div class="col-12 movieCal">
								달력
							</div>
						</div>
							
						<!-- 상영시간 목록 -->
						<div class="row justify-content-center movieTimeList" >
							<div class="col-12" >
								
								<!-- 상영시간이 뜨는 버튼 조회 -->
								<div class="row ">
									<c:forEach items="${ movieTimeList}" var="movieTimeInfo">
										<div class="col-3 m-1" >
											<div class="ReserveInfoBtn">
												<div class="screenTimeDiv m-1">${movieTimeInfo.screenTime }</div>
												<div class="seatDiv m-1">${movieTimeInfo.seatLeft }/ ${movieTimeInfo.seatAll } ${movieTimeInfo.theaterName}</div>

											</div>
										</div>
									</c:forEach>
								</div>	
							</div>
						</div>
						
					</div>
				
				
				
				
				</div>
			</div>
		</div>
	
	
	</div>
</div>


</body>
</html>