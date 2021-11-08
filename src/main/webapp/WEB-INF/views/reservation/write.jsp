<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailForm.jsp</title>
</head>
<body>
<div class="container">
	<h2>메일 보내기</h2>
	<form action="/mail/mailForm" method="post" class="was-validated">
			<label for="toMail">받는 사람 메일주소 : </label>
			<input type="text" value="${sessionScope.loginInfo.email }" name="toMail" required/>
			
			<input type="hidden" class="form-control" value="[OISONE CINEMA] 예매 확인 메일" id="title" name="title" placeholder="메일제목을 입력하세요" />
			<input type="hidden" value="  " name="content">
			
		<button type="submit" class="btn btn-secondary">메일보내기</button>
		<button type="reset" class="btn btn-secondary">다시쓰기</button>
		<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/'">돌아가기</button>
	</form>
	
	 
	
</div>
</body>
</html>