<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col">
		<!-- 왼쪽 여백 -->
	</div>
	<div class="col-8">
		<div class="row">
			<!-- 왼쪽 상단 포스터 이미지 -->
			<div class="col-3">
				<img alt="" src="/resources/image/movie/${movieInfo.attachedImgName }">
			</div>
			<!-- 오른쪽 상단 영화 정보 -->
			<div class="col-9">
				<div class="row">
					${movieInfo.title }
				</div>
				<div class="row">
					장르 ${movieInfo.genre }
					&nbsp; | &nbsp;
					댓글 평점 <img src="/resources/images/main/메인서브-별점.PNG">${movieInfo.grade }
				</div>
				<hr>
				<div class="row">
					<div>감독 : ${movieInfo.director }</div>
					<div>출연 : ${movieInfo.actor }</div>
					<div>장르 : ${movieInfo.genre } &nbsp;| &nbsp;기본 : ${movieInfo.age } 이상, ${movieInfo.runningTime }분, ${movieInfo.nation }</div>
					<div>개봉 : ${movieInfo.openDate }</div>
				</div>
			</div>
		</div>
		<div class="row">
			
		</div>
	</div>
	<div class="col">
		<!-- 오른쪽 여백 -->
	</div>
</div>
</body>
</html>