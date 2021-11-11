<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/reservation/js/payment_page.js?ver=9"></script>

<!-- 결제 아임포트 연동 -->
<!-- jQuery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
	/* font-weight: bold; */
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
		<form id="paymentForm" onsubmit="" novalidate>
			<input type="hidden" id="resCode" name="resCode">
			<input type="hidden" name="id" value="${sessionScope.loginInfo.id }">
			<input type="hidden" id="mvTimeCode" name="mvTimeCode" value="${mvtInfo.mvTimeCode }">
			<input type="hidden" id="seatName" name="seatName" value="${seatInfo.seatName }">
			<input type="hidden" id="seatCnt" name="seatCnt" value="${seatInfo.seatCnt }">
			<input type="hidden" id="screenDay" name="screenDay" value="${mvtInfo.screenDay }">
			<input type="hidden" id="theaterCode" name="theaterCode" value="${seatInfo.theaterCode }">
			
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
										<img alt="" src="/resources/images/movie/${mvtInfo.attachedImgName }">
									</div>
									<!-- 예매 상세 -->
									<div class="row reserveInfoDiv">
										<div class="movieTitleDiv">
											<h5>
											<c:if test="${mvtInfo.age eq 12}">
												<img height="25px;" src="/resources/images/reservation/12.png">
											</c:if>
											<c:if test="${mvtInfo.age eq 15}">
												<img height="25px;" src="/resources/images/reservation/15.png">
											</c:if>
											<c:if test="${mvtInfo.age eq 19}">
												<img height="25px;" src="/resources/images/reservation/19.png">
											</c:if>
											<c:if test="${mvtInfo.age eq 0}">
												<img height="25px;" src="/resources/images/reservation/전체.png">
											</c:if>
											${mvtInfo.title }
											<input type="hidden" id="title" name="title" value="듄">
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
													<td>
														${mvtInfo.loc } ${mvtInfo.areaName } ${mvtInfo.theaterName }
													</td>
												</tr>
												<tr>
													<td>일시</td>
													<td>
														${mvtInfo.screenDay }&nbsp;&nbsp;${mvtInfo.screenTime } ~ ${mvtInfo.screenEndTime }
													</td>
												</tr>
												<tr>
													<td>인원</td>
													<td>
														${seatInfo.seatCnt } 명
													</td>
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
												<td>${seatInfo.seatName }</td>
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
										<div class="col-6">${memberInfo.name }님의 적립금</div>
										<div class="col-6">${memberInfo.savedMoney } 원</div>
									</div>
								</div>
								<!-- 등급 정보 -->
								<div class="row" style="padding: 25px;">
									<!-- 등급 -->
									<div class="row">등급 정보</div>
									<div class="row pointInfoDiv">
										<div class="col-6">${memberInfo.name }님의 등급</div>
										<div class="col-6">
											<c:if test="${memberInfo.point >= 0 and memberInfo.point <= 100 }">
											 	<span style="color: green; font-weight: bold;">그린</span>
											</c:if>
											<c:if test="${memberInfo.point >= 101 and memberInfo.point <= 200 }">
											 	<span style="color: gray; font-weight: bold;">실버</span>
											</c:if>
											<c:if test="${memberInfo.point >= 201 and memberInfo.point <= 300 }">
											 	<span style="color: yellow; font-weight: bold;">골드</span>
											</c:if>
											<c:if test="${memberInfo.point >= 301 and memberInfo.point <= 500 }">
											 	<span style="color: aqua; font-weight: bold;">다이아</span>
											</c:if>
											<c:if test="${memberInfo.point >= 501}">
												<span style="color: #ed7d31 font-weight: bold;">VVIP</span>
											</c:if>
											등급
										</div>
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
										<div class="col-6" style="padding-top: 5px;">
											<input type="number" name="savedMoney" id="savedMoney" min="0" max="${memberInfo.savedMoney }" value="0"> 원
										</div><!-- 적립금 최댓값 제한 - 데이터로 수정 -->
									</div>
								</div>
								<!-- 적립될 포인트 정보 -->
								<div class="row" style="padding: 25px; border-bottom: 1px solid gray;">
									<!-- 적립 포인트 -->
									<div class="row">등급 포인트 적립</div>
									<div class="row payDiv">
										<div class="col-6">적립될 포인트</div>
										<div class="col-6">${seatInfo.seatCnt * 10 } 포인트</div>
									</div>
								</div>
								<!-- 결제 정보 -->
								<div class="row" style="padding: 25px; padding-bottom: 15px;">
									<!-- 결제 요금 -->
									<div class="row">결제</div>
									<div class="row payInfoDiv justify-content-center">
										<div class="col-4">상품 금액</div>
										<div class="col-4"><span id="ticketPrice"><fmt:formatNumber pattern="#,##0" value="${seatInfo.seatCnt * 10000 }"/></span> 원</div><!-- 상품 금액 : (좌석수 X 10,000) - 데이터로 수정 -->
									</div>
									<div class="row payInfoDiv justify-content-center">
										<div class="col-4">할인 금액</div>
										<div class="col-4">- <span id="salePrice"><fmt:formatNumber pattern="#,##0" value="0"/></span> 원</div><!-- 할인 금액 : 사용할 적립금 금액 - 데이터로 수정 -->
									</div>
									<div class="row payInfoDiv justify-content-center" style="margin-bottom: 10px;">
										<div class="col-4">결제 금액</div>
										<div class="col-4">
											<span id="totalPrice"><fmt:formatNumber pattern="#,##0" value="${seatInfo.seatCnt * 10000 }"/></span> 원
											<input type="hidden" name="totalPrice" class="totalPrice" value="${seatInfo.seatCnt * 10000 }">
										</div><!-- 결제 금액 : (상품 금액 - 할인 금액) - 데이터로 수정 -->
									</div>
								</div>
								<!-- 결제 버튼 -->
								<div class="row" style="padding: 25px; padding-top: 0;">
									<!-- <input type="submit" class="btn_payment common_btn" value="결제하기" style="width: 100%;" data-mvTimeCode="mvTimeCode" data-id="id"> -->
									<!-- <input type="button" class="btn_payment common_btn" value="결제하기" style="width: 100%;" data-mvTimeCode="mvTimeCode" data-id="id"> -->
									<input type="button" class="btn_payment common_btn" value="결제하기" style="width: 100%;">
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
		</form>
	</div>
