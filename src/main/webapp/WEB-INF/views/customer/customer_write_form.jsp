<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cusBox{
	height: 100px;
	border: 1px solid white;
	padding-top: 10px;
	text-align: center;
}


.customerWrite{
margin: 0 auto;
width: 100%;
border-bottom: solid 1px white;
height: 500px;


}
td:first-child{
	text-align: center;
}

tr{
border-bottom: 1px solid white;
}

td{
vertical-align: middle;
}


input[type="text"] {
	width: 100%;
	height: 50%;

}

input[type="password"] {
	width: 100%;
	height: 50%;

}

.redStar{
	color: red;
} 

.needInput{
	font-size: 13px;
	margin-left: 70%;
}
 
</style>


</head>
<body>
<div class="row bodyDiv" >
	<div class="col-12">
	<form action="/customer/insertCustomerBoard" method="post">
			<div class="row justify-content-center align-middle">
				<div class="col-8  cusBox " >
				
					<div>FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.</div> <br>
					<div> - 1:1 문의글 답변 운영시간 10:00 ~ 19:00</div> 
					<div> - 접수 후 48시간 안에 답변 드리겠습니다.</div> 
				</div>
				
				<div style="height: 80px;"> </div>
				
				<div class="row justify-content-center" >
					<div class="col-8" >
						
							
							<table class="customerWrite">
								<colgroup>
									<col width="20%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<td colspan="2" class="align-middle">
											<span style="font-size: 25px;">문의내용</span> 
											<span class="needInput" style=""><span class="redStar">*</span>필수입력</span>
											<input type="hidden" name="isNotice" value="N">
										</td>
									</tr>
									
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
										<td >제목 <span class="redStar">*</span></td>
										<td ><input style="width: 100%;" type="text" name="title" required> </td>
									</tr>
									<tr>
										<td >작성자 <span class="redStar">*</span></td>
										<td> <input type="text" style="color: black;" name="writer" readonly required value="${sessionScope.loginInfo.nickName }"></td>
									</tr>
									<tr>
										<td>내용 <span class="redStar">*</span></td>
										<td><textarea style="width: 100%; height:90%;  padding-top: 5px; "  name="content" required></textarea> </td>
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