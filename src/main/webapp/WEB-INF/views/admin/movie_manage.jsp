<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/movie_manage.js?ver=2"></script>
<style type="text/css">
/* 목록조회 페이지 폼 */

/* 검색 폼 */
.searchForm{
	text-align: right;
}

/*검색 버튼 기본폼 */
.common_btn{
	font-size: 14px;
	background-color: #4c4747;
	color: white;
	width: 80px;
}
.common_btn:hover{
	font-size: 14px;
	background-color: #5d5959;
	color: white;
	width: 80px;
}

/* 검색창 폼 */
.searchForm{
	text-align: right;
}

/* 테이블 폼 */
tr{
	border-bottom: 1px solid #e0e0e0;
}
tr, td{
	height: 50px;
}
.board_list{
	margin: 0 auto;
	width: 100%;
	text-align: center;
	border-bottom: 1px solid white;
	border-top: 1px solid white;
}
.board_list th, td{
	vertical-align: middle;
}

/* 페이징 폼 */
a{
	color: gray;
}
a:hover{
	color: black;
	font-weight: bold;
}
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="row mb-3">
		<div class="col">
			<!-- 왼쪽 여백 -->
		</div>
		<div class="col-8">
			<div class="row mb-5">
				<div class="col-3 subjectDiv">
					<h5>영화 관리</h5>
				</div>
			</div>
			<div class="row mb-3"><!-- 등록버튼(좌) / 검색폼(우) -->
				<div class="col">
					<input type="button" class="common_btn" value="영화 등록" onclick="location.href='/admin/goInsertMovie';">
				</div>
				<div class="col searchForm">
					<form action="/movie/movieList" method="post">
						<select class="selectBox_from" name="searchKeyword">
							<option value="TITLE" <c:if test="${movieVO.searchKeyword eq 'TITLE'}">selected</c:if>>제목</option>
							<option value="DIRECTOR" <c:if test="${movieVO.searchKeyword eq 'DIRECTOR'}">selected</c:if>>감독</option>
							<option value="GENRE" <c:if test="${movieVO.searchKeyword eq 'GENRE'}">selected</c:if>>장르</option>
						</select>
						<input type="text" class="inputSearch_form" name="searchValue" <c:if test="${not empty movieVO.searchValue}">value="${movieVO.searchValue }"</c:if>>
						<input class="common_btn" type="submit" value="검색">
					</form>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col">
					<table class="board_list">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="15%">
							<col width="15%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>No</th>
								<th>Title</th>
								<th>Genre</th>
								<th>Open Date</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${movieList }" var="movieInfo" varStatus="status">
								<tr>
									<th scope="row">${status.count }</th>
									<td><a href="/admin/movieDetail?mvCode=${movieInfo.mvCode }">${movieInfo.title }</a></td>
									<td>${movieInfo.genre }</td>
									<td>${movieInfo.openDate }</td>
									<td>
										<input type="button" class="common_btn" value="삭 제" onclick="deleteConfirm('${movieInfo.mvCode }');">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col">
			<!-- 오른쪽 여백 -->
		</div>
	</div>
</div>
</body>
</html>