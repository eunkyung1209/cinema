<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<h5>대관 예약 조회</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 예약 안내 -->
		<div class="row justify-content-center">
			<div class="col-8 rental-notice text-center">
				<div class="row justify-content-center">
					<div class="notice">&lt; 대관 예약 안내 &gt;</div>
					<div class="notice"></div>
					<div class="notice">대관 예약 시, 해당 영화관과 논의 후 자세히 안내해드립니다.</div>
					<div class="notice">대관 예약에 대한 결과는 일정 시간이 소요됩니다.</div>
					<div class="notice">본인이 예약한 목록만 확인하실 수 있습니다.</div>
					<div class="notice"><span class="redStar">*</span> 예약한 시간은 영화관 사정상 변경될 수 있습니다.</div>
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
						<col width="20%">
						<col width="15%">
						<col width="20%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>영화관&상영관</th>
							<th>대관 예약일</th>
							<th>예약 시간</th>
							<th>신청 영화</th>
							<th>신청인 ID</th>
							<th>예약 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rentalList }" var="rentalInfo" varStatus="status">
							<tr>
								<th scope="row">${status.count }</th>
								<td>
									<div class="col-6">${rentalInfo.areaName }</div>
									<div class="col-6">${rentalInfo.theaterName }</div>
								</td>
								<td>${rentalInfo.rtDate }</td>
								<td>${rentalInfo.rtStartTime } ~ ${rentalInfo.rtEndTime }</td>
								<td>${rentalInfo.title }</td>
								<td>${rentalInfo.id }</td>
								<td>${rentalInfo.isComplete }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
	</div>
</div>
</body>
</html>