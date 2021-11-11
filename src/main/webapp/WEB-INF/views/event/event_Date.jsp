<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" src="/resources/event/css/event_Date.css?ver=1"></style>
<script type="text/javascript" src="/resources/event/js/event_Date.js?ver=1"></script>
</head>
<body>
<!-- 캘린더 구현 -->
<div class="row justify-content-center">
	<div class="col-8">
		<div class="col-3 subjectDiv">
			<h5>행사일정</h5>
		</div>
<div class="container">
  <div class="my-calendar clearfix">
    <div class="clicked-date">
			      <div class="cal-day"></div>
			      <div class="cal-date"></div>
			    </div>
			    <div class="calendar-box">
			      <div class="ctr-box clearfix">
			        <button type="button" title="prev" class="btn-cal prev">
			        </button>
			        <span class="cal-month"></span>
			        <span class="cal-year"></span>
			        <button type="button" title="next" class="btn-cal next">
			        </button>
			      </div>
			      <table class="cal-table">
			        <thead>
			          <tr>
			            <th>S</th>
			            <th>M</th>
			            <th>T</th>
			            <th>W</th>
			            <th>T</th>
			            <th>F</th>
			            <th>S</th>
			          </tr>
			        </thead>
			        <tbody class="cal-body"></tbody>
			      </table>
			    </div>
			  </div>
		</div>
	</div>
</div>
<!-- 행사일정 구현 -->
<form action="/event/eventAjax" method="post">
<div class="row justify-content-center">
	<div class="col-7">
		<div class="col-12 subjectDiv">
			<div id="aaaa">
				<h6>이달의 행사</h6>
					<ul>
						<c:forEach items="${eventList }" var="eventInfo">
							<li>${eventInfo.evenDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${eventInfo.evenName }</li>
						</c:forEach>
					</ul>
				 <!-- <ul class="list-group list-group-flush">
				  <li class="list-group-item">2021.11.13 ~ 2021.11.19&nbsp;&nbsp;&nbsp;&nbsp;영화 : <귀멸의 칼날: 남매의 연> 1주차 현장 경품증정 이벤트</li>
				  <li class="list-group-item">2021.11.11 ~ 2021.12.05&nbsp;&nbsp;&nbsp;&nbsp;영화 : 가장 가까운 국립극장 <귀토-토끼의 팔린> 현장 경품증정 이벤트</li>
				  <li class="list-group-item">2021.11.11 ~ 2021.11.17&nbsp;&nbsp;&nbsp;&nbsp;영화 : <1984최동원>개봉기념 현장 증정 이벤트</li>
				  <li class="list-group-item">2021.11.13 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영화 : <1984최동원>굿즈패키지 상영회</li>
				  <li class="list-group-item">2021.11.13 ~ 2021.11.14&nbsp;&nbsp;&nbsp;&nbsp;무대인사 : <강릉>무대인사 이벤트</li>
				  <li class="list-group-item">2021.11.11 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시사회 : <1984최동원> 개봉기념GV</li>
				  <li class="list-group-item">2021.10.13 ~ 2021.11.09&nbsp;&nbsp;&nbsp;&nbsp;제휴할인 : 내통장결제로 영화보면 영화관란권을 드려요!</li>
				  <li class="list-group-item">2021.08.01 ~ 2022.01.31&nbsp;&nbsp;&nbsp;&nbsp;제휴할인 : 카카오뱅크로 결제하면 4,000원 즉시할인 </li>
				  <li class="list-group-item">2021.03.01 ~ 2022.02.28&nbsp;&nbsp;&nbsp;&nbsp;제휴할인 : 매주 금,토요일 영화티켓장당 5,000M포인트 사용</li>
				</ul> -->
			</div>
		</div>
	</div>	
</div>
<div class="row justify-content-center"></div>
</form>
</body>
</html>