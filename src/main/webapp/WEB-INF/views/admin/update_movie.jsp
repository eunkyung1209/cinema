<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 이전에 내가 설정해둔 css */
/* 
body{
	margin: 0 auto;
}
thead > tr{
	
}
table th, td{
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #ffffff;
	border-right: 1px solid #ffffff;
}
tr > th, td :last-child {
	border-right: none;
} */

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
input[type="text"]{
	width: 100%;
}
select{
	width: 30%; 
}

/* 필수입력 빨간 별 */
.redStar{
	color: red;
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
					<h5>영화 정보 수정</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 영화 수정 -->
		<form action="/admin/updateMovie" method="post">
			<div class="row justify-content-center">
				<div class="col-8">
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
								<td><input type="text" name="title" value="${movieInfo.title }" required> </td>
							</tr>
							<tr>
								<td>Director <span class="redStar">*</span></td>
								<td><input type="text" name="director" value="${movieInfo.director }" required> </td>
							</tr>
							<tr>
								<td>Actor <span class="redStar">*</span></td>
								<td><input type="text" name="actor" value="${movieInfo.actor }" required> </td>
							</tr>
							<tr>
								<td>Genre <span class="redStar">*</span></td>
								<td><input type="text" name="genre" value="${movieInfo.genre }" required> </td>
							</tr>
							<tr>
								<td>Age <span class="redStar">*</span></td>
								<td><input type="text" name="age" value="${movieInfo.age }" required> </td>
							</tr>
							<tr>
								<td>Running Time <span class="redStar">*</span></td>
								<td><input type="text" name="runningTime" value="${movieInfo.runningTime }" required> </td>
							</tr>
							<tr>
								<td>Nation <span class="redStar">*</span></td>
								<td><input type="text" name="nation" value="${movieInfo.nation }" required> </td>
							</tr>
							<tr>
								<td>Open Date <span class="redStar">*</span></td>
								<td><input type="date" name="openDate" value="${movieInfo.openDate }" required></td>
							</tr>
							<tr>
								<td>Content</td>
								<td>
									<textarea style="width: 100%; height:150px; padding-top: 5px;" name="content" required><c:out value="${movieInfo.content }"/></textarea>
								</td>
							</tr>
							<tr>
								<td>상영 상태</td>
								<td>
									<input type="radio" name="mvState" value="N" <c:if test="${movieInfo.mvState eq 'N' }">checked</c:if>> 상영 X 
									<input type="radio" name="mvState" value="Y" <c:if test="${movieInfo.mvState eq 'Y' }">checked</c:if>> 상영 O
								</td>
							</tr>
							<!-- <tr>
								<td>Choose Poster Image</td>
                  					<td><input type="file" name="imageFile" required></td>
							</tr> -->
						</tbody>
					</table>
				</div>
			</div>
			
			<div style="height: 50px;"></div>
			
			<!-- 버튼 -->
			<div class="row justify-content-center">
				<div class="col-8 text-center">
					<input type="hidden" name="mvCode" value="${movieInfo.mvCode }">
					<input class="common_btn" type="submit" value="수정완료">
					<input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/admin/movieDetail?mvCode=${movieInfo.mvCode }';">
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>