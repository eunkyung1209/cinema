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
/* .common_btn{
	font-size: 14px;
	background-color: #4c4747;
	color: white;
	width: 80px;
}
.common_btn:hover{
	font-size: 14px;
	background-color: #5d5959;
	color: white;
	width: 80px;
} */

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
					<h5>커뮤니티</h5>
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
						<form action="/community/commuList" method="post">
						<!-- 셀렉트 박스 -->
						<select class="selectBox_from" name="searchKeyword">
							<option selected>선택</option>
							<option value="TITLE" <c:if test="${communityVO.searchKeyword eq 'TITLE'}">selected</c:if>>제목</option>
							<option value="WRITER" <c:if test="${communityVO.searchKeyword eq 'WRITER'}">selected</c:if>>작성자</option>
							<option value="CREATE_DATE" <c:if test="${communityVO.searchKeyword eq 'CREATE_DATE'}">selected</c:if>>등록일</option>
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
		<div style="height: 50PX;"></div>
		
		<!-- 글쓰기버튼 -->
		<div class="row justify-content-center">
		
			<div class="col-2">	</div>
			
				<div class="col-8 ">
					<div class="row justify-content-center">
						<div class="col-6">
							<div style="text-align: left;">
								<input class="btn common_btn" type="button" onclick="location.href='/community/commuWrite';" id="button-addon2"  <c:if test="${empty sessionScope.loginInfo }">disabled</c:if> value="글쓰기">
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
			
				<table class="board_list" >
					
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="*">
						<col width="20%">
					</colgroup>
					<thead>
					    <tr >
					      
					      <th scope="col" class="align-middle" >NO</th>
					      <th scope="col" class="align-middle">제목</th>
					      <th scope="col" class="align-middle">작성자</th>
					      <th scope="col" class="align-middle">등록일</th>
					      <th scope="col" class="align-middle">조회수</th>
					    </tr>
					  </thead>
					  <tbody>
		
		<c:choose>
			<c:when test="${empty commuList }">
				<tr>
					<td class="align-middle" colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${commuList }" var="communityInfo" varStatus="status">
					<tbody>
						<%-- <c:if test="${sessionScope.loginInfo.nickName} eq ${communityVO.writer }"> --%>
						<tr>
							<th scope="row" class="align-middle">${status.count }</th>
							
							<c:if test="${communityInfo.isSecret eq 'Y'}">
								<td class="align-middle">
									<img alt="" width="10px" src="/resources/images/community/자물쇠.PNG">
									<a href="/community/selectCommuPw?commuCode=${communityInfo.commuCode }&secret=${communityInfo.secret }">${communityInfo.title }</a>
								 </td>
							</c:if>
							<c:if test="${communityInfo.isSecret eq 'N'}">
								<td class="align-middle">
									<a href="/community/selectCommuDetail?commuCode=${communityInfo.commuCode }">${communityInfo.title }</a>
								 </td>
							</c:if>
							
							<td class="align-middle">${communityInfo.writer }</td>
							<td class="align-middle">${communityInfo.createDate }</td>
							<td class="align-middle">${communityInfo.readCnt }</td>
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
			  
				    <li class=" <c:if test="${!communityVO.prev }">disabled</c:if>">
				    		<a class="" href="/community/commuList?nowPage=${communityVO.beginPage - 1 }">&nbsp;&nbsp; < &nbsp;&nbsp;</a>
				    </li>
				    
				    <c:forEach begin="${communityVO.beginPage }" end="${communityVO.endPage }" var="pageNumber">
						<li class=" <c:if test="${communityVO.nowPage eq pageNumber }"> active</c:if>">
				     		 <a class="" href="/community/commuList?nowPage=${pageNumber }&searchKeyword=${communityVO.searchKeyword}&searchValue=${communityVO.searchValue}" >${pageNumber }</a>
				    	</li>
					</c:forEach>
				    
				    <li class=" <c:if test="${!communityVO.next }"> disabled</c:if>">
				     		<a class="" href="/community/commuList?nowPage=${communityVO.endPage + 1 }">&nbsp;&nbsp; > &nbsp;&nbsp;</a>
				    </li>
			    
			  </ul>
				
			</div>
		</div>
			
	
	
	
	
	</div>
</div>
	



	
		
</body>
</html>