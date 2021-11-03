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
/* 상세보기 버튼폼 */
.common_btn2{
	font-size: 12px;
	background-color: #ed7d31;
	color: white;
	width: 65px;
}
.common_btn2:hover{
	font-size: 12px;
	background-color: #5d5959;
	color: white;
	width: 65px;
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

		<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>회원정보목록</h5>
				</div>
			</div>
		</div>
	
		<!-- 공간 -->
		<div style="height: 30px;"></div>


<!-- 검색폼 -->
<form action="/admin/adminMemberList" method="post">
<div  class="row justify-content-center">
	<div class="row justify-content-center">
	
		<div class="col-2">	</div>
		
		<div class="col-8 search_box text-center" >
		
			<div>
				<!-- 셀렉트 박스 -->
				<select class="selectBox_from" name="searchKeyword">
					<option selected>전체</option>
					<option value="ID" <c:if test="${memberVO.searchKeyword eq 'ID' }">selected</c:if>>아이디</option>
					<option value="NAME" <c:if test="${memberVO.searchKeyword eq 'NAME' }">selected</c:if>>이름</option>
					<option value="NICKNAME" <c:if test="${memberVO.searchKeyword eq 'NICKNAME' }">selected</c:if>>닉네임</option>
					<option value="TELL" <c:if test="${memberVO.searchKeyword eq 'TELL' }">selected</c:if>>번호</option>
				</select>
				
				<!-- 인풋 -->
				<input type="text" class="inputSearch_form" name="searchValue" value="${memberVO.searchValue }" placeholder=" 검색어를 입력해 주세요">
				
				<!-- 버튼 -->
				<input class="common_btn" type="submit" value="검색">
				
			</div>
		</div>
		
		<div class="col-2"></div>
		
	</div>
</div>
</form>

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
			      <th scope="col" class="align-middle" >NO</th>
			      <th scope="col" class="align-middle">이름</th>
			      <th scope="col" class="align-middle">아이디</th>
			      <th scope="col" class="align-middle">닉네임</th>
			      <th scope="col" class="align-middle">번호</th>
			      <th scope="col" class="align-middle">비고</th>
			    </tr>
			  </thead>
				<c:choose>
					<c:when test="${not empty memberList }">
						<c:forEach items="${memberList }" var="memberInfo" varStatus="status">
							<tr>
								<th scope="row" class="align-middle">${status.count }</th>
								<td class="align-middle">${memberInfo.name }</td>
								<td class="align-middle">${memberInfo.id }</td>
								<td class="align-middle">${memberInfo.nickName }</td>
								<td class="align-middle">${memberInfo.tell }</td>
								<td class="align-middle">
									<a href="/admin/adminMemberDetail?id=${memberInfo.id }"><input type="button" class="common_btn2" value="상세보기" ></a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
							<tr>
								<td colspan="6">등록된 글이 없습니다.</td>
							</tr>
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
	
		<div class="row mt-5">
			<ul class="pagination justify-content-center">
				<!--                               pageVO.prev = pageVO.getPrev() -->
				<li class=" <c:if test="${!memberVO.prev }">disabled</c:if>">
					<a class="" href="/admin/adminMemberList?nowPage=${memberVO.beginPage - 1 }">&nbsp;&nbsp; < &nbsp;&nbsp;</a>
				</li>
				<c:forEach begin="${memberVO.beginPage }"  end="${memberVO.endPage }" var="pageNumber">
					<li class=" <c:if test="${pageNumber eq memberVO.nowPage }">active</c:if>">
					<a class="" href="/admin/adminMemberList?nowPage=${pageNumber }&searchKeyword=${memberVO.searchKeyword }&searchValue=${memberVO.searchValue }">${pageNumber }</a></li>
				</c:forEach>
				<!--                               pageVO.prev = pageVO.getPrev() -->
				<li class=" <c:if test="${!memberVO.next }">disabled</c:if>">
					<a class="" href="/admin/adminMemberList?nowPage=${memberVO.endPage + 1 }">&nbsp;&nbsp; > &nbsp;&nbsp;</a>
				</li>
			</ul>
		</div>

	</div>
</div>


<!-- 뒤로가기 버튼 -->
<!-- <input type="button" class="common_btn" value="뒤로가기" onclick="location.href='/movie/mainPage';"> -->
	
		
</body>
</html>