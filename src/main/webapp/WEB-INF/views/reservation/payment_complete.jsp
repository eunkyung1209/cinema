<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 결제 아임포트 연동 -->
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
	border: 1px solid gray;
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

/* 각 내용에 세로줄 */
.reserveArea{
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;
}



/* 예매 정보 */
.reservationInfoDiv{
	border: 1px solid #e0e0e0;
	margin: 25px auto;
	padding: 20px;
}
.reservationInfoDiv img{
	margin: 0 auto;
	width: 73%;
}
.reservationInfoDiv > div{
	padding: 15px;
}
.reservationInfoDiv > div:first-child{
	/* border-right: 1px solid #e0e0e0; */
}

/* 예매 정보 - 테이블 */
.detailInfoDiv{
	padding: 0;
	margin-bottom: 
}
.detailInfoDiv table{
	width: 100%;
	/* margin: 0 30px; */
}
.detailInfoDiv table:first-child{
	border-bottom: 1.5px solid gray;
}
.detailInfoDiv td{
	padding: 10px;
	text-align: left;
}
.detailInfoDiv table:first-child td{
	padding-bottom: 20px;
}
.detailInfoDiv table:last-child tr:first-child td{
	padding-top: 20px;
}

/* 예매 안내사항 */
.noticeDiv{
	text-align: left;
	margin: 0 auto;
	font-size: 11px;
	padding-bottom: 50px;
}
.noticeDiv div{
	padding: 5px 0;
}
.noticeDiv div:nth-child(-n + 5) {
	color: red;
}
</style>
</head>
<body>
<div class="row bodyDiv justify-content-center">
	<div class="col-12">
		<!-- 예매하기 영역 -->
		<div class="row justify-content-center">
			<div class="col-10 reserveDiv">
				<div class="row justify-content-center">
					<!-- 예매순서 : 좌측 세로 4가지 -->
					<div class="col-1 reserveOrder">
						<div class="row reserveOrderDiv" >
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
						<div class="row reserveOrderDiv" style="background-color: #ed7d31; color: white;">
							<div class="col-12">
								<div class="m-1">04</div>
								<div>결제완료</div>
							</div>
						</div>
					</div>
					
					<!-- 결제 정보 -->
					<div class="col-11 reserveArea">
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleArea">
								결제완료
							</div>
						</div>
						<!-- 내용 -->
						<div class="row justify-content-center">
							<!-- 결제&예매 정보 -->
							<div class="col-8">
								<!-- 결제 완료 안내 -->
								<div class="row justify-content-center" style="padding: 50px; padding-bottom: 0;">
									<div class="col-12 mb-3">
										<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-credit-card-2-back" viewBox="0 0 16 16">
											<path d="M11 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"/>
											<path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2zm13 2v5H1V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1zm-1 9H2a1 1 0 0 1-1-1v-1h14v1a1 1 0 0 1-1 1z"/>
										</svg>
									</div>
									<div class="col-12" style="font-size: 16px;">
										${sessionScope.loginInfo.name } 회원님, 결제가 완료되었습니다.
									</div>
								</div>
								<!-- 예매 정보 -->
								<div class="row justify-content-center reservationInfoDiv">
									<div class="col-4">
										<img alt="" src="/resources/images/movie/${resInfo.attachedImgName }">
									</div>
									<div class="col-8 detailInfoDiv">
										<table>
											<colgroup>
												<col width="20%">
												<col width="*">
											</colgroup>
											<tr>
												<td>예매코드</td>
												<td>${resInfo.resCode }</td>
											</tr>
										</table>
										<table>
											<colgroup>
												<col width="20%">
												<col width="*">
											</colgroup>
											<tr>
												<td>상영관</td>
												<td>${resInfo.loc } ${resInfo.areaName } ${resInfo.theaterName }</td>
											</tr>
											<tr>
												<td>상영일시</td>
												<td>${resInfo.screenDay }&nbsp;&nbsp;${resInfo.screenTime } ~ ${resInfo.screenEndTime }</td>
											</tr>
											<tr>
												<td>관람인원</td>
												<td>${resInfo.seatCnt } 명</td><!-- 인원 - 데이터로 수정 -->
											</tr>
											<tr>
												<td>좌석</td>
												<td>${resInfo.seatName }</td><!-- 좌석이름 - 데이터로 수정 -->
											</tr>
											<tr>
												<td>결제금액</td>
												<td>${resInfo.totalPrice } 원</td><!-- 결제금액 - 데이터로 수정 -->
											</tr>
										</table>
									</div>
								</div>
								<!-- 예매 안내사항 -->
								<div class="row noticeDiv">
									<div>· 온라인 예매 취소는 상영 시작 20분 전까지 온라인에서 가능합니다.</div>
									<div>· 상영시작 20분전 이후부터는 영화관 현장에서만 취소 가능합니다.</div>
									<div>· 반드시 전체 취소만 가능하며, 예매 티켓의 부분 취소는 불가능합니다.</div>
									<div>· 티켓 발권 완료 시 환불은 발권된 티켓 모두 지참 후 해당 영화관에서만 가능합니다.</div>
									<div>· 무대인사 예매 취소는 상영시작 24시간 전까지 가능합니다.</div>
									<div>· 적립 예정 포인트는 영화 관람 다음 날 적립됩니다.</div>
									<div>· 예고편 상영 등 사정에 의해 본 영화 시작이 10여분 정도 차이 날 수 있습니다.</div>
									<div>· 개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다. 꼭 예매코드를 확인해주세요</div>
								</div>
								<!-- 버튼 -->
								<div class="row justify-content-center">
									<div class="col">
										<input type="button" class="common_btn" style="width: 160px;" value="나의 예매내역 가기" onclick="location.href='#';">
										<input type="button" class="common_btn" style="width: 160px;" value="홈으로 바로가기" onclick="location.href='/movie/mainPage';">
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