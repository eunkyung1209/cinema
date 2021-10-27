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
	margin-left: 61%;
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

	<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-7">
				<div class="col-3 subjectDiv">
					<h5>나의 정보수정</h5>
				</div>
			</div>
		</div>
	
		<!-- 공간 -->
		<div style="height: 60px;"></div>


<form action="/member/updateMyPage" method="post" ><!-- id="joinForm" -->
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
											<span style="font-size: 17px;"> - ${sessionScope.loginInfo.name }님의 정보수정란입니다.</span> 
											<span class="needInput" style=""><span class="redStar">*</span>필수입력</span>
											<input type="hidden" name="isNotice" value="N">
										</td>
									</tr>
								</thead>	
								
								<!-- 자유롭게 수정하여 사용 단, 인풋태그 태그 초기화 작업을 하였기에 css사용시, 선택자를 input으로 주는 것을 지양할 것 -->
								<!-- '필수입력' 복사하여 사용 ->  <span class="redStar">*</span> -->
								<tbody>
								
									<tr style="height: 60px;">
										<td >아이디<span class="redStar"> 변경불가</span></td>
										<td >
											${sessionScope.loginInfo.id }
										</td>
									</tr>
									<tr style="height: 60px;">
										<td >닉네임<span class="redStar"> 변경불가</span></td>
										<td >
											${sessionScope.loginInfo.nickName }
										</td>
									</tr>
									<tr>
										<td >이름 <span class="redStar">*</span></td>
										<td >
										<input type="text" name="name" class="joinInput1" id="floatingInput" placeholder=" 이름을 입력하세요." value="${sessionScope.loginInfo.name }"required>
										</td>
									</tr>
									<tr>
										<td >생년월일 <span class="redStar">*</span></td>
										<td >
											<input type="date" name="birthday" class="joinInput3" value="${sessionScope.loginInfo.birthday }" required>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별&nbsp;:&nbsp;
											<c:if test="${sessionScope.loginInfo.gender eq '남'}">
												<input type="radio" name="gender" value="남" checked>남자
												&nbsp;
												<input type="radio" name="gender" value="여">여자
											</c:if>
											
											<c:if test="${sessionScope.loginInfo.gender eq '여'}">
												<input type="radio" name="gender" value="남" >남자
												&nbsp;
												<input type="radio" name="gender" value="여" checked>여자
											</c:if>
										</td>
									</tr>
									<tr>
										<td >휴대폰 번호 <span class="redStar">*</span></td>
										<td >
											<input type="text" name="tell" class="joinInput1" placeholder=" 010-1111-1111 형식으로 입력하세요." value="${sessionScope.loginInfo.tell }"required>
										</td>
									</tr>
									<tr>
										<td >이메일 <span class="redStar">*</span></td>
										<td >
											<input type="text" name="email" class="joinInput1"  id="floatingEmail" placeholder=" aa22@aaa 형식으로 입력하세요." value="${sessionScope.loginInfo.email }" required>
										</td>
									</tr>
									<tr>
										<td >마이시네마 <span class="redStar"></span></td>
										<td >
											<select class="joinInput2" name="myCinema" >
										      	<option value="value=${sessionScope.loginInfo.myCinema }" selected>선택안함</option>
										      	<option value="선택안함">선택안함</option>
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
											<c:if test="${sessionScope.loginInfo.nonpeopleTicket eq 'Y'}">
												<input type="radio" name="nonpeopleTicket" value="Y" checked>사용
												&nbsp;
												<input type="radio" name="nonpeopleTicket" value="N">사용안함
												&nbsp;&nbsp;*'생년월일+휴대폰번호로'티켓출력
											</c:if>
											
											<c:if test="${sessionScope.loginInfo.nonpeopleTicket eq 'N'}">
												<input type="radio" name="nonpeopleTicket" value="Y">사용
												&nbsp;
												<input type="radio" name="nonpeopleTicket" value="N" checked>사용안함
												&nbsp;&nbsp;*'생년월일+휴대폰번호로'티켓출력
											</c:if>
										</td>
									</tr>				
									
								</tbody>
							</table>
						
					</div>
				</div>
				

				<div style="height: 80px;"></div>
				
				
				<!-- 기본 버튼 클래스명: common_btn -->
				<div class="row justify-content-center">
					<div class="col-8" style="text-align: center;">
						<input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/member/myPage';">
						<input class="common_btn" type="submit" value="수정저장">
					</div>
				</div>
			</div>
	</div>
</div>
</form>

</body>
</html>