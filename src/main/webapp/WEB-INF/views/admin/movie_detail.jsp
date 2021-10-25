<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div class="row justify-content-center">
	<div class="row">
		<div class="col"><!-- 왼쪽 여백 --></div>
		<div class="col-8">
			<div class="row mb-5">
				<div class="col-3 subjectDiv">
					<h5>영화 상세 정보</h5>
				</div>
			</div>
			<div class="row mb-3">
					<div class="col">
						<!-- 왼쪽 여백2 -->
					</div>
					<div class="col-8">
						<div class="row mb-3">
							<!-- 영화 정보 작성 -->
							<table class="writeTable">
								<colgroup>
									<col width="20%">
									<col width="*">
								</colgroup>
								<!-- 자유롭게 수정하여 사용 단, 인풋태그 태그 초기화 작업을 하였기에 css사용시, 선택자를 input으로 주는 것을 지양할 것 -->
								<!-- '필수입력' 복사하여 사용 ->  <span class="redStar">*</span> -->
								<tbody>
									<tr>
										<td>Title <span class="redStar">*</span></td>
										<td>${movieInfo.title }</td>
									</tr>
									<tr>
										<td>Director <span class="redStar">*</span></td>
										<td>${movieInfo.director }</td>
									</tr>
									<tr>
										<td>Actor <span class="redStar">*</span></td>
										<td>${movieInfo.actor }</td>
									</tr>
									<tr>
										<td>Genre <span class="redStar">*</span></td>
										<td>${movieInfo.genre }</td>
									</tr>
									<tr>
										<td>Age <span class="redStar">*</span></td>
										<td>${movieInfo.age }</td>
									</tr>
									<tr>
										<td>Running Time <span class="redStar">*</span></td>
										<td>${movieInfo.runningTime }</td>
									</tr>
									<tr>
										<td>Nation <span class="redStar">*</span></td>
										<td>${movieInfo.nation }</td>
									</tr>
									<tr>
										<td>Open Date <span class="redStar">*</span></td>
										<td>${movieInfo.openDate }</td>
									</tr>
									<tr>
										<td>Content</td>
										<td><pre><c:out value="${movieInfo.content }"/></pre></td>
									</tr>
									<tr>
										<td>상영 상태</td>
										<td>
											<c:if test="${movieInfo.mvState eq 'N' }">상영 O</c:if>
											<c:if test="${movieInfo.mvState eq 'Y' }">상영 X</c:if>
										</td>
									</tr>
									<tr>
										<td>포스터 이미지 파일명</td>
	                   					<td>${movieInfo.attachedImgName }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row justify-content-center">
							<!-- 버튼 -->
							<div class="col-8" style="text-align: center;">
								<input class="common_btn" type="button" value="수정하기" onclick="location.href='/admin/goUpdateMovie?mvCode=${movieInfo.mvCode}';">
								<input class="common_btn" type="button" value="뒤로가기" onclick="history.back()">
							</div>
						</div>
					</div>
					<div class="col">
						<!-- 오른쪽 여백2 -->
					</div>
				</div>
		</div>
		<div class="col"><!-- 오른쪽 여백 --></div>
	</div>
</div>
</body>
</html>