<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/event/css/event_Date.css?ver=2">
<script type="text/javascript" src="/resources/event/js/event_Date.js?ver=2"></script>
</head>
<body>
	<!-- 캘린더 구현 -->
	<div class="row justify-content-center">
		<div class="col-8">
			<div class="row">
				<div class="col-3 subjectDiv">
					<h5>행사일정</h5>
				</div>
			</div>
			
			<div class="row">
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
								<span class="cal-month"></span> <span class="cal-year"></span>
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
			
			<!-- 행사일정 구현 -->
			<form action="/event/eventAjax" method="post">
				<div class="row justify-content-center">
					<div class="col">
						<div class="col-12 subjectDiv">
							<div id="aaaa">
								<h6>이달의 행사</h6>
								<ul>
									<c:forEach items="${eventList }" var="eventInfo">
										<li>${eventInfo.evenDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${eventInfo.evenName }</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-center"></div>
			</form>
			
		</div>
	</div>
</body>
</html>