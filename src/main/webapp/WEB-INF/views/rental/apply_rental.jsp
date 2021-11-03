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
.notice-time{
	font-size: small;
	float: right;
}

/* input 태그들 조정 */
.rentalInput, .time{
	width: 100%;
	background-color: white;
	padding-left: 10px;
}
.time{
	width: 35%;
	padding-left: 10px;
}

/* picker */
.only-timepicker .datepicker--nav,
.only-timepicker .datepicker--content {
    display: none;
}
.only-timepicker .datepicker--time {
    border-top: none;
}

/*검색 버튼 기본폼 */
.common_btn{
	font-size: 14px;
	background-color: #ed7d31;
	color: white;
	width: 80px;
}
.common_btn:hover{
	font-size: 14px;
	background-color: #5d5959;
	color: white;
	width: 80px;
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
					<h5>대관 예약 신청</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 예약 안내 -->
		<div class="row justify-content-center">
			<div class="col-7 rental-notice text-center">
				<div class="row justify-content-center">
					<div class="notice">&lt; 대관 예약 안내 &gt;</div>
					<div class="notice"></div>
					<div class="notice">대관 예약 신청 시, 해당 영화관 상황을 확인 후 결과를 안내해드립니다.</div>
					<div class="notice">대관 예약 현황과 결과는 상영관 대관 예약 조회 페이지에서 확인하실 수 있습니다.</div>
					<div class="notice"><span class="redStar">*</span> 예약한 시간은 영화관 사정상 변경될 수 있습니다.</div>
				</div>
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<!-- 대관 예약 -->
		<div class="row justify-content-center">
			<div class="col-7 search_box">
				<div class="row mt-4 mb-4 justify-content-center">
					<div class="col-11">
						<form action="/rental/applyRental" method="post">
							<!-- 신청인 아이디 -->
							<div class="mb-4">
								<label for="inputId" class="form-label">신청인 ID <span class="redStar">*</span></label><br>
								<c:choose>
									<c:when test="${not empty sessionScope.loginInfo.id }">
										<input type="text" class="rentalInput" id="inputId" name="id" value="${sessionScope.loginInfo.id }" readonly required>
									</c:when>
									<c:otherwise>
										<input type="text" class="rentalInput" placeholder="로그인 후 신청이 가능합니다" readonly>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- 영화관 선택 -->
							<div class="mb-4">
								<label for="datepicker" class="form-label">영화관 선택 <span class="redStar">*</span></label>
								<select name="areaCode" class="selectBox_from rentalInput" required>
									<c:forEach items="${areaList }" var="areaInfo">
										<option value="${areaInfo.areaCode }">${areaInfo.loc } ${areaInfo.areaName }</option>
									</c:forEach>
								</select>
							</div>
							<!-- 대관 날짜 선택 -->
							<div class="mb-4">
								<label for="datepicker" class="form-label">대관 예약일 <span class="redStar">*</span></label>
								<input type="text" class="rentalInput" id="datepicker" name="rtDate" value="${nowDate }" readonly required>
							</div>
							<!-- 예약 시각 -->
							<div class="mb-4">
								<div class="row">
									<div class="col-12">
										<label for="timepicker" class="form-label">예약 시각 <span class="redStar">*</span></label>
										<div class="notice-time"><span class="redStar">*</span> 예약한 시간은 영화관 사정상 변경될 수 있습니다.</div><br>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										시작 시각 : 
										<input type="text" id="timepicker" class="only-time time" name="rtStartTime" placeholder="시작 시각" required>
									</div>
									<div class="col-6">
										종료 시각 : 
										<input type="text" id="endTime" class="only-time time" name="rtEndTime" placeholder="종료 시각" required>
									</div>
								</div>
							</div>
							<!-- 영화 선택 -->
							<div class="mb-4">
								<label for="datepicker" class="form-label">영화 선택 <span class="redStar">*</span></label>
								<select name="mvCode" class="selectBox_from rentalInput" required>
									<c:forEach items="${movieList }" var="movieInfo">
										<option value="${movieInfo.mvCode }">${movieInfo.title }</option>
									</c:forEach>
								</select>
							</div>
							<div class="mt-5 text-center">
								<input class="btn common_btn" type="submit" <c:if test="${empty sessionScope.loginInfo }">disabled</c:if> value="신청">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div style="height: 80px;"></div>
		
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
    });
    
	//시각 선택
    $('.only-time').datepicker({
        dateFormat: '',
        timepicker: true,
        classes: 'only-timepicker'
    });
</script>

</html>