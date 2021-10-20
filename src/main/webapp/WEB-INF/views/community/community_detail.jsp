<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.replyDiv{
	font-size: 10px;
	border-bottom: 1px solid #dddddd;
}
.replyWriter{
font-weight: bold;
}
.replyDate{
	color:#bbbbbb;
}



</style>

   

</head>
<body>
	<table>
		<tr>
			<td>글번호</td>
			<td>${communityVO.commuCode }</td>
			<td>작성자</td>
			<td>${communityVO.writer}</td>
			<td>작성일</td>
			<td>${communityVO.createDate }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="5">${communityVO.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="5">${communityVO.content }</td>
		</tr>
		
	</table>
<div class="btnDiv">

	<c:if test="${sessionScope.loginInfo.memberId eq 'admin' or sessionscope.loginInfo.memberId eq communityVO.writer}">
		<input type="button" class ="btn" value="삭제" onclick="deletBoard(${board.commuCode});"> 
		<input type="button" class ="btn" value="수정" onclick="location.href='updateForm.bo?commuCode=${communityVO.commuCode}';">
	</c:if>
	

</div>

<p>

	<c:if test="${ not empty sessionScope.loginInfo}"></c:if>
	<div>
		<form action="insertReply" method="post">
		<input type="hidden" name="commuCode " value="${communityVO.commuCode }">
			<textarea rows="3" cols="30" name="content"></textarea>
			<input type="submit" value="댓글등록">
		</form> 
	</div>
<c:forEach items="${replyList }" var="communityReplyVO">
	<div class="replyDiv">
		<div class="replyWriter">${communityReplyVO .writer }</div>
		<div class="replyDate">${communityReplyVO.createDate }</div>
		<div>${replyDTO.content }</div>
	<c:if test="${sessionScope.loginInfo.memberId eq 'admin'or sessionScope.loginInfo.memberId eq communityReplyVO.writer}">
		<div><input type="button" value="삭제" onclick="location.href='deleteReply.re?replyNum=${communityReplyVO.replyNum}&boardNum=${communityVO.boardNum }';"></div>
	
	</c:if>
	</div>
</c:forEach>




</body>
</html>