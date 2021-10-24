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
/* 은빈이 수정중 */
/* 셀렉트박스 기본폼 */
.form-select{
	font-size: 14px;
}
/*검색 버튼 기본폼 */
.self_btn{
	font-size: 14px;
	background-color: #4c4747;
	color: white;
	width: 80px
}
.form-control{
	font-size: 14px;
}

.inputSearch_form{
   font-size: 14px;
   border-radius: 4px;
   border: 1px solid #e0e0e0;
   width: 500px;
}
.inputSearch_form:focus{
   border: 2px solid #c9c9c8;
}
.selectBox_from{
	font-size: 14px;
	width: 110px;
}
.search_form{
	background-color: #e0e0e0;
}
tr{
	border-bottom: 1px solid #e0e0e0;
}

.search_box{
	padding: 22px;
	border: 1px solid #e0e0e0; 
}
.caption_right{
	caption-side: top;
	text-align: right;
}
.caption_left{
	caption-side: top;
	text-align: left;
}


</style>

</head>


<body>
<div  class="row justify-content-center">
	<div class="row justify-content-center">
	
		<div class="col-2">	</div>
		
		<div class="col-8 search_box" style="background-color:#f2f2f2;">
			<div>
				<!-- 셀렉트 박스 -->
				<select class="selectBox_from">
					<option selected>선택</option>
					<option value="TITLE" <c:if test="${customerCenterVO.searchKeyword eq 'TITLE'}">selected</c:if>>제목</option>
					<option value="WRITER" <c:if test="${customerCenterVO.searchKeyword eq 'WRITER'}">selected</c:if>>작성자</option>
				</select>
				
				<!-- 인풋 -->
				<input type="text" class="inputSearch_form" placeholder="검색어를 입력해 주세요">
				
				<!-- 버튼 -->
				<input class="self_btn" type="submit" value="검색">
				
			</div>
		</div>
		
		<div class="col-2"></div>
		
	</div>


</div>


<%-- <div class="row customerBodyDiv">
	<div class="col-12">

		<div class="row " >
			<form action="/customer/goCustomer" method="post">
				<div class="col-8 justify-content-center search_form" >
					<div class="row justify-content-center searchBox " >
									<div class="col-2" >
										<select class="selectBox_from">
											<option selected>선택</option>
											<option value="TITLE" <c:if test="${customerCenterVO.searchKeyword eq 'TITLE'}">selected</c:if>>제목</option>
										 	<option value="WRITER" <c:if test="${customerCenterVO.searchKeyword eq 'WRITER'}">selected</c:if>>작성자</option>
										</select>
									</div>
									
									<div class="col-4" >
										<div>
										  <input type="text" class="inputSearch_form" placeholder="검색어를 입력해 주세요">
										</div>
									</div>
									
									<div class="col-2">
										<input class="btn" type="submit" value="검색">
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
		<div class="col-2"></div> --%>
		
		
		
		
		<div style="height: 80PX;"></div>
		
		
		
		
		
		
		<div class="row justify-content-center">
	
		<div class="col-2">	</div>
		
		<div class="col-8 ">
			
			
			<div class="row justify-content-center">
				<div class="col-6 loginP">
					<div style="text-align: left;">
						<input class="btn btn-outline-secondary" type="button" onclick="location.href='/customer/goWriteCustomer';" id="button-addon2"  <c:if test="${empty sessionScope.loginInfo }">disabled</c:if> value="글쓰기">
					</div>
				</div>
				<div class="col-6" style="padding-top: 15px; text-align: right;"> 
					<c:if test="${empty sessionScope.loginInfo }">
						* 글쓰기는 로그인 후 이용가능합니다.
					</c:if>
				</div>					
					
					
		</div>
		</div>
		
		<div class="col-2"></div>
		
	</div>
		
		<div class="row justify-content-center" >
			<div class="col-8 " >
			
				<table class="customerBoardList" >
				
				<%-- 	<caption class="caption_left">
						<input class="btn btn-outline-secondary" type="button" onclick="location.href='/customer/goWriteCustomer';" id="button-addon2"  <c:if test="${empty sessionScope.loginInfo }">disabled</c:if> value="글쓰기">
							<c:if test="${empty sessionScope.loginInfo }">
								* 글쓰기는 로그인 후 이용가능합니다.
							</c:if>
					</caption> --%>
					
					<%-- <caption class="caption_left">
						<input class="btn btn-outline-secondary" type="button" onclick="location.href='/customer/goWriteCustomer';" id="button-addon2"  <c:if test="${empty sessionScope.loginInfo }">disabled</c:if> value="글쓰기">
					</caption> --%>
					
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
					  	<tr >
					      <th scope="col" class="align-middle" >1</th>
					     <th scope="col" class="align-middle"><a href="/member/board_detail_form">제1111목</a></th>
					      <th scope="col" class="align-middle">작11111성자</th>
					      <th scope="col" class="align-middle">등111록일</th>
					    </tr>
					 
					   </tbody>
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