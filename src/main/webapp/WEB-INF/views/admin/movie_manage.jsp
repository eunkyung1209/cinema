<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/movie_manage.js?ver=2"></script>
<style type="text/css">
body{
	margin: 0 auto;
}
.subjectDiv{
	border-bottom: 2px solid #dddddd;
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
					<h5>영화 관리</h5>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<input type="button" class="btn btn-dark btn-sm" value="영화 등록" onclick="location.href='/admin/goInsertMovie';">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<table class="table table-dark table-striped table-hover">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="15%">
							<col width="15%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">Title</th>
								<th scope="col">Genre</th>
								<th scope="col">Open Date</th>
								<th scope="col">Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${movieList }" var="movieInfo" varStatus="status">
								<tr>
									<th scope="row" class="align-middle">${status.count }</th>
									<td class="align-middle">${movieInfo.title }</td>
									<td class="align-middle">${movieInfo.genre }</td>
									<td class="align-middle">${movieInfo.openDate }</td>
									<td class="align-middle">
										<input type="button" class="btn btn-dark btn-sm" value="삭 제" onclick="deleteConfirm('${movieInfo.mvCode }');">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col">
			<!-- 오른쪽 여백 -->
		</div>
	</div>
</div>
</body>
</html>