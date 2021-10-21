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
					<h5>회원 관리</h5>
				</div>
			</div>
			
			<div class="col-2">
				<select class="form-select" name="searchKeyword">
					<option selected>전체</option>
					<option value="ID" <c:if test="${memberVO.searchKeyword eq 'ID' }">selected</c:if>>아이디</option>
					<option value="NAME" <c:if test="${memberVO.searchKeyword eq 'NAME' }">selected</c:if>>이름</option>
				</select>
			</div>
			<div class="col-1"></div>
			<div class="col-3">
				<input type="text" name="searchValue" value="${memberVO.searchValue }" class="form-control" placeholder="Input here..">
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
								<th scope="col">이름</th>
								<th scope="col">아이디</th>
								<th scope="col">닉네임</th>
								<th scope="col">번호</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${memberList }" var="memberInfo" varStatus="status">
								<tr>
									<th scope="row" class="align-middle">${status.count }</th>
									<td class="align-middle">${memberInfo.name }</td>
									<td class="align-middle">${memberInfo.id }</td>
									<td class="align-middle">${memberInfo.nickName }</td>
									<td class="align-middle">${memberInfo.tell }</td>
									<td class="align-middle">
										<a href="/admin/adminMemberDetail?id=${memberInfo.id }"><input type="button" class="btn btn-dark btn-sm" value="상세보기" ></a>
									</td>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
					
					<input type="button" class="btn" value="뒤로가기" onclick="location.href='/movie/mainPage';">
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