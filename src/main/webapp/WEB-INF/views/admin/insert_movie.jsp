<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	margin: 0 auto;
}
.subjectDiv{
	border-bottom: 2px solid #dddddd;
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
}
</style>
</head>
<body>
<div class="row">
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
			<form action="/admin/insertMovie" method="post">
				<div class="row mb-3">
					<div class="col"></div>
					<div class="col-8">
						<div class="row">
							<!-- 영화 정보 작성 -->
							<div class="mb-4">
								<label for="inputTitle" class="form-label">Title</label>
								<input type="text" name="title" class="form-control" id="inputTitle" placeholder="Input title">
							</div>
							<div class="mb-4">
								<label for="inputDirector" class="form-label">Director</label>
								<input type="text" name="director" class="form-control" id="inputDirector" placeholder="Input director">
							</div>
							<div class="mb-4">
								<label for="inputActor" class="form-label">Actor</label>
								<input type="text" name="actor" class="form-control" id="inputActor" placeholder="Input actor">
							</div>
							<div class="mb-4">
								<label for="inputGenre" class="form-label">Genre</label>
								<input type="text" name="genre" class="form-control" id="inputGenre" placeholder="Input genre">
							</div>
							<div class="mb-4">
								<label for="inputAge" class="form-label">Age</label>
								<input type="text" name="age" class="form-control" id="inputAge" placeholder="Input age">
							</div>
							<div class="mb-4">
								<label for="inputRunningTime" class="form-label">Running Time</label>
								<input type="text" name="runningTime" class="form-control" id="inputRunningTime" placeholder="Input running time">
							</div>
							<div class="mb-4">
								<label for="inputNation" class="form-label">Nation</label>
								<input type="text" name="nation" class="form-control" id="inputNation" placeholder="Input nation">
							</div>
							<div class="mb-4">
								<label for="inputOpenDate" class="form-label">Open Date</label>
								<input type="text" name="openDate" class="form-control" id="inputOpenDate" placeholder="Input open date">
							</div>
							<div class="mb-4">
								<label for="inputContent" class="form-label">Content</label>
								<textarea class="form-control" placeholder="Input content" id="inputContent" style="height: 100px"></textarea>
							</div>
						</div>
						<div class="row">
							<!-- 영화 포스터 첨부 -->
							<div class="mb-5">
								<label for="inputImageFile" class="form-label">Choose Movie Poster Image</label>
								<div class="input-group">
									<input type="file" class="form-control" id="inputImageFile">
								</div>
							</div>
						</div>
						<div class="row">
							<!-- 등록 버튼 -->
							<div class="d-grid gap-2">
								<input class="btn btn-dark" type="submit" value="등록하기">
								<input class="btn btn-dark" type="reset" value="다시 적기">
							</div>
						</div>
					</div>
					<div class="col"></div>
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