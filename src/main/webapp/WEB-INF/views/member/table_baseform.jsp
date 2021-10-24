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

.customerBoardList{
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

 
.customerBoardList > thead{
border-bottom: 1px solid white;
border-top: 1px solid white;

}

tr, td{
height: 50px;

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

		<div class="row " >
			<form action="/customer/goCustomer" method="post">
				<div class="col-10 " >
					<div class="row justify-content-center searchBox " >
							<div class="col-2" >
								<select class="form-select " aria-label="Default select example" name="searchKeyword">
									 <option selected>선택</option>
									  <option value="TITLE" <c:if test="${customerCenterVO.searchKeyword eq 'TITLE'}">selected</c:if>>제목</option>
									  <option value="WRITER" <c:if test="${customerCenterVO.searchKeyword eq 'WRITER'}">selected</c:if>>작성자</option>
								</select>
							</div>
							
									<div class="col-4" >
										<div class="input-group mb-3">
										  <input value="${customerCenterVO.searchValue}" name="searchValue" type="text" class="form-control" placeholder="input content" aria-label="Recipient's username" aria-describedby="button-addon2">
										</div>
									</div>
									
									<div class="col-2">
										<input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="검색">
									</div>
									
									<div class="col-2" style="text-align: right; padding-left: 240px; ">
										<input class="btn btn-outline-secondary" type="button" onclick="location.href='/customer/goWriteCustomer';" id="button-addon2"  <c:if test="${empty sessionScope.loginInfo }">disabled</c:if> value="글쓰기">
									</div>
						</div>
						<div class="row justify-content-center">
							<div class="col-12 loginP">
								<c:if test="${empty sessionScope.loginInfo }">
									* 글쓰기는 로그인 후 이용가능합니다.
								</c:if>
							</div>
						</div>
						
					</div>
				</form>
			</div>
		
		<div style="height: 20PX;"></div>
		
		<div class="row justify-content-center" >
			<div class="col-8 " >
				<table class="customerBoardList" >
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
					  
					  <c:forEach items="${customerBoardList}" var="customerBoard" varStatus="status">
					  <tbody>
						<tr>
					      <th scope="row" class="align-middle">${status.count }</th>
					      <td class="align-middle"><a href="/customer/selectCustomerBoardPw?customerCode=${customerBoard.customerCode }&secretNumber=${customerBoard.secretNumber }">${customerBoard.title }</a> </td>
					      <td class="align-middle">${customerBoard.writer }</td>
					      <td class="align-middle">${customerBoard.createDate } </td>
					    </tr>
					   </tbody>
					</c:forEach>
					</table>
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<div class="row justify-content-center">
			<div class="col-8" >
				
				<nav aria-label="...">
			  <ul class="pagination  justify-content-center">
			    <li class="page-item <c:if test="${!customerCenterVO.prev }">disabled</c:if>">
			    		<a class="page-link" href="/customer/goCustomer?nowPage=${customerCenterVO.beginPage - 1 }">Prev</a>
			    </li>
			    
			    <c:forEach begin="${customerCenterVO.beginPage }" end="${customerCenterVO.endPage }" var="pageNumber">
					<li class="page-item <c:if test="${customerCenterVO.nowPage eq pageNumber }"> active</c:if>" aria-current="page">
			     		 <a class="page-link " href="/customer/goCustomer?nowPage=${pageNumber }&searchKeyword=${customerCenterVO.searchKeyword}&searchValue=${customerCenterVO.searchValue}" >${pageNumber }</a>
			    	</li>
			    	
				</c:forEach>
			    
			    <li class="page-item <c:if test="${!customerCenterVO.next }"> disabled</c:if>">
			     		<a class="page-link" href="/customer/goCustomer?nowPage=${customerCenterVO.endPage + 1 }">Next</a>
			    </li>
			  </ul>
		</nav>
				
			</div>
		</div>
	
		
	
	</div>
</div>
</body>
</html>