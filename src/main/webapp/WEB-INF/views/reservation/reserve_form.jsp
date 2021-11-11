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
<script type="text/javascript" src="/resources/reservation/js/reserve_form.js?ver=102"></script>
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


.movieTitleR{
 font-size: 10px;

}

#movieTimeBtn{
	padding-left: 15%;
	

}


/* 정훈 달력 */
.movieCalDiv{
	overflow: scroll;
	overflow-x :hidden;
	text-align: left;
	height: 750px;

}

.calDiv{
height: 35px; 
width: 60px;
cursor: pointer;
text-align: center;
padding-top: 10px;


}

.day{
	font-size: 16px;
}

.week-sat, .day-sat{
	color: #3055ce;
}
.week-sun, .day-sun{
	 color : #ce3030;
}

.dateCheck{
	padding-top: 10px;
}


</style>


</head>
<body>

<a href="/reservation/write">예시</a>
<div class="codeValue"></div>

<div class="row bodyDiv justify-content-center">
	<div class="col-12">
		
		
		<!-- 예매하기 영역 -->
		<div class="row justify-content-center">
			<div class="col-10 reserveDiv" >
				<div class="row justify-content-center">
				
					<!-- 예매순서 -->
					<div class="col-1 reserveOrder" >
					
						<div class="row reserveOrderDiv" style="background-color: #ed7d31; color: white;" >
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
								${nowDate }
								<input type="hidden" class="screenDay" id="datepicker" value="${nowDate }" name="screenDay">
							</div>
						</div>
						
						<div class="row">
							<div class="col-12 " >
								<div class="row">
								
								
									<!-- 달력이 들어갈 공간 -->
									<div class="col-2 movieCalDiv justify-content-center" >
									
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-08" onclick="calClick('2021-11-08');"> <span class="week">월</span> <span class="day">&nbsp; 8</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-09" onclick="calClick('2021-11-09');"> <span class="week">화</span> <span class="day">&nbsp; 9</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"   data-date="2021-11-10" onclick="calClick('2021-11-10');"> <span class="week">수</span> <span class="day"> 10</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-11" onclick="calClick('2021-11-11');"> <span class="week">목</span> <span class="day"> 11</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-12" onclick="calClick('2021-11-12');"> <span class="week">금</span> <span class="day"> 12</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-13" onclick="calClick('2021-11-13');"> <span class="week week-sat">토</span> <span class="day day-sat"> 13</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-14" onclick="calClick('2021-11-14');"> <span class="week week-sun">일</span> <span class="day day-sun"> 14</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-15" onclick="calClick('2021-11-15');"> <span class="week">월</span> <span class="day"> 15</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-16" onclick="calClick('2021-11-16');"> <span class="week">화</span> <span class="day"> 16</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-17" onclick="calClick('2021-11-17');"> <span class="week">수</span> <span class="day"> 17</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-18" onclick="calClick('2021-11-18');"> <span class="week">목</span> <span class="day"> 18</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-19" onclick="calClick('2021-11-19');"> <span class="week">금</span> <span class="day"> 19</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-20" onclick="calClick('2021-11-20');"> <span class="week week-sat">토</span> <span class="day day-sat"> 20</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-21" onclick="calClick('2021-11-21');"> <span class="week week-sun">일</span> <span class="day day-sun"> 21</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-22" onclick="calClick('2021-11-22');"> <span class="week">월</span> <span class="day"> 22</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-23" onclick="calClick('2021-11-23');"> <span class="week">화</span> <span class="day"> 23</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-24" onclick="calClick('2021-11-24');"> <span class="week">수</span> <span class="day"> 24</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-25" onclick="calClick('2021-11-25');"> <span class="week">목</span> <span class="day"> 25</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-26" onclick="calClick('2021-11-26');"> <span class="week">금</span> <span class="day"> 26</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-27" onclick="calClick('2021-11-27');"> 
												<span class="week week-sat">토</span>
												<span class="day day-sat"> 27</span>
											</div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										
										
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-28" onclick="calClick('2021-11-28');"> <span class="week week-sun">일</span> <span class="day day-sun"> 28</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-29" onclick="calClick('2021-11-29');"> <span class="week">월</span> <span class="day"> 29</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-11-30" onclick="calClick('2021-11-30');"> <span class="week">화</span> <span class="day"> 30</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-12-01" onclick="calClick('2021-12-01');"> <span class="week">수</span> <span class="day">&nbsp; 1</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-12-02" onclick="calClick('2021-12-02');"> <span class="week">목</span> <span class="day">&nbsp; 2</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-12-03" onclick="calClick('2021-12-03');"> <span class="week">금</span> <span class="day">&nbsp; 3</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-12-04" onclick="calClick('2021-12-04');"> <span class="week week-sat">토</span> <span class="day day-sat">&nbsp; 4</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
										<div class="row">
											<div class="col-10 calDiv"  data-date="2021-12-05" onclick="calClick('2021-12-05');"> <span class="week week-sun">일</span> <span class="day day-sun">&nbsp; 5</span></div>
											<div class="col-2 dateCheck" >&nbsp; </div> 
										</div>
									</div>
									
									
									<!-- 상영시간 목록 -->
									<div class="col-10" >
										<div class="row justify-content-center movieTimeList" >
											<div class="col-12" >
											
												
												<!-- <input class="movieCal" id="datepicker" onclick="movieCalClick();"> -->
												
												<!-- 상영할 영화 제목 -->
												<div class="row">
													<div class="col-12">
													</div>
												</div>
												
												<!-- 상영시간이 뜨는 버튼 조회 -->
												<div class="row" id="movieTimeBtn">
												
													  
												</div>	
											</div>
										</div>
									</div>
									
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