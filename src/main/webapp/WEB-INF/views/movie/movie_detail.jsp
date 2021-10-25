<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.posterInfo{
	width: 205px;
    height: 305px;
}
.star{
	width: 17px;
	height: 17px;
}
pre{
	margin-top: 1rem;
}
</style>
</head>
<body>
<div class="row">
	<div class="row">
		<div class="col"><!-- 왼쪽 여백 --></div>
		<div class="col-9">
			<div class="row"><!-- 상단 간략한 영화 정보 -->
				<div class="col-2"><!-- 왼쪽 상단 포스터 이미지 -->
					<img alt="" src="/resources/images/movie/${movieInfo.attachedImgName }" class="posterInfo">
				</div>
				<div class="col-1"></div>
				<div class="col-9"><!-- 오른쪽 상단 영화 정보 -->
					<div class="row">
						<div><h4>${movieInfo.title }</h4></div>
					</div>
					<div class="row">
						<div>
							장르 : ${movieInfo.genre }
							&nbsp; | &nbsp;
							댓글 평점 : <img src="/resources/images/main/메인서브-별점.PNG" class="star">${movieInfo.grade }
						</div>
					</div>
					<div class="row"><hr></div>
					<div class="row">
						<div>감독 : ${movieInfo.director }</div>
						<div>출연 : ${movieInfo.actor }</div>
						<div>장르 : ${movieInfo.genre } &nbsp;| &nbsp;기본 : ${movieInfo.age } 이상, ${movieInfo.runningTime }분, ${movieInfo.nation }</div>
						<div>개봉 : ${movieInfo.openDate }</div>
					</div>
				</div>
			</div>
			<div class="row"><!-- 영화 줄거리 -->
				<div class="col">
					<hr>
					<pre><c:out value="${movieInfo.content }"/></pre>
					<hr>
				</div>
			</div>
			<div class="row"><!-- 댓글 -->
				<div></div>
			</div>
		</div>
		<div class="col"><!-- 오른쪽 여백 --></div>
	</div>
</div>
</body>
</html>