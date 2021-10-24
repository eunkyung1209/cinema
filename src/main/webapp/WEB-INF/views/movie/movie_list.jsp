<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subjectDiv{
	border-bottom: 2px solid #dddddd;
}
.star{
	width: 17px;
	height: 17px;
}
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="col"><!-- 왼쪽 여백 --></div>
	<div class="col-8">
		<div class="row mb-5">
			<div class="col-3 subjectDiv">
				<h5>전체 영화</h5>
			</div>
		</div>
		<div class="row">
			<!-- 영화 목록 조회 -->
			<c:forEach items="${movieList }" var="movieInfo">
				<div class="col-2">
					<div class="card mb-3">
						<a href="/movie/movieDetail?mvCode=${movieInfo.mvCode }"><img src="/resources/images/movie/${movieInfo.attachedImgName }" class="card-img-top"></a>
						<div class="card-body">
							<h5 class="card-title">${movieInfo.title }</h5>
							<p class="card-text">
								${movieInfo.genre } 
								&nbsp;|&nbsp; 
								<img src="/resources/images/main/메인서브-별점.PNG" class="star">${movieInfo.grade }
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="col"><!-- 오른쪽 여백 --></div>
</div>
</body>
</html>