</div>
</body>

<script>
	//class가 btn_payment인 태그를 클릭했을 때 작동
	$(".btn_payment").click(function() {
		//결제 금액
		var totalPrice = $('.totalPrice').val();
		
		//가맹점 식별코드
	  	IMP.init('imp42711377');
		
		//IMP.request_pay(param, callback) 호출
	  	//결제시 전달되는 정보
		IMP.request_pay({
				//KG이니시스 - 필수
			    pg : 'html5_inicis',
			    //결제수단 - 필수
			    pay_method : 'card',
				//예매번호 - 필수
			    merchant_uid : 'merchant_' + new Date().getTime(),
				//결제창에 삽입할 상품명 : mvTitle
			    name : 'OISONE CINEMA: ${mvtInfo.title }',
			    //결제 금액 - 필수 : totalPrice
			    amount : totalPrice,
			    //회원 이름
			    buyer_name : '${memberInfo.name }',
			    //회원 연락처 - 필수
			    buyer_tel : '${memberInfo.tell }',
			    //회원 이메일
			    buyer_email : '${memberInfo.email }',
			}, function(rsp) {	//callback
				//var result = '';
			    if ( rsp.success ) {	//결제 성공 시
			    	//결제 성공 시 얼럿창 내용
			        var msg = '결제가 완료되었습니다.';
			        //msg += '고유ID : ' + rsp.imp_uid;
			        //msg += '상점 거래ID : ' + rsp.merchant_uid;
			        //msg += '결제 금액 : ' + rsp.paid_amount;
			        //msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        //다음 예매코드 조회 시 필요한 데이터
			        var mvTimeCode = $('#mvTimeCode').val();
			        var screenDay = $('#screenDay').val();
			        
			        //결제 후 다음 예매코드 조회 -> ajax 사용
					$.ajax({
				        url: '/reservation/selectNextResCodeAjax', //요청경로
				        type: 'get',
				        data: {
				        		'mvTimeCode':mvTimeCode,
				        		'screenDay':screenDay
				        		},
				        async: false,	//동기.. 순차적으로 진행하도록..
				        success: function(result) {
				        	//ajax 실행 성공 시 실행되는 구간
				        	//데이터 확인해봄!
				        	//alert(result);
				        	
				        	//input태그에 예매코드 값 설정
							$('#resCode').val(result);
				        },
				        error: function(){
				        	//ajax 실행 실패 시 실행되는 구간
				        	alert('다음 코드 조회 실패');
				        }
					});
			        
			        //예매내역에 넣을 데이터들 세팅
			        var paymentForm = $('#paymentForm').serialize(); //serialize() : 입력된 모든 element를 문자열의 데이터에 serialize 한다.
			        
			        //예매코드 데이터
			        var resCode = $('#resCode').val();
			        var seatName = $('#seatName').val();
	                var seatCnt = $('#seatCnt').val();
	                var theaterCode = $('#theaterCode').val();
			        
			        //결제 후 예매내역 insert 하기 -> ajax 사용
					$.ajax({
				        url: '/reservation/insertReservationAjax', //요청경로
				        type: 'post',
				        data: paymentForm, //필요한 데이터
				        async: false,	//동기.. 순차적으로 진행하도록..
				        success: function(result) {
				        	//ajax 실행 성공 시 실행되는 구간
				        	alert(msg);
							
					        location.href = '/reservation/payComplete?resCode=' + resCode + '&seatName=' + seatName + '&seatCnt=' + seatCnt + '&theaterCode=' + theaterCode;
				        },
				        error: function(){
				        	//ajax 실행 실패 시 실행되는 구간
				        	alert('디비 입력 실패');
				        }
					});
			        
			        //결제 후 페이지 이동 O
			        //result ='0';
			    } else {				//결제 실패 시
			    	//결제 실패 시 얼럿창
			    	alert('결제에 실패하였습니다.');
			        //var msg = '결제에 실패하였습니다.';
			        //msg += '에러내용 : ' + rsp.error_msg;
			        
			        //결제 후 페이지 이동 X
			        //result ='1';
			    }
			    //if(result=='0') {
			    	//location.href= $.getContextPath()+"/Cart/Success";
			    //}
			    
			    //결제 결과 얼럿창
			    //alert(msg);
			});
	});
</script>

</html>