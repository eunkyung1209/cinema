<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 결제 아임포트 연동 -->
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



/* 영화 */
.moviePosterDiv{
	margin-bottom: 20px;
}
.moviePosterDiv > img{
	margin: 0 auto;
	width: 80%;
}
.movieTitleDiv{
	margin-bottom: 10px;
}

/* 예매 상세 정보 - 일시, 영화관, 인원 */
.reserveInfoDiv{
	padding: 0;
}
.reserveInfoDiv table{
	width: 100%;
	/* margin: 0 30px; */
}
.reserveInfoDiv td{
	padding: 5px;
	text-align: left;
	font-size: small;
}
.reserveInfoDiv tr > td:first-child{
	font-weight: bold;
}

/* 적립금&등급 정보 */
.pointInfoDiv{
	border: 1.5px solid #e0e0e0;
	border-radius: 0.5em;
	text-align: center;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 220px;
}
.pointInfoDiv div{
	padding: 15px;
	text-align: left;
}
.pointInfoDiv div:first-child{
	border-right: 1.5px solid #eaeaea;
}
.pointInfoDiv div:last-child{
	text-align: right;
}

/* 적립금사용&적립포인트 정보 */
.payDiv{
	text-align: center;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 130px;
}
.payDiv div{
	padding: 15px;
	text-align: left;
}
.payDiv div:last-child{
	text-align: right;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
input[type="number"]{
	width: 80px;
	padding-left: 10px;
}

/* 결제 정보 */
.payInfoDiv{
	text-align: center;
	margin: 0 auto;
	margin-top: 20px;
}
.payDiv div{
	padding: 15px;
	text-align: left;
}
.payDiv div:last-child{
	text-align: right;
}

/* 결제 버튼 */
.payBtnDiv{
	/* display: inline-block; */
	width: 100%;
    height: 51px;
    background: #ed7d31;
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
						<div class="row reserveOrderDiv" style="background-color: #ed7d31; color: white;">
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
					
					<!-- 예매 정보 -->
					<div class="col-3 reserveArea" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleArea" >
								예매정보
							</div>
						</div>
						<!-- 내용 -->
						<div class="row justify-content-center">
							<!-- 예매 상세 정보 -->
							<div class="row justify-content-center" style="padding: 25px; border-bottom: 1px solid gray;">
								<!-- 포스터 -->
								<div class="row moviePosterDiv">
									<img alt="" src="/resources/images/movie/20211031_102451438_듄_메인.jpg"><!-- 영화 포스터 - 데이터로 수정 -->
								</div>
								<!-- 예매 상세 -->
								<div class="row reserveInfoDiv">
									<div class="movieTitleDiv">
										<h5>
										<img height="25px;" src="/resources/images/reservation/12.png"><!-- 연령 로고 - 데이터로 수정 -->
										영화제목<!-- 영화 제목 - 데이터로 수정 -->
										</h5>
									</div>
									<div class="reserveInfoDiv">
										<table>
											<colgroup>
												<col width="20%">
												<col width="*">
											</colgroup>
											<tr>
												<td>영화관</td>
												<td>지역 영화관지점명 상영관</td>
											</tr>
											<tr>
												<td>일시</td>
												<td>상영날짜 상영시작~상영종료</td>
											</tr>
											<tr>
												<td>인원</td>
												<td>몇명</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							<!-- 좌석 정보 -->
							<div class="row" style="padding: 25px; border-bottom: 1px solid gray;">
								<div class="reserveInfoDiv">
									<table>
										<colgroup>
											<col width="20%">
											<col width="*">
										</colgroup>
										<tr>
											<td>좌석</td>
											<td>행 열, 행 열, ...</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 결제 수단 -->
					<div class="col-4 reserveArea" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleArea" >
								적립금 / 등급
							</div>
						</div>
						<!-- 내용 -->
						<div class="row justify-content-center">
							<!-- 적립금 정보 -->
							<div class="row" style="padding: 25px; border-bottom: 1px solid gray;">
								<!-- 적립금 -->
								<div class="row">적립금 정보</div>
								<div class="row pointInfoDiv">
									<div class="col-6">누구님의 적립금</div><!-- 이름 - 데이터로 수정 -->
									<div class="col-6">0 원</div><!-- 적립금 - 데이터로 수정 -->
								</div>
							</div>
							<!-- 등급 정보 -->
							<div class="row" style="padding: 25px;">
								<!-- 등급 -->
								<div class="row">등급 정보</div>
								<div class="row pointInfoDiv">
									<div class="col-6">누구님의 등급</div><!-- 이름 - 데이터로 수정 -->
									<div class="col-6">무슨 등급</div><!-- 등급 - 데이터로 수정 -->
								</div>
							</div>
						</div>
					</div>
						
					<!-- 결제하기 -->
					<div class="col-4 reserveArea" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleArea" >
								결제하기
							</div>
						</div>
						<!-- 내용 -->
						<div class="row justify-content-center">
							<!-- 사용 가능한 적립금 정보 -->
							<div class="row" style="padding: 25px; border-bottom: 1px solid gray;">
								<!-- 적립금 -->
								<div class="row">적립금 사용</div>
								<div class="row payDiv">
									<div class="col-6">사용할 적립금</div>
									<div class="col-6" style="padding-top: 5px;"><input type="number" name="savedMoney" min="0" max="2000" value="0"> 원</div><!-- 적립금 최댓값 제한 - 데이터로 수정 -->
								</div>
							</div>
							<!-- 적립될 포인트 정보 -->
							<div class="row" style="padding: 25px; border-bottom: 1px solid gray;">
								<!-- 적립 포인트 -->
								<div class="row">등급 포인트 적립</div>
								<div class="row payDiv">
									<div class="col-6">적립될 포인트</div>
									<div class="col-6">0 포인트</div><!-- 적립금 - 데이터로 수정 -->
								</div>
							</div>
							<!-- 결제 정보 -->
							<div class="row" style="padding: 25px; border-bottom: 1px solid gray;">
								<!-- 결제 요금 -->
								<div class="row">결제</div>
								<div class="row payInfoDiv">
									<div class="col-6">상품 금액</div>
									<div class="col-6">10,000 원</div><!-- 상품 금액 : (좌석수 X 10,000) - 데이터로 수정 -->
								</div>
								<div class="row payInfoDiv">
									<div class="col-6">할인 금액</div>
									<div class="col-6">0 원</div><!-- 할인 금액 : 사용할 적립금 금액 - 데이터로 수정 -->
								</div>
								<div class="row payInfoDiv" style="margin-bottom: 10px;">
									<div class="col-6">결제 금액</div>
									<div class="col-6">10,000 원</div><!-- 결제 금액 : (상품 금액 - 할인 금액) - 데이터로 수정 -->
								</div>
							</div>
							<!-- 결제 버튼 -->
							<!-- <a href="#" style="height: 100%;">
							<span style="background-color: #ed7d31; color: white;">
								<input type="button" value="결제하기">
								결제하기
							</span>
							</a> -->
							<div class="row payBtnDiv">
								
								결제하기
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