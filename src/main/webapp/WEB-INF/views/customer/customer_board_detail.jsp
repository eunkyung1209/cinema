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
						 ${customerBoard.title} 제목입니다.
						</td>	
						
						 <!-- 본인 또는 관리자에게만 보이는 버튼 -->
						<td class="correct" >
						<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}">
							<li class="nav-item dropdown">
					           	<span class="nav-link dropdown-toggle" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									
					            </span>
					            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
					              	<li><a class="dropdown-item" href="/customer/updateCustomer?customerCode=${customerBoard.customerCode}">글 수정</a></li>
					              	<li><a class="dropdown-item" href="#">글 삭제</a></li>
					            </ul>
					     	</li>
							</c:if>
						</td>
						 
					</tr>
					<tr style="height: 10%; text-align: right;" >
						<td>작성자 |  ${customerBoard.writer}  </td>
						<td>조회여부 | ${customerBoard.isRead } </td>
						<td>등록일 | ${customerBoard.createDate} </td>
					</tr>
					<tr>
						<td colspan="3">${customerBoard.content}</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<!-- 기본 버튼 클래스명: common_btn -->
		<div class="row justify-content-center">
			<div class="col-8 text-center"  >
				 <input class="common_btn" type="button" value="목록으로"  onclick="location.href=/customer/goCustomer;">
			</div>
		</div>
	
		
	
	</div>
</div>
</body>
</html>