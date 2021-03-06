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
	width: 98%;
}
.movieInfo td{
	vertical-align: top;
}
.movieInfo td:last-child{
	padding-right: 0;
}
.movieInfo td > div{
	margin-bottom: 10px;
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
							<c:forEach items="${movieInfo.imgList }" var="imgInfo">
								<c:if test="${imgInfo.isPoster eq 'Y' }"><!-- 영화 포스터 이미지 -->
									<img alt="" src="/resources/images/movie/${imgInfo.attachedImgName }" style="width: 250px;" class="posterInfo">
								</c:if>
							</c:forEach>
						</td>
						<td>
							<div>
								<h4>
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
								</h4>
							</div>
							<div>
								<input type="hidden" id="mvCode" name="mvCode" value="${movieInfo.mvCode }">
								장르 : ${movieInfo.genre }
								&nbsp; | &nbsp;
								댓글 평점 : <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill star" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg> ${movieInfo.grade }
							</div>
							<div><hr></div>
							<div>감독 : ${movieInfo.director }</div>
							<div>출연 : ${movieInfo.actor }</div>
							<div>
								장르 : ${movieInfo.genre } 
								&nbsp;| &nbsp;
								기본 : 
								<c:choose>
									<c:when test="${movieInfo.age eq 0 }"><!-- 전체 관람가 -->
										전체
									</c:when>
									<c:otherwise><!-- 연령 출력 -->
										${movieInfo.age }세 이상
									</c:otherwise>
								</c:choose>
								, ${movieInfo.runningTime }분
								, ${movieInfo.nation }
							</div>
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
		
		<div class="row justify-content-center">
			<div class="col-8">
				<hr>
				<div style="margin-bottom: 20px;">시놉시스</div>
				<pre><c:out value="${movieInfo.content }"/></pre>
				<hr>
			</div>
		</div>
		
		<!-- 영화 스틸컷 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<hr>
				<div style="margin-bottom: 20px;">스틸컷</div>
				<div class="row">
					<c:forEach items="${movieInfo.imgList }" var="imgInfo">
						<c:if test="${imgInfo.isPoster eq 'N' }"><!-- 영화 스틸컷 이미지 -->
							<div class="col-3">
								<div class="card">
									<img alt="" src="/resources/images/movie/${imgInfo.attachedImgName }" class="posterInfo">
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
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
									평점 : <img src="/resources/images/main/메인서브-별점.PNG" class="star"> <input type="number" name="grade" min="0" max="5" value="5" <c:if test="${empty sessionScope.loginInfo }">readonly</c:if> required>
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