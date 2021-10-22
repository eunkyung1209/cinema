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
.one{
	width: 220px;
}
.two{
	width: 600px;
}

</style>
</head>
<body>
 <div class="row">
	<div class="row mb-3">
		<div class="col">
			<!-- 왼쪽 여백 -->
		</div>
		<div class="col-6">
			<div class="row mb-5">
				<div class="col-3 subjectDiv">
					<h5>마이페이지</h5>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<table class="table table-dark table-striped table-hover">

						<thead>
							<tr>
								<td scope="col" class="one">가입날짜</td>
								<td scope="col" class="two">${sessionScope.loginInfo.joinDate } </td>
							</tr>
							<tr>
								<td scope="col"  class="one">이름</td>
								<td scope="col" class="two">${sessionScope.loginInfo.name } </td>
							</tr>
							<tr>
								<td scope="col"  class="one">전화번호</td>
								<td scope="col" class="two">${sessionScope.loginInfo.tell }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">이메일</td>
								<td scope="col" class="two">${sessionScope.loginInfo.email }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">생일</td>
								<td scope="col" class="two">${sessionScope.loginInfo.birthday }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">마이시네마</td>
								<td scope="col" class="two">${sessionScope.loginInfo.myCinema }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">성별</td>
								<td scope="col" class="two">${sessionScope.loginInfo.gender }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">아이디</td>
								<td scope="col" class="two">${sessionScope.loginInfo.id }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">닉네임</td>
								<td scope="col" class="two">${sessionScope.loginInfo.nickName }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">포인트</td>
								<td scope="col" class="two">${sessionScope.loginInfo.point }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">적립금</td>
								<td scope="col" class="two">${sessionScope.loginInfo.savedMoney }</td>
							</tr>
							<tr>
								<td scope="col"  class="one">무인티켓사용</td>
								<td scope="col" class="two">${sessionScope.loginInfo.nonpeopleTicket }</td>
							</tr>
							<tr>
								<td scope="col">마켓팅동의여부</td>
								<td scope="col">${sessionScope.loginInfo.marketingAgree }</td>
							</tr>
						</thead>
						
						</tbody>
					</table>
					<br>
					<input type="button" class="btn" value="뒤로가기" onclick="location.href='/movie/mainPage';">
					<input type="button" class="btn" value="나의정보수정" onclick="location.href='updateMyPage?id=${memberInfo.id }';">
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