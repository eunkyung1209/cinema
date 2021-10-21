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

</style>

<script type="text/javascript" src="/resources/customer/js/input_password.js?ver=01"></script>
</head>
<body>
<div class="row bodyDiv">
	<div class="col-12">
	
		<div class="row justify-content-center"  >
			<div class="col-3">
				<input type="hidden" name="customerCode" value="${customerCenterVO.customerCode }">
				비밀번호
				<input type="password" name="secretNumber" >
				<input type="button" class="btn btn-outline-secondary" value="입력" onclick="checkPw(${customerCenterVO.customerCode });">
			
			</div>
		</div>
	</div>
</div>
</body>
</html>