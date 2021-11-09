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
.payInfoDiv div{
	text-align: left;
}
.payInfoDiv div:last-child{
	text-align: right;
}

/* 결제 버튼 */
.payBtnDiv{
	/* display: inline-block; */
	width: 100vw;
    height: 51px;
    background: #ed7d31;
    vertical-align: middle;
    text-align: center;
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
					<div class="col-11 reserveArea" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleArea" >
								결제완료
							</div>
						</div>
						<!-- 내용 -->
						<div class="row justify-content-center">
							<!-- 결제&예매 정보 -->
							<div class="col-8">
								<!-- 결제 완료 안내 -->
								<div class="row">
									누구 회원님, 결제가 완료되었습니다.
								</div>
								<div class="row payDiv">
									<div class="col-6"></div>
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