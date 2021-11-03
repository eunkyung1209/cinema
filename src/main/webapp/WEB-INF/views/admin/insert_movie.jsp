<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
select {
	width: 30%; 
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
					<h5>영화 등록</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<!-- 영화 등록 -->
		<form action="/admin/insertMovie" method="post" enctype="multipart/form-data">
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
								<td>영화 제목 <span class="redStar">*</span></td>
								<td><input type="text" name="title" required> </td>
							</tr>
							<tr>
								<td>감독 <span class="redStar">*</span></td>
								<td><input type="text" name="director" required> </td>
							</tr>
							<tr>
								<td>배우 <span class="redStar">*</span></td>
								<td><input type="text" name="actor" required> </td>
							</tr>
							<tr>
								<td>장르 <span class="redStar">*</span></td>
								<td><input type="text" name="genre" required> </td>
							</tr>
							<tr>
								<td>연령 <span class="redStar">*</span></td>
								<td>
									<input type="text" name="age" required> 
									<div style="margin-top: 5px;">* 숫자로 입력하시오.(전체관람가일 경우, 0 입력)</div>
								</td>
							</tr>
							<tr>
								<td>러닝 타임 <span class="redStar">*</span></td>
								<td><input type="text" name="runningTime" required> </td>
							</tr>
							<tr>
								<td>국가 <span class="redStar">*</span></td>
								<td><input type="text" name="nation" required> </td>
							</tr>
							<tr>
								<td>개봉일 <span class="redStar">*</span></td>
								<td><input type="date" name="openDate" required></td>
							</tr>
							<tr>
								<td>시놉시스</td>
								<td><textarea style="width: 100%; height:150px;  padding-top: 5px; "  name="content" required></textarea> </td>
							</tr>
							<tr>
								<td>상영 상태 <span class="redStar">*</span></td>
								<td>
									<input type="radio" name="mvState" value="N" checked> 상영예정작 &nbsp;&nbsp;
									<input type="radio" name="mvState" value="Y"> 현재상영작
								</td>
							</tr>
							<tr>
								<td>포스터 이미지 <span class="redStar">*</span></td>
                  				<td><input type="file" name="file" required></td>
							</tr>
							<tr>
								<td>스틸컷 이미지 <span class="redStar">*</span></td>
                  				<td><input type="file" name="files" multiple required></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div style="height: 50px;"></div>
			
			<!-- 버튼 -->
			<div class="row justify-content-center">
				<div class="col-8 text-center">
					<input class="common_btn" type="submit" value="등록하기">
					<input class="common_btn" type="reset" value="리셋하기">
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>