<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.star{
	width: 17px;
	height: 17px;
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
</style>
</head>
<body>
<div class="row">
	<div class="col">
		<!-- 제목 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>전체 영화</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 검색폼 -->
		<div class="row justify-content-center">
			<div class="col-8 search_box" >
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
		
		<div  class="row justify-content-center">
			<div class="col-8" >
				<div class="row">
					<!-- 영화 목록 조회 -->
					<c:forEach items="${movieList }" var="movieInfo">
						<div class="col-3">
							<div class="card mb-3">
								<a href="/movie/movieDetail?mvCode=${movieInfo.mvCode }"><img src="/resources/images/movie/${movieInfo.attachedImgName }" class="card-img-top"></a>
								<div class="card-body">
									<h5 class="card-title">${movieInfo.title }</h5>
									<p class="card-text">
										${movieInfo.genre } 
										&nbsp;|&nbsp; 
										<img src="/resources/images/main/메인서브-별점.PNG" class="star"> ${movieInfo.grade }
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>