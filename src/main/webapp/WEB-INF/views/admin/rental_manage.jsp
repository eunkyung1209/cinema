<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/rental/js/rental_manage.js?ver=8"></script>
<style type="text/css">
/* 예약 안내 */
.rental-notice{
	border: 2px solid #e0e0e0;
	border-radius: 0.4em;
}
.rental-notice > div{
	padding-top: 40px;
	padding-bottom: 40px;
}
.notice{
	margin: 7px auto;
}

/* input, select 태그들 조정 */
.time{
	width: 60px;
}

/* 검색 구분 제목 */
.division{
	font-weight: bold;
}

/* 테이블 폼 */
tr{
	border-bottom: 1px solid #e0e0e0;
}
tr, td{
	height: 50px;
}
.board_list{
	margin: 0 auto;
	width: 100%;
	text-align: center;
	border-bottom: 1px solid white;
	border-top: 1px solid white;
}
.board_list th, td{
	vertical-align: middle;
}
</style>
</head>
<body>
<div class="row">
	<div class="col">
		<!-- 제목 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>대관 예약 관리</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 예약 관리 주의사항 -->
		<div class="row justify-content-center">
			<div class="col-8 rental-notice text-center">
				<div class="row justify-content-center">
					<div class="notice">&lt; 대관 예약 관리 주의사항 &gt;</div>
					<div class="notice"></div>
					<div class="notice">해당 영화관과 논의 후, 결정되면 해당 예약 수정해주세요.</div>
					<div class="notice">대관 예약에 대한 결과는 일정 시간이 소요됩니다.</div>
					<div class="notice">본인이 예약한 목록만 확인하실 수 있습니다.</div>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 검색폼 -->
		<div class="row justify-content-center">
			<div class="col-8 search_box">
				<form action="/rental/selectRentalList" method="post">
					<div class="row justify-content-center">
						<div class="col-9">
							<div class="row">
								<div class="col">
									<span class="division">영화관</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="areaCode" value="" checked>&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;
									<c:forEach items="${areaList }" var="areaInfo">
										<input type="radio" name="areaCode" value="${areaInfo.areaCode }">&nbsp;${areaInfo.loc } ${areaInfo.areaName }&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<span class="division">예약 상태</span>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="isComplete" value="" checked>&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="isComplete" value="W">&nbsp;예약 대기&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="isComplete" value="N">&nbsp;예약 불가&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="isComplete" value="Y">&nbsp;예약 완료&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
							</div>
						</div>
						<div class="col-2">
							<div style="margin: 1em;">
								<input class="common_btn" type="submit" value="검색">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<!-- 예약 목록 테이블 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<table class="board_list">
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="10%">
						<col width="12%">
						<col width="15%">
						<col width="19%">
						<col width="10%">
						<col width="10%">
						<col width="9%">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>영화관</th>
							<th>상영관</th>
							<th>대관 예약일</th>
							<th>예약 시간</th>
							<th>신청 영화</th>
							<th>신청인 ID</th>
							<th>예약 상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rentalList }" var="rentalInfo" varStatus="status">
							<tr>
								<th scope="row">${status.count }</th>
								<td>${rentalInfo.loc } ${rentalInfo.areaName }</td>
								<td>
									<select name="theaterName" class="selectBox_from" style="width: 60px;" required>
										<option value="" selected>선택</option>
										<c:forEach varStatus="status"  begin="1" end="5" step="1">
											<option value="${status.index }관">${status.index }관</option>
										</c:forEach>
									</select>
								</td>
								<td>${rentalInfo.rtDate }</td>
								<td>
									<input type="text" name="rtStartTime" class="time" value="${rentalInfo.rtStartTime }" required> ~ 
									<input type="text" name="rtEndTime" class="time" value="${rentalInfo.rtEndTime }" required>
								</td>
								<td>${rentalInfo.title }</td>
								<td>${rentalInfo.id }</td>
								<td>
									<select name="isComplete" class="selectBox_from" style="width: 85px;" required>
										<option value="W" <c:if test="${rentalInfo.isComplete eq 'W' }">selected</c:if>>예약 대기</option>
										<option value="N" <c:if test="${rentalInfo.isComplete eq 'N' }">selected</c:if>>예약 불가</option>
										<option value="Y" <c:if test="${rentalInfo.isComplete eq 'Y' }">selected</c:if>>예약 완료</option>
									</select>
								</td>
								<td>
									<input type="button" class="common_btn updateRental" data-rtCode="${rentalInfo.rtCode }" value="수정" style="width: 45px; height: 35px;" onclick="updateRental('${rentalInfo.rtCode }');">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
	</div>
</div>
</html>