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
	border: 1px solid gray;
}

/* 예매하기 순서 */
.reserveOrder{
	border-right: 1px solid gray; 
}
.reserveOrderDiv{
	height: 200px;	
	padding-top: 80px;
}

/* 선택한 타이틀 */
.reserveTitle{
	height: 200px;
	background-color: #f2f2f2;
	padding-top: 20px;
	border-bottom: 1px solid gray;
}



/* 영화 */
.moviePosterDiv{
	margin: 0 auto;
	margin-bottom: 20px;
}
.movieTitleDiv{
	margin-bottom: 10px;
}

/* 예매 상세 정보 - 일시, 영화관, 인원 */
.reserveInfoDiv table{
	margin: 0 30px;
}
.reserveInfoDiv td{
	padding: 5px;
	text-align: left;
}
.reserveInfoDiv tr > td:first-child{
	font-weight: bold;
}

/* 적립금 정보 */
.savedMoneyInfoDiv{
	border: 1.5px solid #e0e0e0;
	border-radius: 0.5em;
	text-align: center;
}
.savedMoneyInfoDiv div:first-child{
	border-right: 1.5px solid #eaeaea;
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
							<div class="row" style="padding: 30px; border-bottom: 1px solid #e0e0e0;">
								<!-- 포스터 -->
								<div class="row moviePosterDiv">
									<img alt="" src="/resources/images/movie/${movieInfo.포스터 }" width="150px">
								</div>
								<!-- 예매 상세 정보 -->
								<div class="row">
									<div class="movieTitleDiv">
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
										<h5>영화제목</h5>
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
							<div class="row" style="padding: 30px; border-bottom: 1px solid #e0e0e0;">
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
								적립금/등급
							</div>
						</div>
						<!-- 내용 -->
						<div class="row justify-content-center">
							<!-- 적립금&등급 정보 -->
							<div class="row" style="padding: 30px; border-bottom: 1px solid #e0e0e0;">
								<!-- 적립금 정보 -->
								<div class="row mb-1">적립금 정보</div>
								<div class="row savedMoneyInfoDiv">
									<div class="col-6">사용 가능한 적립금</div>
									<div class="col-6">0 point</div>
								</div>
								<!-- 등급 정보 -->
								<div class="row">등급 정보</div>
								<div class="row"></div>
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
							
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>