<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.card{
	border: none;
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
									<h5 class="card-title">
										<c:if test="${movieInfo.age eq 12}">
											<img height="25px;" src="/resources/images/reservation/12.png">
										</c:if>
										<c:if test="${movieInfo.age eq 15}">
											<img height="25px;" src="/resources/images/reservation/15.png">
										</c:if>
										<c:if test="${movieInfo.age eq 19}">
											<img height="25px;" src="/resources/images/reservation/19.png">
										</c:if>
										<c:if test="${movieInfo.age eq 0}">
											<img height="25px;" src="/resources/images/reservation/전체.png">
										</c:if>
										${movieInfo.title }
									</h5>
									<p class="card-text">
										${movieInfo.genre } 
										&nbsp;|&nbsp; 
										<c:if test="${movieInfo.mvState eq 'Y' }">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill star" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg> ${movieInfo.grade }
										</c:if>
										<c:if test="${movieInfo.mvState eq 'N' }">개봉예정</c:if>
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