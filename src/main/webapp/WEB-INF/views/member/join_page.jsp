<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body{
	margin: 0 auto;
}
.all{
	padding-top: 70px;
	font-size: 18px;
}
.head{
	padding-bottom: 40px;
}
.oneTd{
	height: 55px;
	width: 280px;
}
.twoTd{
	width: 500px;
}
.treeTd{
	
}
.allTable{
	width: 650px;
	margin: 0 auto;
	border: 1px solid black;
}
.head1_Td{
	padding-bottom: 10px;
}
.head2_Td{
	padding-bottom: 30px;
}
.joinInput1{
	width: 350px;
}
.joinInput2{
	width: 94px;
}
.joinInput_Birth{
	width: 150px;
}


/*  */

.agree{
	width: 650px;
	margin: 0 auto;
	border: 1px solid black;
}

</style>
</head>
<body>

<div class="all">

<div class="body">
<!-- 회원가입 -->
<table class="allTable">
	<tr>
		<td colspan="2" class="head2_Td">회원정보를 입력해주세요.</td>
	</tr>
	<tr>
		<td class="oneTd">생년월일</td>
		<td class="twoTd">
			<input type="date" class="joinInput3">
			&nbsp;&nbsp;&nbsp;&nbsp;/
			&nbsp;&nbsp;성별&nbsp;&nbsp;
			<input type="radio" checked>남자
			&nbsp;
			<input type="radio">여자
		</td>
	</tr>
	<tr>
		<td class="oneTd">휴대폰 번호</td>
		<td class="twoTd">
			<input type="text" class="joinInput2">&nbsp;&nbsp;-&nbsp;&nbsp;
			<input type="text" class="joinInput2">&nbsp;&nbsp;-&nbsp;&nbsp;
			<input type="text" class="joinInput2">
		</td>
	</tr>
	<tr>
		<td class="oneTd">아이디</td>
		<td class="twoTd">
			<input type="text" name="id" class="joinInput1" id="floatingInput" placeholder="영문,숫자 조합(8~12자)" required name="id">
			<button type="button" class="btn btn-primary" id="btn2" onclick="checkId();">중복확인</button>
		</td>
	</tr>
	<tr>
		<td class="oneTd">닉네임</td>
		<td class="twoTd">
			<input type="text" name="nickname" class="joinInput1" id="floatingInput" placeholder="자유롭게 입력해 주세요." required name="id">
			<button type="button" class="btn btn-primary" id="btn2" onclick="checkId();">중복확인</button>
		</td>
	</tr>
	<tr>
		<td class="oneTd">비밀번호</td>
		<td class="twoTd">
			<input type="text" name="pw" class="joinInput1" id="floatingPassword" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" required name="pw">
		</td>
	</tr>
	<tr>
		<td class="oneTd">비밀번호 확인</td>
		<td class="twoTd">
			<input type="text" name="id" class="joinInput1"  id="floatingPassword" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" required name="pw">
		</td>
	</tr>
	<tr>
		<td class="oneTd">이메일 주소</td>
		<td class="twoTd">
			<input type="text" name="email" class="joinInput1"  id="floatingEmail" placeholder="이메일주소를 입력해 주세요." required name="email">
		</td>
	</tr>
	<tr>
		<td class="oneTd">무인발권기<br>기능 설정</td>
		<td class="twoTd">
			<input type="radio" checked>사용
			&nbsp;
			<input type="radio">사용안함
			&nbsp;&nbsp;*'생년월일+휴대폰번호로'티켓출력
		</td>
	</tr>
	<tr>
		<td class="oneTd">나만의 영화관</td>
		<td class="twoTd">
			자주 방문하는 영화관을 등록해주세요!
		</td>
		<td class="twoTd">
			<input type="text" name="myCinema">
			<button type="button" class="btn btn-primary" id="btn2" onclick="checkId();">설정</button>
		</td>
	</tr>
</table>

<br>
<br>
<br>
<br>

<!-- 마켓팅동의 -->
<table class="agree">
	<tr>
		<td colspan="3">
			마케팅 활용을 위한 개인정보 수집 이용 안내(선택)
		</td>
	</tr>
	
	<tr>
		<td colspan="3">수집목적</td>
	</tr>
	<tr>
		<td colspan="3">고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</td>
	</tr>
	
	<tr>
		<td colspan="3">수집항목</td>
	</tr>
	<tr>
		<td colspan="3">고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</td>
	</tr>
	
	<tr>
		<td colspan="3">보유기간</td>
	</tr>
	<tr>
		<td colspan="3">회원 탈퇴 시 혹은 이용 목적 달성 시까지</td>
	</tr>
	
	<tr>
		<td colspan="3">보유기간</td>
	</tr>
	<tr>
		<td colspan="3">회원 탈퇴 시 혹은 이용 목적 달성 시까지</td>
	</tr>

	
</table>

</div>

</div>

</body>
</html>