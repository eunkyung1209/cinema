<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/movie/js/movie_detail.js?ver=4"></script>
<style type="text/css">
/* .posterInfo{
	width: 205px;
    height: 305px;
} */
.star{
	width: 17px;
	height: 17px;
}

.movieInfo{
	margin: 0 12px;
}
.movieInfo td{
	vertical-align: top;
}
.movieInfo td > div{
	margin-bottom: 10px;
	padding-left: 20px;
	padding-right: 20px;
}

.replyDiv{
	border: 1px solide #c9c9c8;
	
}

/* 본인 또는 관리자에게만 보이는 수정, 삭제 버튼 */
.correct{
	text-align: right;
}

.replyTable{
	margin: 0 auto;
	width: 100%;
	text-align: left;
	padding: 10px;
}
.replyTable tr{
	border-top: 1px solid #c9c9c8;
	border-bottom: 1px solid #c9c9c8;
}
tr, td{
	height: 50px;
	vertical-align: middle;
	padding: 10px;
}

input{
	height: 50px;
}
input[type="number"]{
	height: 20px;
}

.replyWriter{
	font-size: 12px;
	height: 30%;
	margin-top: 5px;
	margin-left: 5px;
	margin-right: 5px;
}
.createDate{
	font-size: 10px;
	height: 20%;
	margin-bottom: 5px;
	margin-left: 5px;
	margin-right: 5px;
}
.replyContent{
	font-size: 14px;
	margin: 5px;
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
					<h5>영화 정보</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 상단 간략한 영화 정보 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<table class="movieInfo">
					<tr>
						<td rowspan="2">
							<img alt="" src="/resources/images/movie/${movieInfo.attachedImgName }" style="width: 250px;" class="posterInfo">
						</td>
						<td>
							<div><h4>${movieInfo.title }</h4></div>
							<div>
								<input type="hidden" id="mvCode" name="mvCode" value="${movieInfo.mvCode }">
								장르 : ${movieInfo.genre }
								&nbsp; | &nbsp;
								댓글 평점 : <img src="/resources/images/main/메인서브-별점.PNG" class="star"> ${movieInfo.grade }
							</div>
							<div><hr></div>
							<div>감독 : ${movieInfo.director }</div>
							<div>출연 : ${movieInfo.actor }</div>
							<div>장르 : ${movieInfo.genre } &nbsp;| &nbsp;기본 : ${movieInfo.age } 이상, ${movieInfo.runningTime }분, ${movieInfo.nation }</div>
							<div>개봉 : ${movieInfo.openDate }</div>
						</td>
					</tr>
				</table>
				<%-- <div class="col-2"><!-- 왼쪽 상단 포스터 이미지 -->
					<img alt="" src="/resources/images/movie/${movieInfo.attachedImgName }" width="150%" class="posterInfo">
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
				</div> --%>
			</div>
		</div>
		
		<!-- 영화 줄거리 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<hr>
				<pre><c:out value="${movieInfo.content }"/></pre>
				<hr>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 댓글 작성란 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<form action="/movie/insertReply" method="post">
					<div class="row replyDiv">
						<div class="col-12 text-left">
							<div class="row mb-1">
								<div class="col">
									&nbsp;&nbsp;${sessionScope.loginInfo.nickName } &nbsp;&nbsp;|&nbsp;&nbsp; 
									평점 : <img src="/resources/images/main/메인서브-별점.PNG" class="star"> <input type="number" name="grade" min="0" max="5" value="5" required>
									<input type="hidden" name="writer" value="${sessionScope.loginInfo.nickName }">
									<input type="hidden" name="mvCode" value="${movieInfo.mvCode}">
								</div>
							</div>
							<div class="row">
								<div class="col-11">
									<input type="text" name="mvReplyContent" <c:if test="${empty sessionScope.loginInfo }">placeholder="로그인 후 댓글 작성이 가능합니다" readonly</c:if> style="width: 100%;" required>
								</div>
								<div class="col-1">
									<input type="submit" value="등록">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<!-- 댓글 목록 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<table class="replyTable">
					<colgroup>
						<col width="98%">
						<col width="2%">
					</colgroup>
					<c:choose>
						<c:when test="${empty replyList }">
							<tr>
								<td colspan="2">
									등록된 댓글이 없습니다.
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${replyList }" var="replyInfo">
								<tr>
									<td>
										<form action="/movie/updateReply" method="post">
											<input type="hidden" name="mvCode" value="${movieInfo.mvCode }">
											<input type="hidden" name="mvReplyCode" value="${replyInfo.mvReplyCode }">
											<div class="replyWriter">
												${replyInfo.writer } &nbsp;&nbsp;|&nbsp;&nbsp; 
												평점 : <img src="/resources/images/main/메인서브-별점.PNG" class="star"> <span class="replyGrade" data-grade="${replyInfo.grade }">${replyInfo.grade }</span>
											</div>
											<div class="createDate mb-1">${replyInfo.createDate }</div>
											<div class="replyContent" data-mvReplyCode="${replyInfo.mvReplyCode }" data-content="${replyInfo.mvReplyContent }">${replyInfo.mvReplyContent }</div>
										</form>
									</td>
									<!-- 본인 또는 관리자 -->
									<td class="correct" >
										<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.nickName eq replyInfo.writer}">
											<li class="nav-item dropdown">
									           	<span class="nav-link dropdown-toggle" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									            </span>
									            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
									              	<li><a class="dropdown-item" onclick="updateReply('${replyInfo.mvReplyCode }');">댓글 수정</a></li>
									              	<li><a class="dropdown-item" onclick="deleteReply('${replyInfo.mvReplyCode }');">댓글 삭제</a></li>
									            </ul>
									     	</li>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>