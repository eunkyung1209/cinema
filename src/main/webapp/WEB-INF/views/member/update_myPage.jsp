<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 스크립트 연결 -->
<script type="text/javascript" src="/resources/member/js/join.js?ver=3"></script>

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
	margin-left: 60%;
}
 
 
 
.joinInput2{
	width: 20%;
}
.joinInput1{
	width: 68%;
}
.joinInput3{
	width: 190px;
}

/*검색 버튼 기본폼 */
.common_btn{
	background-color: #4c4747;
	color: white;
	width: 80px;
	font-size: 11px;
}
.common_btn:hover{
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
											<span style="font-size: 20px;">${sessionScope.loginInfo.name }님의 정보수정란입니다.</span> 
											<span class="needInput" style=""><span class="redStar">*</span>필수입력</span>
											<input type="hidden" name="isNotice" value="N">
										</td>
									</tr>
								</thead>	
								
								<!-- 자유롭게 수정하여 사용 단, 인풋태그 태그 초기화 작업을 하였기에 css사용시, 선택자를 input으로 주는 것을 지양할 것 -->
								<!-- '필수입력' 복사하여 사용 ->  <span class="redStar">*</span> -->
								<tbody>
								
									<tr>
										<td >이름 <span class="redStar">*</span></td>
										<td >
											<input type="text" name="name" class="joinInput1" id="floatingInput" placeholder="이름을 입력하세요." value="${sessionScope.loginInfo.name }"required>
										</td>
									</tr>
									<tr>
										<td >생년월일 <span class="redStar">*</span></td>
										<td >
											<input type="date" name="birthday" class="joinInput3" required>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별&nbsp;:&nbsp;
											<input type="radio" name="gender" value="남" checked>남자
											&nbsp;
											<input type="radio" name="gender" value="여">여자
										</td>
									</tr>
									<tr>
										<td >휴대폰 번호 <span class="redStar">*</span></td>
										<td >
											<select id="tell1" class="joinInput2" name="tells">
										      	<option value="010" selected>010</option>
										      	<option value="011">011</option>
										    </select> &nbsp;&nbsp;-&nbsp;&nbsp;
											<input type="text" name="tells" class="joinInput2" required>&nbsp;&nbsp;-&nbsp;&nbsp;
											<input type="text" name="tells" class="joinInput2" required>
										</td>
									</tr>
									<tr>
										<td >아이디<span class="redStar">*</span></td>
										<td >
											<div  id="checkIdDiv">
												<input type="text" id="id" name="id" class="joinInput1"  placeholder="영문,숫자 조합(8~12자)" required>
												<input type="button" class="common_btn2" id="btn2" onclick="checkId();" value="중복확인">
											</div>
										</td>
									</tr>
									<tr>
										<td >닉네임<span class="redStar">*</span></td>
										<td >
											<div  id="checkNickDiv">
												<input type="text" id="nickName" name="nickName" class="joinInput1" id="floatingInput" placeholder="자유롭게 입력해 주세요." required>
												<input type="button" class="common_btn2" id="btn2" onclick="checkNick();" value="중복확인">
											</div>
										</td>
									</tr>
									<tr>
										<td >비밀번호<span class="redStar">*</span></td>
										<td >
											<input type="password" id="pw" name="pw" class="joinInput1"  placeholder="영문,숫자,특수기호 중 2가지 이상 조합" required>
										</td>
									</tr>
									<tr>
										<td >비밀번호 확인<span class="redStar">*</span></td>
										<td >
											<input type="password" id="c_pw" class="joinInput1" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" required>
										</td>
									</tr>
									
									<tr>
										<td >이메일 <span class="redStar">*</span></td>
										<td >
											<input type="text" name="email" class="joinInput1"  id="floatingEmail" placeholder="이메일주소를 입력해 주세요." required>
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



				<div style="height: 80px;"></div>
				
				<!-- 기본 버튼 클래스명: common_btn -->
				<div class="row justify-content-center">
					<div class="col-8" style="text-align: center;">
						<input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/customer/goCustomer';">
					</div>
				</div>
			</div>
	</div>
</div>
</form>

</body>
</html>