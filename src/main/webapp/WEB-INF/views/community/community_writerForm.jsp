<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글 작성하는곳</title>
</head>
<body>
커뮤니티 게시글 작성하는곳


	 <form action="/board/insertBoard" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" required></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" value="${sessionScope.loginInfo.nickName }" readonly></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><input type="date" name="createDate"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="60" rows="5" name="content"></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="boardPw"></td>
		</tr>
	</table>
	<div class="btnDiv">
		<input type="submit" class="btn" value="글등록"  >
	</div>
</form>
</body>
</html>