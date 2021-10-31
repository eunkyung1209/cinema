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

<script type="text/javascript" src="/resources/customer/js/input_password.js?ver=6"></script>
</head>
<body>
<div class="row bodyDiv">
	<div class="col-12">
	
		<div class="row justify-content-center"  >
			<div class="col-5 passwordDiv">
				<input type="hidden" id="customerCode" name="customerCode" value="${customerCenterVO.customerCode }">
				<input type="hidden" id="secretNumber" value="${customerCenterVO.secretNumber }">
				<div>
					비밀번호 <input type="password" id="test" >
					<input type="button" class="common_btn" value="입력" onclick="checkPw();">
				</div>
				
				
			
			</div>
		</div>
	</div>
</div>
</body>
</html>