<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 작성테이블 */
.writeTable{
	margin: 0 auto;
	width: 100%;
	border-bottom: solid 1px #c9c9c8;
	height: 500px;
}
td:first-child{
	text-align: center;
	background-color: #f2f2f2;
}
tr{
	border-top: 1px solid #c9c9c8;
	border-bottom: 1px solid #c9c9c8;
}
td{
	vertical-align: middle;
	padding: 5px;
	padding-left: 10px;
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
					<h5>영화 상세 정보</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 영화 정보 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<table class="writeTable">
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<!-- 자유롭게 수정하여 사용 단, 인풋태그 태그 초기화 작업을 하였기에 css사용시, 선택자를 input으로 주는 것을 지양할 것 -->
					<!-- '필수입력' 복사하여 사용 ->  <span class="redStar">*</span> -->
					<tbody>
						<tr>
							<td>제목</td>
							<td>${movieInfo.title }</td>
						</tr>
						<tr>
							<td>감독</td>
							<td>${movieInfo.director }</td>
						</tr>
						<tr>
							<td>배우</td>
							<td>${movieInfo.actor }</td>
						</tr>
						<tr>
							<td>장르</td>
							<td>${movieInfo.genre }</td>
						</tr>
						<tr>
							<td>연령</td>
							<td>
								<c:choose>
									<c:when test="${movieInfo.age eq 0 }"><!-- 전체 관람가 -->
										전체
									</c:when>
									<c:otherwise><!-- 연령 출력 -->
										${movieInfo.age }세 이상
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>러닝 타임</td>
							<td>${movieInfo.runningTime }</td>
						</tr>
						<tr>
							<td>국가</td>
							<td>${movieInfo.nation }</td>
						</tr>
						<tr>
							<td>개봉일</td>
							<td>${movieInfo.openDate }</td>
						</tr>
						<tr>
							<td>시놉시스</td>
							<td><pre><c:out value="${movieInfo.content }"/></pre></td>
						</tr>
						<tr>
							<td>상영 상태</td>
							<td>
								<c:if test="${movieInfo.mvState eq 'N' }">상영예정작</c:if>
								<c:if test="${movieInfo.mvState eq 'Y' }">현재상영작</c:if>
							</td>
						</tr>
						<tr>
							<td>포스터 이미지 파일명</td>
                 			<td>
                 				<c:forEach items="${movieInfo.imgList }" var="imgInfo">
                 					<c:if test="${imgInfo.isPoster eq 'Y' }">
		                 				${imgInfo.attachedImgName }
                 					</c:if>
                 				</c:forEach>
                 			</td>
						</tr>
						<tr>
							<td>스틸컷 이미지 파일명</td>
                 			<td>
                 				<c:forEach items="${movieInfo.imgList }" var="imgInfo" varStatus="status">
                 					<c:if test="${imgInfo.isPoster eq 'N' }">
		                 				${imgInfo.attachedImgName }<c:if test="${!status.last }">, </c:if>
                 					</c:if>
                 				</c:forEach>
                 			</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 버튼 -->
		<div class="row justify-content-center">
			<div class="col-8 text-center">
				<input class="common_btn" type="button" value="수정하기" onclick="location.href='/admin/goUpdateMovie?mvCode=${movieInfo.mvCode}';">
				<input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/admin/movieManage';">
			</div>
		</div>
	</div>
</div>
</body>
</html>