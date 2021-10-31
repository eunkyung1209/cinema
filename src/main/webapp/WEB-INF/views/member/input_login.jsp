<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bodyDiv{
	margin-top: 100px;

}

.passwordDiv{
text-align: center;
}

</style>

<script type="text/javascript" src="/resources/member/js/input_login.js?ver=1"></script>
</head>
<body>
<div class="row bodyDiv">
	<div class="col-12">
	
		<div class="row justify-content-center"  >
			<div class="col-5 passwordDiv">
				<input type="hidden" id="commuCode" name="commuCode" value="${communityVO.commuCode }">
				<input type="hidden" id="secret" value="${communityVO.secret }">
				
				<div>로그인이 필요한 서비스 입니다.</div>
				<div>로그인 후 이용 부탁드립니다:)</div>
				<div>
					아이디 <input type="password" id="test" >
					비밀번호 <input type="password" id="test" >
					<input type="button" class="btn btn-outline-secondary" value="입력" onclick="checkPw();">
				</div>
				
				
			
			</div>
		</div>
	</div>
</div>
</body>
</html>