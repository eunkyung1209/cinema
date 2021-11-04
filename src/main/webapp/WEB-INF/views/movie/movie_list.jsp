<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<div class="row">
	<div class="col">
		<!-- 제목 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<c:choose>
						<c:when test="${movieVO.mvState eq 'Y' }"><!-- 상영작 -->
							<h5>현재상영작</h5>
						</c:when>
						<c:when test="${movieVO.mvState eq 'N' }"><!-- 예정작 -->
							<h5>상영예정작</h5>
						</c:when>
						<c:otherwise><!-- 전체 영화 -->
							<h5>전체 영화</h5>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 검색폼 -->
		<div class="row justify-content-center">
			<div class="col-8 search_box text-center" >
				<form action="/movie/movieList" method="post">
					<input type="hidden" name="mvState" value="${movieVO.mvState }">
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