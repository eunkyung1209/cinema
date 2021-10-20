<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>

<style type="text/css">

table{
	width: 700px;
	margin: 0 auto;
	border-collapse: collapse;
	text-align: center;
}
tr, td{
	border-bottom: 1px solid #dddddd;
	padding-top: 10px;
	padding-bottom: 10px;
}
tr{
	/* height: 30px; */
	
}
thead > tr{
	background-color: #eeeeee;
	border-top: 1.5px solid #01579b;
}
.total{
	width: 700px;
	margin: 0 auto;
	margin-bottom: 6px;
	overflow: hidden;
}
tbody > tr:nth-child(even) {
	background-color: #eeeeee;
}
tr:hover {
	background-color: #ededed;
}
.member{
	width: 700px;
	text-align: right;
	margin: 0 auto;
	margin-top: 50px;
}

</style>
</head>
<body>
<div class="total">
	총 ${list.size() }건
	<form action="boardList.bo" method="post">
		<span style="float: right;">
			<select name="searchKeyword">
				<option value="TITLE">제목</option>
				<option value="WRITER">작성자</option>
			</select>
			<input type="text" name="searchValue">
			<input type="submit" value="검색">
		</span>
	</form>
</div>
<table>
	<colgroup>
		<col width="10%">
		<col width="*">
		<col width="15%">
		<col width="15%">
		<col width="10%">
	</colgroup>
	<thead>
		<tr>
			<td>글번호</td>
			<td>제 목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="board">
					<tr>
						<td>${communityVO.commuCode }</td>
						<td align="left">
							<c:choose>
								<c:when test="${not empty boardDTO.boardPw }">
									
									<a href="inputPassword.bo?memberPw=${memberVO.memberPw }&commuCode=${communityVO.commuCode }">
										${communityVO.title }
									</a>
								</c:when>
								<c:otherwise>
									  <img alt="" src=""> <!--비밀글 여부 자물쇠 이미지 첨삭  -->
									<a href="selectBoard.bo?commuCode=${communityVO.commuCode }">
										${communityVO.title }
									</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td>${communityVO.writer }</td>
						<td>${communityVO.createDate }</td>
						<td>${communityVO.readCnt }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<div class="btnDiv">
	<c:if test="${not empty sessionScope.loginInfo }">
		<div class="btn" onclick="location.href='/board/insertBoardGo';">작성</div>
	</c:if>
	<div class="btn" onclick="location.href='/board/boardWiterForm';">작성</div>
</div>
</body>
</html>











