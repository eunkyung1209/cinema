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
	background-color: black;
	color: white;
}
.customerBox{
	margin: 0 auto;
	width: 100%;
	height: 180px;
	text-align: center;
}

.customerNoticeList{
	margin: 0 auto;
	width: 100%;
	text-align: center;
	border-bottom: 1px solid white;
	border-top: 1px solid white;
	vertical-align: middle;
}

.customerBox{
text-align: center;
border: 1px solid white;
}

 
.customerNoticeList > thead{
border-bottom: 1px solid white;
border-top: 1px solid white;

}

tr, td{
height: 50px;

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
							<button onclick="location.href='/customer/goCustomer';">전체문의</button> 
						</td>
						<td style="border: 1px solid white" class="align-middle">
							<button onclick="location.href='/customer/goNotice';">공지사항</button> 
						</td>
						<td style="border: 1px solid white" class="align-middle">
							<button onclick="location.href='/customer/goMyCustomer';">내 상담내역</button>
						</td>
						<td style="border: 1px solid white" class="align-middle">
							<button onclick="location.href='/customer/goLost';">분실물</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="height: 80px;"></div>
		
		<div class="row justify-content-center">
			<div class="col-8 " >
				<div></div>
				<table class="customerNoticeList" >
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="*">
						<col width="20%">
					</colgroup>
					<thead>
					    <tr >
					      <th scope="col" class="align-middle" >no</th>
					      <th scope="col" class="align-middle">제목</th>
					      <th scope="col" class="align-middle">작성자</th>
					      <th scope="col" class="align-middle">등록일</th>
					    </tr>
					  </thead>
					  
					  <c:forEach items="${customerBoardList}" var="customerBoard">
					  <tbody>
						<tr>
					      <th scope="row" class="align-middle">1</th>
					      <td class="align-middle">${customerBoard.title }</td>
					      <td class="align-middle">${customerBoard.writer }</td>
					      <td class="align-middle">${customerBoard.createDate }</td>
					    </tr>
					   </tbody>
					</c:forEach>
					    
					
					</table>
					
					
		
					
					
					
			</div>
		</div>
	
	</div>
</div>
</body>
</html>