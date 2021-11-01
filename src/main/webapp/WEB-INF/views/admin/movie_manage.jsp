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

/* 검색박스 폼 */
.search_box{
	padding: 22px;
	border: 1px solid #e0e0e0;
	border-radius: 0.4em;
	background-color:#f2f2f2;
}
/* 검색창 폼 */
.inputSearch_form{
   font-size: 14px;
   border-radius: 4px;
   border: 1px solid #e0e0e0;
   width: 600px;
}
.inputSearch_form:focus{
   border: 2px solid #c9c9c8;
}
/* 셀렉트박스 폼 */
.selectBox_from{
	font-size: 14px;
	width: 110px;
}
.search_form{
	background-color: #e0e0e0;
	text-align:center;
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
.disable{
	color: gray;
}
</style>
</head>
<body>
<div class="row">
	<div class="col">
		<!-- 제목 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>영화 관리</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 검색폼 -->
		<div class="row justify-content-center">
			<div class="col-8 search_box">
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
		
		<div style="height: 50px;"></div>
		
		<!-- 영화 등록 버튼 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<input type="button" class="common_btn" value="영화 등록" onclick="location.href='/admin/goInsertMovie';">
			</div>
		</div>
		
		<!-- 영화 목록 테이블 -->
		<div class="row justify-content-center">
			<div class="col-8">
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
		
		<div style="height: 50px;"></div>
		
		<!-- 페이징 -->
<%-- 	<div class="row">
			<div class="col-8" >
				<ul class="pagination justify-content-center">
					<li class="page-item <c:if test="${!movieVO.prev }">disabled</c:if>">
						<a class="page-link" href="/admin/movieManage?nowPage=${movieVO.beginPage - 1 }"> &lt; </a>
					</li>
					<c:forEach begin="${movieVO.beginPage }" end="${movieVO.endPage }" var="pageNumber">
						<li class="page-item <c:if test="${movieVO.nowPage eq pageNumber }">active</c:if>" aria-current="page">
				     		<a class="page-link" href="/admin/movieManage?nowPage=${pageNumber }&searchKeyword=${movieVO.searchKeyword}&searchValue=${movieVO.searchValue}" >${pageNumber }</a>
						</li>
					</c:forEach>
					<li class="page-item <c:if test="${!movieVO.next }">disabled</c:if>">
						<a class="page-link" href="/admin/movieManage?nowPage=${movieVO.endPage + 1 }"> &gt; </a>
					</li>
				</ul>
			</div>
		</div> --%>
		
		<!-- 페이징 disabled 걸리게 변경.. -->
		<div class="row justify-content-center">
			<div class="col-8 text-center pagingDiv">
				<a <c:if test="${movieVO.prev }">href="/board/boardList?nowPage=${movieVO.beginPage - 1 }"</c:if> class="disable">&nbsp;&nbsp; &lt; &nbsp;&nbsp;</a>
				<c:forEach begin="${movieVO.beginPage }" end="${movieVO.endPage }" var="pageNumber">
					<a href="/board/boardList?nowPage=${pageNumber }" <c:if test="${pageNumber eq movieVO.nowPage }">class="selectedPage"</c:if>>${pageNumber }</a> 
				</c:forEach>
				<a <c:if test="${movieVO.prev }">href="/board/boardList?nowPage=${movieVO.endPage + 1 }"</c:if> class="disable">&nbsp;&nbsp; &gt; &nbsp;&nbsp;</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>