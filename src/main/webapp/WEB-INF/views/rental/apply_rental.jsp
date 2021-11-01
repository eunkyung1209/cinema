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

/*검색 버튼 기본폼 */
.common_btn{
	font-size: 14px;
	background-color: #4c4747;
	color: white;
	width: 80px;
}
.common_btn:hover{
	font-size: 14px;
	background-color: #5d5959;
	color: white;
	width: 80px;
}
/* 검색박스 폼 */
.search_box{
	padding: 22px;
	border: 1px solid #e0e0e0;
	border-radius: 0.4em;
	background-color:#f2f2f2;
}
/* input 태그들 길이 조정 */
input{
	width: 100%;
	background-color: white;
}
/* 셀렉트박스 폼 */
.selectBox_from{
	font-size: 14px;
	width: 110px;
}
.search_form{
	background-color: #e0e0e0;
	text-align:center;
}

/* picker */
.only-timepicker .datepicker--nav,
.only-timepicker .datepicker--content {
    display: none;
}
.only-timepicker .datepicker--time {
    border-top: none;
}

/* 필수입력 빨간 별 */
.redStar{
	color: red;
}
/* 시간 변경 안내 */
.notice{
	font-size: 10px;
	float: right;
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
				<div class="row mt-4 mb-4 justify-content-center">
					&lt; 대관 예약 안내사항 &gt;
					
				</div>
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<!-- 대관 예약 -->
		<div class="row justify-content-center">
			<div class="col-7 search_box">
				<div class="row mt-4 mb-4 justify-content-center">
					<div class="col-10">
						<form action="/rental/applyRental" method="post">
							<!-- 신청인 아이디 -->
							<div class="mb-4">
								<label for="inputId" class="form-label">신청인 ID <span class="redStar">*</span></label><br>
								<c:choose>
									<c:when test="${not empty sessionScope.loginInfo.id }">
										<input type="text" id="inputId" name="id" value="${sessionScope.loginInfo.id }" readonly>
									</c:when>
									<c:otherwise>
										<input type="text" placeholder="로그인 후 신청이 가능합니다" readonly>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- 대관 날짜 선택 -->
							<div class="mb-4">
								<label for="datepicker" class="form-label">대관 예약일 <span class="redStar">*</span></label>
								<input type="text" id="datepicker" name="rtDate" value="${nowDate }" readonly>
							</div>
							<!-- 예약 시각 -->
							<div class="mb-4">
								<label for="timepicker" class="form-label">예약 시각 <span class="redStar">*</span></label><span class="notice"><span class="redStar">*</span> 예약한 시간은 영화관 사정상 변경될 수도 있습니다.</span>
								<input type="text" id="timepicker" class="only-time" name="rtStartTime" placeholder="시작 시각">
								<input type="text" class="only-time" name="rtEndTime" placeholder="종료 시각">
							</div>
							<!-- 영화관 선택 -->
							<div class="mb-4">
								<label for="datepicker" class="form-label">원하는 영화관 선택 <span class="redStar">*</span></label>
								<select name="areaCode" class="form-select">
									<c:forEach items="${areaList }" var="areaInfo">
										<option value="${areaInfo.areaCode }">${areaInfo.loc }${areaInfo.areaName }</option>
									</c:forEach>
								</select>
							</div>
							<!-- 영화 선택 -->
							<div class="mb-4">
								<label for="datepicker" class="form-label">원하는 영화 선택 <span class="redStar">*</span></label>
								<select name="mvCode" class="form-select">
									<c:forEach items="${movieList }" var="movieInfo">
										<option value="${movieInfo.mvCode }">${movieInfo.title }</option>
									</c:forEach>
								</select>
							</div>
							<div class="mt-5 text-center">
								<input class="btn common_btn <c:if test="${empty sessionScope.loginInfo.id }">disabled</c:if>" type="submit" value="신청하기">
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
        dateFormat: ' ',
        timepicker: true,
        classes: 'only-timepicker'
    });
</script>

</html>