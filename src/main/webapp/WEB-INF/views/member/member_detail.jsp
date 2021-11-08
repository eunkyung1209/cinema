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
width: 75%;
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
	margin-left: 90%;
}
 

/*검색 버튼 기본폼 */
.common_btn{
	color: white;
	width: 80px;
	font-size: 11px;
}
.common_btn:hover{
	font-size: 11px;
	color: white;
	width: 80px;
}
.agree{
	background-color: white;
	width: 90%;
	margin: 0 auto;
}
</style>


</head>
<body>

		<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-6">
				<div class="col-3 subjectDiv">
					<h5>회원정보상세</h5>
				</div>
			</div>
		</div>
	
		<!-- 공간 -->
		<div style="height: 30px;"></div>


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
											<span class="needInput" style=""><span class="redStar">*</span>필수입력</span>
											<input type="hidden" name="isNotice" value="N">
										</td>
									</tr>
								</thead>	
								
								<!-- 자유롭게 수정하여 사용 단, 인풋태그 태그 초기화 작업을 하였기에 css사용시, 선택자를 input으로 주는 것을 지양할 것 -->
								<!-- '필수입력' 복사하여 사용 ->  <span class="redStar">*</span> -->
								<tbody>
								
									<tr>
										<td >가입날짜 <span class="redStar">*</span></td>
										<td >${memberDetail.joinDate} </td>
									</tr>
									<tr>
										<td >이름 <span class="redStar">*</span></td>
										<td >${memberDetail.name} </td>
									</tr>
									<tr>
										<td >생일 <span class="redStar">*</span></td>
										<td >${memberDetail.birthday} </td>
									</tr>
									<tr>
										<td >성별 <span class="redStar">*</span></td>
										<td >${memberDetail.gender} </td>
									</tr>
									<tr>
										<td >전화번호 <span class="redStar">*</span></td>
										<td >${memberDetail.tell} </td>
									</tr>
									<tr>
										<td >아이디 <span class="redStar">*</span></td>
										<td >${memberDetail.id} </td>
									</tr>
									<tr>
										<td >닉네임 <span class="redStar">*</span></td>
										<td >${memberDetail.nickName} </td>
									</tr>
									
									<tr>
										<td >이메일 <span class="redStar">*</span></td>
										<td >${memberDetail.email} </td>
									</tr>
									<tr>
										<td >마이시네마</td>
										<td >${memberDetail.myCinema} </td>
									</tr>
									<tr>
										<td >무인티켓사용</td>
										<td >${memberDetail.nonpeopleTicket} </td>
									</tr>
									<tr>
										<td >마켓팅동의여부</td>
										<td >${memberDetail.marketingAgree} </td>
									</tr>
									<tr>
										<td >- 포인트</td>
										<td >${memberDetail.point} </td>
									</tr>
									<tr>
										<td >- 적립금</td>
										<td >${memberDetail.savedMoney} </td>
									</tr>
									
									
								</tbody>
							</table>
						
					</div>
				</div>
				

				<div style="height: 80px;"></div>
				
				<!-- 기본 버튼 클래스명: common_btn -->
				<div class="row justify-content-center">
					<div class="col-8" style="text-align: center;">
						<input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/member/myPage?id=${sessionScope.loginInfo.id }&nickName=${sessionScope.loginInfo.nickName }';">
					</div>
				</div>
			</div>
	</div>
</div>
</form>

</body>
</html>