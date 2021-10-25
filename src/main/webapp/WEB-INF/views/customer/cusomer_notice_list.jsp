<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* 목록조회 페이지 폼 */

/* 검색박스 폼 */
.search_box{
	padding: 22px;
	border: 1px solid #e0e0e0;
	border-radius: 0.4em;
	background-color:#f2f2f2;
}

/* 검색창 폼 */
.inputSearch_form{
   font-size: 14px;
   border-radius: 4px;
   border: 1px solid #e0e0e0;
   width: 600px;
}
.inputSearch_form:focus{
   border: 2px solid #c9c9c8;
}

/* 셀렉트박스 폼 */
.selectBox_from{
	font-size: 14px;
	width: 110px;
}
.search_form{
	background-color: #e0e0e0;
	text-align:center;
}

/* 테이블 폼 */
tr{
	border-bottom: 1px solid #e0e0e0;
}
tr, td{
	height: 50px;
	vertical-align: middle;
}
.customerBoardList{
	margin: 0 auto;
	width: 100%;
	text-align: center;
	border-bottom: 1px solid white;
	border-top: 1px solid white;
	vertical-align: middle;
}

/* 페이징 폼 */
a{
	color: gray;
}
a:hover{
	color: black;
	font-weight: bold;
}

.customerBox{
	margin: 0 auto;
	padding-top: 20px;
	height: 180px;
	text-align: center;
	border:  1px solid #e0e0e0;
	border-radius: 4px;
}

.customerBox_s{
	border-left: 1px solid #e0e0e0;
}

</style>
</head>


<body>
<div class="row bodyDiv">
	<div class="col-12">
		
		<!-- 커스토머 박스 -->
		<div class="row justify-content-center">
			<div class="col-8 customerBox" >
				<div class="row justify-content-center" >
					<div class="col-3 customerBox_s" >
						<div>
							<img alt="" width="130px;" height="100px;" src="/resources/images/customer/전체문의.png">
						</div>
						<div>
							<button class="btn btn-outline-secondary" onclick="location.href='/customer/goCustomer';">전체문의</button> 
						</div>
					</div>
					<div class="col-3 customerBox_s">
						<div>
							<img alt="" width="130px;" height="100px;" src="/resources/images/customer/공지사항.png">
						</div>
						<div>
							<button class="btn btn-outline-secondary" onclick="location.href='/customer/goNotice';">공지사항</button> 
						</div>
					</div>
					<div class="col-3 customerBox_s">
						<div>
							<img alt="" width="130px;" height="100px;" src="/resources/images/customer/나의문의.png">
						</div>
						<div>
							<button class="btn btn-outline-secondary" <c:if test="${empty sessionScope.loginInfo }">disabled</c:if>  onclick="location.href='/customer/goMyCustomer?writer=${sessionScope.loginInfo.nickName }';">내 상담내역</button>
						</div>
					</div>
					<div class="col-3 customerBox_s" >
						<div>
							<img alt="" width="130px;" height="100px;" src="/resources/images/customer/분실물.png">
						</div>
						<div>
							<button class="btn btn-outline-secondary" onclick="location.href='/customer/goLost';">분실물</button>
						</div>
					</div>
				 </div> 
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		
		<!-- 검색폼 -->
		<div  class="row justify-content-center">
			<div class="row justify-content-center">
				<div class="col-8 search_box text-center" >
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
						<input class="common_btn" type="submit" value="검색">
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 공간띄우기 -->
		<div style="height: 50PX;"></div>
		
		<!-- 글쓰기버튼 -->
		<div class="row justify-content-center">
		
			<div class="col-2">	</div>
			
				<div class="col-8 ">
					<div class="row justify-content-center">
						<div class="col-6">
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
		
		<!-- 테이블 -->
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
					      <td class="align-middle"><a href="/customer/selectCustomerBoardDetail?customerCode=${customerBoard.customerCode }">${customerBoard.title }</a> </td>
					      <td class="align-middle">${customerBoard.writer }</td>
					      <td class="align-middle">${customerBoard.createDate } </td>
					    </tr>
					   </tbody>
					</c:forEach>
					 
					   </tbody>
					</table>
			</div>
		</div>
			
				<!-- 공간띄우기 -->
			<div style="height: 30px;"></div>
		
		
		<!-- 페이징 -->	
		<div class="row justify-content-center">
			<div class="col-8" >
				
			  <ul class="pagination justify-content-center">
			  
				    <li class=" <c:if test="${!customerCenterVO.prev }">disabled</c:if>">
				    		<a class="" href="/customer/goCustomer?nowPage=${customerCenterVO.beginPage - 1 }">&nbsp;&nbsp; < &nbsp;&nbsp;</a>
				    </li>
				    
				    <c:forEach begin="${customerCenterVO.beginPage }" end="${customerCenterVO.endPage }" var="pageNumber">
						<li class=" <c:if test="${customerCenterVO.nowPage eq pageNumber }"> active</c:if>" aria-current="page">
				     		 <a class="" href="/customer/goCustomer?nowPage=${pageNumber }&searchKeyword=${customerCenterVO.searchKeyword}&searchValue=${customerCenterVO.searchValue}" >${pageNumber }</a>
				    	</li>
					</c:forEach>
				    
				    <li class=" <c:if test="${!customerCenterVO.next }"> disabled</c:if>">
				     		<a class="" href="/customer/goCustomer?nowPage=${customerCenterVO.endPage + 1 }">&nbsp;&nbsp; > &nbsp;&nbsp;</a>
				    </li>
			  </ul>
				
			</div>
		</div>
	
	
	
	</div>
</div>


	
		
</body>
</html>