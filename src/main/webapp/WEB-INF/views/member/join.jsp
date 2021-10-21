<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 주소 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 스크립트 연결 -->
<script type="text/javascript" src="/resources/member/js/join_form.js?ver=1"></script>

<script type="text/javascript" src="/resources/member/js/join.js?ver=3"></script>

<style type="text/css">

body{
	margin: 0 auto;
	background-color: white;
	color: black;
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
	width: 400px;
}
.twoTd{
	width: 500px;
}
.treeTd{
	
}
.allTable{
	width: 800px;
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

<form class="row g-3" action="/member/join" method="post" id="joinForm">

<div class="all">

<div class="body">
<!-- 회원가입 -->
<table class="allTable" >
	<tr>
		<td colspan="2" class="head2_Td">회원정보를 입력해주세요.</td>
	</tr>
	<tr>
		<td class="oneTd">이름</td>
		<td class="twoTd">
			<input type="text" name="name" class="joinInput1" id="floatingInput" placeholder="이름을 입력하세요." required>
		</td>
	</tr>
	<tr>
		<td class="oneTd">생년월일</td>
		<td class="twoTd">
			<input type="date" name="birthday" class="joinInput3" required>
			&nbsp;&nbsp;&nbsp;&nbsp;/
			&nbsp;&nbsp;성별&nbsp;&nbsp;
			<input type="radio" name="gender" value="남" checked>남자
			&nbsp;
			<input type="radio" name="gender" value="여">여자
		</td>
	</tr>
	<tr>
		<td class="oneTd">휴대폰 번호</td>
		<td class="twoTd">
			<select id="tell1" class="joinInput2" name="tells">
		      	<option value="010" selected>010</option>
		      	<option value="011">011</option>
		    </select> &nbsp;&nbsp;-&nbsp;&nbsp;
			<input type="text" name="tells" class="joinInput2" required>&nbsp;&nbsp;-&nbsp;&nbsp;
			<input type="text" name="tells" class="joinInput2" required>
		</td>
	</tr>
	<tr>
		<td class="oneTd">아이디</td>
		<td class="twoTd">
		<div  id="checkIdDiv">
			<input type="text" id="id" name="id" class="joinInput1"  placeholder="영문,숫자 조합(8~12자)" required>
			<button type="button" class="btn btn-primary" id="btn2" onclick="checkId();">중복확인</button>
		</div>
		</td>
	</tr>
	<tr>
		<td class="oneTd">닉네임</td>
		<td class="twoTd">
		<div  id="checkNickDiv">
			<input type="text" id="nickName" name="nickName" class="joinInput1" id="floatingInput" placeholder="자유롭게 입력해 주세요." required>
			<button type="button" class="btn btn-primary" id="btn2" onclick="checkNick();">중복확인</button>
		</div>
		</td>
	</tr>
	<tr>
		<td class="oneTd">비밀번호</td>
		<td class="twoTd">
			<input type="password" id="pw" name="pw" class="joinInput1"  placeholder="영문,숫자,특수기호 중 2가지 이상 조합" required>
		</td>
	</tr>
	<tr>
		<td class="oneTd">비밀번호 확인</td>
		<td class="twoTd">
			<input type="password" id="c_pw" class="joinInput1" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" required>
		</td>
	</tr>
	<tr>
		<td class="oneTd">이메일 주소</td>
		<td class="twoTd">
			<input type="text" name="email" class="joinInput1"  id="floatingEmail" placeholder="이메일주소를 입력해 주세요." required>
		</td>
	</tr>
	<tr>
		<td class="oneTd">무인발권기<br>기능 설정</td>
		<td class="twoTd">
			<input type="radio" name="nonpeopleTicket" value="Y" checked>사용
			&nbsp;
			<input type="radio" name="nonpeopleTicket" value="N">사용안함
			&nbsp;&nbsp;*'생년월일+휴대폰번호로'티켓출력
		</td>
	</tr>
	
	<tr>
		<td>주소 :</td>
		<td>
		<input type="text" style="width: 120px;" id="postCode" name="addr">
				<input type="button" class="btn" onclick="openPostCode();" style="width: 41%; padding: 2px 0; font-size: 15px;" value="우편번호찾기"><br>
			<input type="text" class="inputSize" id="addr" name="addr"><br>
			<input type="text" class="inputSize" name="addr">
		</td>
	<tr>
	
	<!-- <tr>
		<td class="oneTd">나만의 영화관</td>
		<td class="twoTd">
			자주 방문하는 영화관을 등록해주세요!<br>
			<input type="text"  name="myCinema" class="joinInput1" >
			<button type="button" class="btn btn-primary" id="btn2">설정</button>
		</td>
	</tr> -->
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
	<tr>
		<td colspan="3">
		<input type="radio" name="marketingAgree" value="Y" checked>동의
		&nbsp;
		<input type="radio" name="marketingAgree" value="N">동의안함</td>
	</tr>

	
</table>

	<div class="col-12 d-grid">
		<input type="button" id="joinBtn" class="btn btn-primary disabled" value="J o i n" onclick="goJoin();">
	</div>

</div>
</div>
</form>

</body>
</html>