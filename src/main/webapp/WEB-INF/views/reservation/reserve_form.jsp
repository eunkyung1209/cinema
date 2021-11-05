<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 값 제어를 위한 jquery -->
<script src="/resources/rental/js/jquery-3.1.1.min.js"></script>
<!-- Air datepicker css -->
<link href="/resources/rental/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker js -->
<script src="/resources/rental/js/datepicker.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<script src="/resources/rental/js/datepicker.ko.js"></script>

<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<script> 

       /* document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      }); */
       
       document.getElementById('my-button').addEventListener('click', function() {
    	   var date = calendar.getDate();
    	   alert("The current date of the calendar is " + date.toISOString());
    	 }); 
       
</script>

<!-- 자바 스크립트 -->
<script type="text/javascript" src="/resources/reservation/js/reserve_form.js?ver=68"></script>
<style type="text/css">

/* picker */
.only-timepicker .datepicker--nav,
.only-timepicker .datepicker--content {
     display: none; 
}
.only-timepicker .datepicker--time {
    border-top: none;
}

#datepicker{
	text-align: center;

}



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
.reserveOrderDiv{
	height: 200px;	
	padding-top: 80px;
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

.reserveInfoBtn{
	
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
.reserveInfoBtn:active{
	position: relative;
	left: 2px;
	top:2px;
	background-color: #aaa69d;
}

.screenTimeDiv{
	font-size: 18px;

}

.areaName, .movieName{
	cursor: pointer;
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
					
						<div class="row reserveOrderDiv" style="background-color: orange;">
							<div class="col-12">
								<div class="m-1" >01</div> 
								<div>상영시간</div> 
							</div>
						</div>
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1">02</div> 
								<div>좌석선택</div>
							</div>
						</div>
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1">03</div>
								<div>결제하기</div>
							</div>
						</div>
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1">04</div>
								<div>결제완료</div>
							</div>
						</div>
						
					</div>
					
					
					<!-- 영화관 선택 -->
					<div class="col-2 reserveArea" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleArea" >
								선택한 영화관
							</div>
						</div>
						<!-- 영화관 목록 -->
						<div class="row justify-content-center reserveAreaList">
							<div class="col-12 align-middle" >
								<ul>
									<li class="m-3 ">My 영화관</li>
									<c:forEach items="${areaList }" var="areaInfo">
										<li class="m-3 areaName" onclick="areaNameClick('${areaInfo.areaName }');" data-areaName="${areaInfo.areaName }">
											<div class="row justify-content-center">
												<div class="col-10">${areaInfo.areaName }</div>
												<div class="col-2 areaCheck" > &nbsp;</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					
					</div>
					
					<!-- 영화 선택 -->
					<div class="col-3 reserveMovie" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleMovie" >
								선택한 영화
							</div>
						</div>
						
						<!-- 영화목록 -->
						<div class="row justify-content-center reserveMovieList" id="movieTimeMovie">
							<c:forEach items="${statingMovieList }" var="statingMovie">
								<li class="m-3 movieName" onclick="movieClick('${statingMovie.mvCode}', '${statingMovie.title }');" data-mvCode="${statingMovie. mvCode}">
									<div class="row justify-content-center" >
										<div class="col-11">
											<c:if test="${statingMovie. age eq 12}">
												<img height="25px;" src="/resources/images/reservation/12.png">
											</c:if>
											<c:if test="${statingMovie. age eq 15}">
												<img height="25px;" src="/resources/images/reservation/15.png">
											</c:if>
											<c:if test="${statingMovie. age eq 19}">
												<img height="25px;" src="/resources/images/reservation/19.png">
											</c:if>
											<c:if test="${statingMovie. age eq 0}">
												<img height="25px;" src="/resources/images/reservation/전체.png">
											</c:if>
											${statingMovie.title }
										</div>
										<div class="col-1 movieCheck" > &nbsp;</div>
									</div>
								</li>
							</c:forEach>
						</div>
						
						
					</div>
					
					
					<!-- 상영시간 선택 -->
					<div class="col-6 reservemMovieTime" >
						<div class="row justify-content-center reserveTitle" >
							<div class="col-12 reserveTitleMovieTime" >
								
							</div>
						</div>
						
						<!-- 달력이 들어갈 공간 -->
						<div class="row">
							<div class="col-12 movieCalDiv" >
								<div class="row">
									<div class="movieCal col-6" id="datepicker" onclick="movieCalClick();">
									
									</div> 
									
									<div class="col-6" >
									</div>
								</div> 
								
								<input type="hidden" value="${nowDate }" name="screenDay">
							</div>
						</div>
							
						<!-- 상영시간 목록 -->
						<div class="row justify-content-center movieTimeList" >
							<div class="col-12" >
								
								<!-- 상영할 영화 제목 -->
								<div class="row">
									<div class="col-12">
									
									</div>
								</div>
								
								<!-- 상영시간이 뜨는 버튼 조회 -->
								<div class="row" id="movieTimeBtn" >
									  
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


<script>
	//최소 날짜
	var minDate = new Date();
    minDate.setDate(minDate.getDate());

    $('#datepicker').datepicker({
      minDate: minDate
   	});
	
	//날짜 선택
    $("#datepicker").datepicker({
    	language: 'ko'
    	, dateFormat: 'yyyy-mm-dd'
    });
    
	
</script>





</html>