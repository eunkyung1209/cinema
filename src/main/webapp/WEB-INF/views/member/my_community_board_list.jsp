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

/*검색 버튼 기본폼 */
.common_btn{
	font-size: 14px;
	background-color: #ed7d31;
	color: white;
	width: 80px;
	height: 40px;
}
.common_btn:hover{
	font-size: 14px;
	background-color: #5d5959;
	color: white;
	width: 80px;
	height: 40px;
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
}
.board_list{
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

</style>
</head>


<body>
<!-- 전체Div -->
<div class="row justify-content-center bodyDiv">
	<div class="col-12">
	
		<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>${sessionScope.loginInfo.nickName }님의 COMMUNITY</h5>
				</div>
			</div>
		</div>
	
		<!-- 공간 -->
		<div style="height: 50px;"></div>
	
	
		<!-- 검색폼 -->
		<div  class="row justify-content-center">
			<div class="row justify-content-center">
			
				<div class="col-2">	</div>
				<div class="col-8 search_box text-center" >
				
					<div>
						<form action="/member/myBoardList" method="post">
						<input type="hidden" name="nickName" value="${sessionScope.loginInfo.nickName}">
						<!-- 셀렉트 박스 -->
						<select class="selectBox_from" name="searchKeyword">
							<option selected>선택</option>
							<option value="TITLE" <c:if test="${memberVO.searchKeyword eq 'TITLE'}">selected</c:if>>제목</option>
							<option value="CREATE_DATE" <c:if test="${memberVO.searchKeyword eq 'CREATE_DATE'}">selected</c:if>>등록일</option>
						</select>
						
						<!-- 인풋 -->
						<input type="text" class="inputSearch_form" name="searchValue" placeholder="검색어를 입력해 주세요">
						
						<!-- 버튼 -->
						<input class="common_btn" type="submit" value="검색">
						</form>
					</div>
				</div>
				<div class="col-2"></div>
				
			</div>
		
		
		</div>

														<!-- 공간띄우기 -->
												<div style="height: 80PX;"></div>


		<!-- 테이블 -->
		<div class="row justify-content-center" >
			<div class="col-8 " >
			
				<table class="board_list" >
					
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
					      <th scope="col" class="align-middle">조회수</th>
					    </tr>
					  </thead>
					  <tbody>
		
		<c:choose>
			<c:when test="${empty boardList }">
				<tr>
					<td class="align-middle" colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${boardList }" var="communityVO" varStatus="status">
					<tbody>
						<%-- <c:if test="${sessionScope.loginInfo.nickName} eq ${communityVO.writer }"> --%>
						<tr>
							<td scope="row" class="align-middle">${status.count } </td>
							<td class="align-middle">${communityVO.title }</td>
							<td class="align-middle">${communityVO.writer }</td>
							<td class="align-middle">${communityVO.createDate }</td>
							<td class="align-middle">${communityVO.readCnt }</td>
						</tr>
						<%-- </c:if> --%>
					</tbody>
				</c:forEach>
			</c:otherwise>
			
		</c:choose>
	
	
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
			  
				    <li class=" <c:if test="${!memberVO.prev }">disabled</c:if>">
				    		<a class="" href="/member/myBoardList?nowPage=${memberVO.beginPage - 1 }">&nbsp;&nbsp; < &nbsp;&nbsp;</a>
				    </li>
				    
				    <c:forEach begin="${memberVO.beginPage }" end="${memberVO.endPage }" var="pageNumber">
						<li class=" <c:if test="${memberVO.nowPage eq pageNumber }"> active</c:if>">
				     		 <a class="" href="/member/myBoardList?nowPage=${pageNumber }&searchKeyword=${memberVO.searchKeyword}&searchValue=${memberVO.searchValue}" >${pageNumber }</a>
				    	</li>
					</c:forEach>
				    
				    <li class=" <c:if test="${!memberVO.next }"> disabled</c:if>">
				     		<a class="" href="/member/myBoardList?nowPage=${memberVO.endPage + 1 }">&nbsp;&nbsp; > &nbsp;&nbsp;</a>
				    </li>
			    
			  </ul>
				
			</div>
		</div>
			
	
	
	
	
	</div>
</div>
	



	
		
</body>
</html>