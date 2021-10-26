<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
} */
.subjectDiv{
	border-bottom: 2px solid #dddddd;
}
/* 
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
	border-bottom: 1px solid #c9c9c8;
}
td{
	vertical-align: middle;
	padding: 5px;
	padding-left: 10px;
}
input[type="text"],input[type="password"], input[type="email"] {
	width: 100%;
}
select {
	width: 30%; 
}

/* 필수입력 빨간 별 */
.redStar{
	color: red;
} 

/* *필수입력 문장  */
.needInput{
	font-size: 13px;
	margin-left: 70%;
}
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="row mb-3">
		<div class="col">
			<!-- 왼쪽 여백 -->
		</div>
		<div class="col-8">
			<div class="row mb-5">
				<div class="col-3 subjectDiv">
					<h5>영화 등록</h5>
				</div>
			</div>
			<form action="/admin/insertMovie" method="post" enctype="multipart/form-data">
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
										<td><input type="text" name="title" required> </td>
									</tr>
									<tr>
										<td>Director <span class="redStar">*</span></td>
										<td><input type="text" name="director" required> </td>
									</tr>
									<tr>
										<td>Actor <span class="redStar">*</span></td>
										<td><input type="text" name="actor" required> </td>
									</tr>
									<tr>
										<td>Genre <span class="redStar">*</span></td>
										<td><input type="text" name="genre" required> </td>
									</tr>
									<tr>
										<td>Age <span class="redStar">*</span></td>
										<td><input type="text" name="age" required> </td>
									</tr>
									<tr>
										<td>Running Time <span class="redStar">*</span></td>
										<td><input type="text" name="runningTime" required> </td>
									</tr>
									<tr>
										<td>Nation <span class="redStar">*</span></td>
										<td><input type="text" name="nation" required> </td>
									</tr>
									<tr>
										<td>Open Date <span class="redStar">*</span></td>
										<td><input type="date" name="openDate" required></td>
									</tr>
									<tr>
										<td>Content</td>
										<td><textarea style="width: 100%; height:150px;  padding-top: 5px; "  name="content" required></textarea> </td>
									</tr>
									<tr>
										<td>상영 상태</td>
										<td>
											<input type="radio" name="mvState" value="N" checked> 상영 X 
											<input type="radio" name="mvState" value="Y"> 상영 O
										</td>
									</tr>
									<tr>
										<td>Choose Poster Image</td>
	                   					<td><input type="file" name="imageFile" required></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row justify-content-center">
							<!-- 버튼 -->
							<div class="col-8" style="text-align: center;">
								<input class="common_btn" type="submit" value="등록하기">
								<input class="common_btn" type="reset" value="리셋하기">
							</div>
						</div>
					</div>
					<div class="col">
						<!-- 오른쪽 여백2 -->
					</div>
				</div>
			</form>
		</div>
		<div class="col">
			<!-- 오른쪽 여백 -->
		</div>
	</div>
</div>
</body>
</html>