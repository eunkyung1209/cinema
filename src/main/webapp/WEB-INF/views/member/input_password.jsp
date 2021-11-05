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
<script src="https://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 최신버전 가져오기 -->
<script type="text/javascript" src="/resources/member/js/update.js?ver=2"></script>
</head>
<body>
<form action="/member/updatePW" method="post" ><
	<div class="row bodyDiv">
		<div class="col-12">
		
			<div class="row justify-content-center"  >
				
				
				
				
				<div class="col-5 passwordDiv">
				
					<label for="pw">비밀번호</label><span class="redStar">*</span>
					
						<input type="password" id="pw" name="pw" class="joinInput1"  placeholder=" password" required>
						
						<div class="check_font" id="pw_check"></div>
					
					<label for="pw2">비밀번호 확인</label><span class="redStar">*</span>
					
						<input type="password" id="pw2" name="pw2" class="joinInput1" placeholder=" confirm password" required>
						
						<div class="check_font" id="pw2_check"></div>
				
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
</form>
</body>
</html>