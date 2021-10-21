<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.customerBodyDiv{
	margin-top: 100px;
}
.customerBox{
	margin: 0 auto;
	width: 100%;
	height: 180px;
	text-align: center;
}

.customerBoardDetail{
	margin: 0 auto;
	width: 100%;
	border-bottom: 1px solid white;
	border-top: 1px solid white;
}

.customerBox{
text-align: center;
border: 1px solid white;
}

 
tr, td{
height: 50px;
vertical-align: middle;
padding: 10px;


}

.searchBox{
margin-left: 190px;


}

.loginP{
	text-align: right;
	font-size: 13px;
}

</style>

</head>

<body>
<div class="row customerBodyDiv">
	<div class="col-12">

		<div class="row justify-content-center">
			<div class="col-8 " >
				<table class="customerBox">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr >
						<td style="border: 1px solid white" class="align-middle">
							<button class="btn btn-outline-secondary" onclick="location.href='/customer/goCustomer';">전체문의</button> 
						</td>
						<td style="border: 1px solid white" class="align-middle">
							<button class="btn btn-outline-secondary" onclick="location.href='/customer/goNotice';">공지사항</button> 
						</td>
						<td style="border: 1px solid white" class="align-middle">
							<button class="btn btn-outline-secondary" onclick="location.href='/customer/goMyCustomer';">내 상담내역</button>
						</td>
						<td style="border: 1px solid white" class="align-middle">
							<button class="btn btn-outline-secondary" onclick="location.href='/customer/goLost';">분실물</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="height: 80px;"></div>
		
		<div class="row justify-content-center" >
			<div class="col-8 " >
				<table class="customerBoardDetail" >
					<colgroup>
						<col width="*">
						<col width="20%">
						<col width="25%">
					</colgroup>
				
					<tr style="height: 10%; border-bottom: 1px solid white;">
						<td colspan="3" >${customerBoard.title}</td>
					</tr>
					<tr style="height: 10%; text-align: right;" >
						<td>작성자 ${customerBoard.writer}</td>
						<td>조회여부 ${customerBoard.isRead }</td>
						<td>등록일 ${customerBoard.createDate}</td>
					</tr>
					<tr>
						<td colspan="3">${customerBoard.content}</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<div class="row justify-content-center">
			<div class="col-8" style="text-align: center;" >
				 <input class="btn btn-outline-secondary" type="button" value="목록으로"  onclick="location.href='/customer/goCustomer';">
			</div>
		</div>
	
		
	
	</div>
</div>
</body>
</html>