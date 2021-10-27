<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 스크립트 연결 -->
<!-- <script type="text/javascript" src="/resources/member/js/join.js?ver=3"></script> -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 최신버전 가져오기 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script type="text/javascript" src="/resources/member/js/join.js?ver=27"></script>




<style type="text/css">

/* 작성테이블 */
.writeTable{
margin: 0 auto;
width: 90%;
border-bottom: solid 1px #c9c9c8;
height: 500px;
}

td:first-child{
	text-align: center;
	background-color: #f2f2f2;
}
tr{
border-bottom: 1px solid #c9c9c8;
}

td{
vertical-align: middle;
padding: 5px;
padding-left: 10px;

}
input[type="password"], input[type="email"] {
	width: 68%;

}
select {
	width: 30%; 
}

/* 필수입력 빨간 별 */
.redStar{
	color: red;
} 

/* *필수입력 문장  */
.needInput{
	font-size: 13px;
	margin-left: 64%;
}
 
 
 
.joinInput2{
	width: 40%;
}
.joinInput1{
	width: 68%;
}
.joinInput3{
	width: 190px;
}

/*검색 버튼 기본폼 */
button{
	background-color: #4c4747;
	color: white;
	width: 80px;
	font-size: 11px;
}
button:hover{
	font-size: 11px;
	background-color: #5d5959;
	color: white;
	width: 80px;
}
.agree{
	background-color: white;
	width: 90%;
	margin: 0 auto;
}

/* 상세보기 버튼폼 */
.common_btn2{
	font-size: 12px;
	background-color: #4c4747;
	color: white;
	width: 65px;
}
.common_btn2:hover{
	font-size: 12px;
	background-color: #5d5959;
	color: white;
	width: 65px;
}
</style>


</head>
<body>

	<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-7">
				<div class="col-3 subjectDiv">
					<h5>회원가입</h5>
				</div>
			</div>
		</div>
	
		<!-- 공간 -->
		<div style="height: 60px;"></div>


<form class="row g-3" action="/member/join" method="post" id="joinForm">
<div class="row bodyDiv" >
	<div class="col-12">
	
	<!-- 글 작성 테이블 입니다. 테이블 클래스명 : writeTable 수정 후 사용바랍니다.-->
			<div class="row justify-content-center align-middle">
			
				<div class="row justify-content-center" >
					<div class="col-8" >
							<table class="writeTable">
								<colgroup>
									<col width="20%">
									<col width="*">
								</colgroup>
								
								<thead>
									<tr>
										<td colspan="2" style="background-color: white; padding-bottom: 5px;" >
											<span style="font-size: 17px;"> - 회원정보를 입력해주세요.</span> 
											<span class="needInput" style=""><span class="redStar">*</span>필수입력</span>
											<input type="hidden" name="isNotice" value="N">
										</td>
									</tr>
								</thead>	
								
								<!-- 자유롭게 수정하여 사용 단, 인풋태그 태그 초기화 작업을 하였기에 css사용시, 선택자를 input으로 주는 것을 지양할 것 -->
								<!-- '필수입력' 복사하여 사용 ->  <span class="redStar">*</span> -->
								<tbody>
								
									<tr>
										<td ><label for="name">이름</label> <span class="redStar">*</span></td>
										<td >
											<input type="text" name="name" id="name" class="joinInput1" placeholder=" name" required>
											
											<div class="check_font" id="name_check"></div>
										</td>
									</tr>
									
									<tr>
										<td ><label for="birthday">생년월일</label> <span class="redStar">*</span></td>
										<td >
											<input type="text" name="birthday" id="birthday" class="joinInput2" placeholder=" ex) 19450815" required>

											
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별&nbsp;:&nbsp;
											<input type="radio" name="gender" value="남" checked>남자
											&nbsp;
											<input type="radio" name="gender" value="여">여자
											
											<div class="check_font" id="birth_check"></div>
											
										</td>
									</tr>
									
									<tr>
										<td ><label for="tell">휴대전화</label> <span class="redStar">*</span></td>
										<td >
											<input type="text" name="tell"  id="tell" class="joinInput1" placeholder=" ex) 01011112222" required>
											
											<div class="check_font" id="tell_check"></div>
										</td>
									</tr>
									
									<tr>
										<td ><label for="id">아이디</label><span class="redStar">*</span></td>
										<td >
											<div  id="checkIdDiv">
												<input type="text" id="id" name="id" class="joinInput1"  placeholder=" ex) eunbin98" required>
												<!-- <input type="button" class="common_btn2" id="btn2" onclick="checkId();" value="중복확인"> -->
												
												<div class="check_font" id="id_check"></div>
											</div>
										</td>
									</tr>
									<tr>
										<td ><label for="nickName">닉네임</label><span class="redStar">*</span></td>
										<td >
											<div  id="checkNickNameDiv">
												<input type="text" id="nickName" name="nickName" class="joinInput1"  placeholder=" ex) oisone짱 " required>
												<!-- <input type="button" class="common_btn2" id="btn2" onclick="checkId();" value="중복확인"> -->
												
												<div class="check_font" id="nickName_check"></div>
											</div>
										</td>
									</tr>
									<tr>
										<td ><label for="pw">비밀번호</label><span class="redStar">*</span></td>
										<td >
											<input type="password" id="pw" name="pw" class="joinInput1"  placeholder=" password" required>
											
											<div class="check_font" id="pw_check"></div>
										</td>
									</tr>
									<tr>
										<td ><label for="pw2">비밀번호 확인</label><span class="redStar">*</span></td>
										<td >
											<input type="password" id="pw2" name="pw2" class="joinInput1" placeholder=" confirm password" required>
											
											<div class="check_font" id="pw2_check"></div>
										</td>
									</tr>
									<tr>
										<td ><label for="email">이메일</label><span class="redStar">*</span></td>
										<td >
											<div  id="checkEmailDiv">
												<input type="text" id="email" name="email" class="joinInput1"  placeholder=" ex) eunbin@naver.com" required>
												<!-- <input type="button" class="common_btn2" id="btn2" onclick="checkId();" value="중복확인"> -->
												
												<div class="check_font" id="email_check"></div>

												
											</div>
										</td>
									</tr>

									<tr>
										<td >마이시네마 <span class="redStar"></span></td>
										<td >
											<select class="joinInput2" name="myCinema">
										      	<option value="선택안함" selected>선택안함</option>
										      	<option value="울산">울산</option>
										      	<option value="서울" >서울</option>
										      	<option value="부산" >부산</option>
										      	<option value="김해" >김해</option>
										    </select>
										</td>
									</tr>
									<tr>
										<td>무인발권기<br>기능 설정</td>
										<td>
											<input type="radio" name="nonpeopleTicket" value="Y" checked>사용
											&nbsp;
											<input type="radio" name="nonpeopleTicket" value="N">사용안함
											&nbsp;&nbsp;*'생년월일+휴대폰번호로'티켓출력
										</td>
									</tr>				
									
								</tbody>
							</table>
						
					</div>
				</div>
				
				<div style="height: 80px;"></div>

