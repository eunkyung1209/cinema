<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 자바스크립트 파일 -->
<script type="text/javascript" src="/resources/community/js/community_board_detail.js?ver=5"></script>

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

.replyTable{
	width: 97%;
	text-align: left;
	padding: 10px;
}

.replyTable tr{
	border-top: 1px solid #c9c9c8;
	border-bottom: 1px solid #c9c9c8;

}


input{
	height: 50px;
}

.replyWriter{
	font-size: 12px;
	height: 30%;
	margin-top: 5px;
	margin-left: 5px;
	margin-right: 5px;
}

.createDate{
	font-size: 10px;
	height: 20%;
	margin-bottom: 5px;
	margin-left: 5px;
	margin-right: 5px;
	
}

.replyContent{
	font-size: 14px;
	margin: 5px;
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
					<h5>커뮤니티 상세보기</h5>
				</div>
			</div>
		</div>
		
		<!-- 공간 -->
		<div style="height: 50px;"></div>

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
							 ${commuList.title }
						</td>	
						
						 <!-- 본인 또는 관리자에게만 보이는 버튼 -->
						<td class="correct" >
						<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.nickName eq commuList.writer}">
							<li class="nav-item dropdown">
					           	<span class="nav-link dropdown-toggle" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					           	
					           	</span>
					            
					            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
					              	<li><a class="dropdown-item" href="/community/goUpdateCommu?commuCode=${commuList.commuCode }">글 수정</a></li>
					              	
					              	
					              	<li>
					              		<input type="hidden" value="${commuList.commuCode }" class="commuCode"> 
					              	
					              		<a class="dropdown-item" onclick="deleteCommu();">글 삭제</a>
					              	</li>
					              	
					            </ul>
					     	</li>
						</c:if> 
						</td>	 
					</tr>
					<tr style="height: 10%; text-align: right;" >
						<td>작성자 |  ${commuList.writer}  </td>
						<td>조회수 |  ${commuList.readCnt}  </td>
				       	<td>작성일 |  ${commuList.createDate } </td>
					</tr>
					<tr>
						<td colspan="3">${commuList.content }</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="height: 80px;"></div>
		

<!-- 댓글목록 -->
<div class="row justify-content-center">
	<div class="col-8 text-center" >
		<div >
			<form action="/community/insertCommuReply" method="post">
				<input type="hidden" name="writer" value="${sessionScope.loginInfo.nickName }">
				<input type="hidden" name="commuCode" id="commuCode" value="${commuList.commuCode}">
				
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
				<c:when test="${empty commuReplyList }">
					<tr>
						<td colspan="2">
							등록된 댓글이 없습니다.
						</td>
					</tr>
				</c:when>
				
				
				<c:otherwise>
					<c:forEach items="${commuReplyList}" var="commuReply">
						<tr>
							<td>
								<form action="/community/updateCummuReply" method="post">
									<input type="hidden" name="commuReplyCode" value="${commuReply.commuReplyCode }">
									<input type="hidden" name="commuCode" value="${commuReply.commuCode }">
									<div class="replyWriter m-1">
										${commuReply.writer }
									</div>
									<div class="createDate m-1">${commuReply.createDate }</div>
									<div class="replyContent" data-replyCode="${commuReply.commuReplyCode }" ><div class="upReply">${commuReply.content }</div></div>
								</form>
							</td>
							
							<!-- 본인 또는 관리자 -->
							<td class="correct" >
								<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.nickName eq commuReply.writer}">
									<li class="nav-item dropdown">
							           	<span class="nav-link dropdown-toggle" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							            </span>
							            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
							              	<li><a class="dropdown-item" onclick="updateCommuReply('${commuReply.commuReplyCode }');">댓글 수정</a></li>
							              	<li><a class="dropdown-item" onclick="deleteCommuReply('${commuReply.commuReplyCode }');">댓글 삭제</a></li>
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
				 <input class="common_btn" type="button" value="목록으로"  onclick="location.href='/community/commuList';">
			</div>
		</div>
	</div>
</div>
</body>
</html>