<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">



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
 
 
</style>


</head>
<body>
<div class="row bodyDiv" >
	<div class="col-12">
	<form action="/customer/insertCustomerBoard" method="post">
			<div class="row justify-content-center align-middle">
				
				<div style="height: 80px;"> </div>
				
				<div class="row justify-content-center" >
					<div class="col-8" >
						
							
							<table class="writeTable">
								<colgroup>
									<col width="20%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<td colspan="2" style="background-color: white;">
											<span style="font-size: 25px;">문의내용</span> 
											<span class="needInput" style=""><span class="redStar">*</span>필수입력</span>
											<input type="hidden" name="isNotice" value="N">
										</td>
									</tr>
									
									<tr>
										<td >분류 <span class="redStar">*</span></td>
										<td >
											<select>
												<option>12</option>
												<option>13</option>
												<option>13</option>
												<option>13</option>
												<option>13</option>
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
										<td><textarea style="width: 100%; height:90%;  padding-top: 5px; "  name="content" required></textarea> </td>
									</tr>
									<tr>
										<td>파일첨부</td>
	                   					<td><input name="file2" id="formFileMultiple" type="file"  multiple ></td>
									</tr>
									<tr>
										<td>비밀번호 <span class="redStar">*</span></td>
	                   					<td><input type="password" name="secretNumber" required> </td>
									</tr>
									<tr>
										<td>라디오버튼</td>
										<td>
											<input type="radio" name="isNotice" value="N" checked> 라디오
											<input type="radio" name="isNotice" value="Y"> 버튼
										</td>
									</tr>
									<tr>
										<td>체크박스</td>
										<td>
											<input type="checkbox" name="isNotice" value="N" checked> 체크
											<input type="checkbox" name="isNotice" value="Y"> 박스
										</td>
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