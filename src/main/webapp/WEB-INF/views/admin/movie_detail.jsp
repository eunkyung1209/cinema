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
							<td>Title</td>
							<td>${movieInfo.title }</td>
						</tr>
						<tr>
							<td>Director</td>
							<td>${movieInfo.director }</td>
						</tr>
						<tr>
							<td>Actor</td>
							<td>${movieInfo.actor }</td>
						</tr>
						<tr>
							<td>Genre</td>
							<td>${movieInfo.genre }</td>
						</tr>
						<tr>
							<td>Age</td>
							<td>${movieInfo.age }</td>
						</tr>
						<tr>
							<td>Running Time</td>
							<td>${movieInfo.runningTime }</td>
						</tr>
						<tr>
							<td>Nation</td>
							<td>${movieInfo.nation }</td>
						</tr>
						<tr>
							<td>Open Date</td>
							<td>${movieInfo.openDate }</td>
						</tr>
						<tr>
							<td>Content</td>
							<td><pre><c:out value="${movieInfo.content }"/></pre></td>
						</tr>
						<tr>
							<td>상영 상태</td>
							<td>
								<c:if test="${movieInfo.mvState eq 'N' }">상영 X</c:if>
								<c:if test="${movieInfo.mvState eq 'Y' }">상영 O</c:if>
							</td>
						</tr>
						<tr>
							<td>포스터 이미지 파일명</td>
                 					<td>${movieInfo.attachedImgName }</td>
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
				<input class="common_btn" type="button" value="뒤로가기" onclick="history.back()">
			</div>
		</div>
	</div>
</div>
</body>
</html>