<!-- 마켓팅동의 -->
<div class="row justify-content-center"  >
<div class="col-8" >
	<table class="agree" style="background-color: pink;">
		<colgroup>
			<col width="20%">
			<col width="*">
		</colgroup>
		<tr>
			<td colspan="3" style="background-color: white; border: 1px solid #c9c9c8; text-align: left;">
				<br>
				<br>
				<br>
					<div style="text-align: center; font-size: 16px; font-weight: bold;">- 마케팅 활용을 위한 개인정보 수집 이용 안내(선택) -</div>
				<br>
				<br>
				<br>
				
				■ 수집목적
				<br>
				고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유<br>
				<br>
				<br>
				■ 수집항목
				<br>
				<br>
				
				■ 보유기간
				회원 탈퇴 시 혹은 이용 목적 달성 시까지
				<br>
				<br>
								
				■ 수집하는 개인정보 항목
				<br>
				회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
				ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 취미 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록
				ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식 , 배송 요청
				<br>
				<br>
				<br>
				■ 개인정보의 수집 및 이용목적
				<br>
				회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다..
				 ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
				콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스
				 ο 회원 관리
				회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와
				비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리
				 ο 마케팅 및 광고에 활용
				신규 서비스(제품) 개발 및 특화 , 이벤트 등 광고성 정보 전달 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 ,
				접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
				<br>
				<br>
				<br>
				■ 개인정보의 보유 및 이용기간
				<br>
				회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
				<br>
				<br>
				<br>
				<br>
				
				
				<div style="text-align: center;">
					<input type="radio" name="marketingAgree" value="Y" checked> 동의
					&nbsp;
					<input type="radio" name="marketingAgree" value="N"> 동의안함
				</div>
		
			</td>
		</tr>
	</table>
</div>
</div>



				<div style="height: 80px;"></div>
				
				<!-- 기본 버튼 클래스명: common_btn -->
				<div class="row justify-content-center">
					<div class="col-8" style="text-align: center;">
						<!-- <input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/customer/goCustomer';">
						<input type="button" class="common_btn"  id="joinBtn" value="회원가입" onclick="goJoin();"> -->
						
						<input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/customer/goCustomer';">
						
						<button id="reg_submit">
							<i class="common_btn" aria-hidden="true"></i>회원가입
						</button>

						<!-- <input type="button" class="common_btn" aria-hidden="true" id="reg_submit" value="회원가입" > -->
					
					</div>
				</div>
			</div>
	</div>
</div>
</form>

</body>
</html>