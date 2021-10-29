<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bodyDiv{
	margin-top: 100px;
}

/* 상세보기 표 */
.boardDetail{
	margin: 0 auto;
	width: 100%;
	border-bottom: 1px solid #c9c9c8;
	border-top: 1px solid #c9c9c8;
}
 
tr, td{
height: 50px;
vertical-align: middle;
padding: 10px;

}

/* 제목 Tr */
.titleTr{
height: 10%; 
border-bottom: 1px solid #c9c9c8;
background-color: #f2f2f2
}

/* 본인 또는 관리자에게만 보이는 수정, 삭제 버튼 */
.correct{
	text-align: right;
}


</style>

</head>

<body>
<div class="row bodyDiv">
	<div class="col-12">
	
	<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>COMMU FORM</h5>
				</div>
			</div>
		</div>
	

		<!-- 상세보기 정보를 불러오는 테이블 입니다. 테이블명 : boardDetail -->
		<div class="row justify-content-center" >
			<div class="col-8 " >
				<table class="boardDetail" >
					<colgroup>
						<col width="*">
						<col width="20%">
						<col width="25%">
					</colgroup>
				
					<tr class="titleTr">
						<td colspan="2" >
							 ${communityVO.title }
						</td>	
						
						 <!-- 본인 또는 관리자에게만 보이는 버튼 -->
						<td class="correct" >
						<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.nickName eq communityVO.writer}">
							<li class="nav-item dropdown">
					           	<span class="nav-link dropdown-toggle" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"></span>
					            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
					              	<li><a class="dropdown-item" href="/board/goUpdateBoard?commuCode=${communityVO.commuCode }">글 수정</a></li>
					              	<li><a class="dropdown-item" href="/board/deleteBoard?commuCode=${communityVO.commuCode }">글 삭제</a></li>
					            </ul>
					     	</li>
						</c:if> 
						</td>	 
					</tr>
					<tr style="height: 10%; text-align: right;" >
						<td>작성자 |  ${communityVO.writer}  </td>
						
						
				       <td>작성일 | ${communityVO.createDate } </td>
					</tr>
					<tr>
						<td colspan="3">${communityVO.content }</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 댓글목록 -->
		<div class="row justify-content-center">
			<div class="col-8 text-center" >
				<div >
					<form action="/board/insertReply" method="post">
						<input type="hidden" name="writer" value="${sessionScope.loginInfo.nickName }">
						<input type="hidden" name="commuCode" value="${communityVO.commuCode }">
						
						<div style="height: 30px;"></div>
						
						<input type="text" name="content" <c:if test="${empty sessionScope.loginInfo }">readonly value="로그인 후 댓글 작성이 가능합니다" </c:if> style="width: 92%;">
						<input type="submit" value="등록">
					</form>
				</div>
				
				<div style="height: 30px;"></div>
			
				<table class="replyTable" >
					<colgroup>
						<col width="98%"><col>
						<col width="2%"><col>
					</colgroup>
					
					<c:choose>
						<c:when test="${empty communityReplyVO }">
							<tr>
								<td colspan="2">
									등록된 댓글이 없습니다.
								</td>
							</tr>
						</c:when>
						
						
						<c:otherwise>
							<c:forEach items="${communityReplyVO}" var="communityReplyVO">
								<tr>
									<td>
									<form action="/board/selectReply" method="post">
											<input type="hidden" name="commuCode" value="${communityReplyVO.commuCode }">
											<div class="replyWriter">
												${communityReplyVO.writer }
											</div>
											<div class="createDate">${communityReplyVO.createDate }</div>
											<div class="replyContent" data-replyCode="${communityReplyVO.communityReplyCode }" ><div class="upReply">${communityReplyVO.content }</div></div>
										</form>
									</td>
									
									<!-- 본인 또는 관리자 -->
									<td class="correct" >
										<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.nickName eq communityVO.writer}">
											<li class="nav-item dropdown">
									           	<span class="nav-link dropdown-toggle" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									            </span>
									            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
									              	<li><a class="dropdown-item" onclick="updateCustomerReply('${customerReply.customerReplyCode }');">댓글 수정</a></li>
									              	<li><a class="dropdown-item" onclick="deleteCustomerReply('${customerReply.customerReplyCode }');">댓글 삭제</a></li>
									            </ul>
									     	</li>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					
					</c:choose>
					
					
				</table>
				
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<!-- 기본 버튼 클래스명: common_btn -->
		<div class="row justify-content-center">
			<div class="col-8 text-center"  >
				 <input class="common_btn" type="button" value="목록으로"  onclick="location.href='/board/boardList';">
				
			</div>
		</div>
	</div>
</div>
</body>
</html>