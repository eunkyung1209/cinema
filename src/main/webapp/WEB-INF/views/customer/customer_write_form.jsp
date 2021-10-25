<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.customerWrite{
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

input[type="text"], 
input[type="password"] {
	width: 100%;
}

.redStar{
	color: red;
} 

.needInput{
	font-size: 13px;
	margin-left: 70%;
}

.cusBox{
	margin: 0 auto;
	height: 100px;
	border: 1px solid #c9c9c8;
	padding-top: 20px;
	text-align: center;
}

select {
	width: 30%; 
}
 
</style>


</head>
<body>
<div style="height: 50px;"></div>

<div class="row bodyDiv" >
	<div class="col-12">
	
	<div class="row justify-content-center align-middle">
		<div class="col-10 " >
			<div class="col-9 cusBox " >
				<div>FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.</div> <br>
				<div> - 1:1 문의글 답변 운영시간 10:00 ~ 19:00</div> 
				<div> - 접수 후 48시간 안에 답변 드리겠습니다.</div> 
			</div>
		</div>
	</div>
	
	<div style="height: 80px;"></div>
	
	<form action="/customer/insertCustomerBoard" method="post">
			<div class="row justify-content-center align-middle">
			
				<div class="row justify-content-center" >
					<div class="col-8" >
							<table class="customerWrite">
								<colgroup>
									<col width="20%">
									<col width="*">
								</colgroup>
								
								<thead>
									<tr>
										<td colspan="2" style="background-color: white; padding-bottom: 5px;" >
											<span style="font-size: 20px;">문의내용</span> 
											<span class="needInput" style=""><span class="redStar">*</span>필수입력</span>
											<c:if test="${sessionScope.loginInfo.isAdmin eq 'N' }">
												<input type="hidden" name="isNotice" value="N">
											</c:if>
										</td>
									</tr>
								</thead>	
								
								<tbody>
									<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
										<tr>
											<td>공지글 여부</td>
											<td>
												
												<input type="radio" name="isNotice" value="N" checked> N
												<input type="radio" name="isNotice" value="Y"> Y
											</td>
										</tr>
									</c:if>
									
									<tr>
										
										<td>글 분류</td>
										<td>
											<select name="groupCode" required>
												<option value="GROUP_001">기타</option>
												<option value="GROUP_002">시설 문의</option>
												<option value="GROUP_003">영화 문의</option>
												<option value="GROUP_004">결제 문의</option>
											</select>
										</td>
									</tr>
									<tr>
										<td >제목 <span class="redStar">*</span></td>
										<td ><input style="width: 100%;" type="text" name="title" required> </td>
									</tr>
									<tr>
										<td >작성자 <span class="redStar">*</span></td>
										<td> <input type="text" style="color: black;" name="writer" readonly required value="${sessionScope.loginInfo.nickName }"></td>
									</tr>
									<tr>
										<td>내용 <span class="redStar">*</span></td>
										<td><textarea style="width: 100%; height:300px;  padding-top: 5px; "  name="content" required></textarea> </td>
									</tr>
									<tr>
										<td>파일첨부</td>
	                   					<td><input name="file2" id="formFileMultiple" type="file"  multiple></td>
									</tr>
									<tr>
										<td>비밀번호 <span class="redStar">*</span></td>
	                   					<td><input type="password" name="secretNumber" required> </td>
									</tr>
								</tbody>
							</table>
						
					</div>
				</div>
				
				<div style="height: 80px;"></div>
				
				<div class="row justify-content-center">
					<div class="col-8" style="text-align: center;">
						<input class="btn btn-outline-secondary" type="button" value="취소" onclick="location.href='/customer/goCustomer';">
						<input class="btn btn-secondary" type="submit" value="확인">
					</div>
				</div>
			</div>
		</form>
		
		
		
		
	</div>
</div>
</body>
</html>