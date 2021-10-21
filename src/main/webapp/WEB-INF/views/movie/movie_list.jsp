<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subjectDiv{
	border-bottom: 2px solid #dddddd;
}
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="col">
		<!-- 왼쪽 여백 -->
	</div>
	<div class="col-8">
		<div class="row mb-5">
			<div class="col-3 subjectDiv">
				<h5>전체 영화</h5>
			</div>
		</div>
		<div class="row">
			<%-- <c:forEach items="${movieList }" var="movieInfo"> --%>
				<div class="col-2">
					<div class="card" style="width: 9rem;">
						<img src="/resources/images/main/메인서브-01.png" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">영화제목</h5>
							<p class="card-text">개봉일</p>
							<a href="#" class="btn btn-warning">예매</a>
						</div>
					</div>
				</div>
			<%-- </c:forEach> --%>
		</div>
	</div>
	<div class="col">
		<!-- 오른쪽 여백 -->
	</div>
</div>
</body>
</html>