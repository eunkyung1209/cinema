<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 스크립트 연결 -->

<script type="text/javascript" src="/resources/member/js/member_delete.js?ver=21"></script>

<style type="text/css">


/* 작성테이블 */
.writeTable{
margin: 0 auto;
width: 75%;
border-bottom: solid 1px #c9c9c8;
height: 500px;
}

.td:first-child{
	text-align: center;
	/* background-color: #f2f2f2; */
}
tr{
	border-bottom: 1px solid #c9c9c8;
}

td{
	vertical-align: middle;
	padding: 5px;
	padding-left: 10px;
	border: 1px solid black;

}
input[type="password"], input[type="email"] {
	width: 68%;

}
select {
	width: 30%; 
}

/* 필수입력 빨간 별 */
.redStar{
	color: red;
} 

/* *필수입력 문장  */
.needInput{
	font-size: 13px;
	margin-left: 76%;
}
 

/*검색 버튼 기본폼 */
.common_btn{
	background-color: #4c4747;
	color: white;
	width: 80px;
	font-size: 11px;
}
.common_btn:hover{
	font-size: 11px;
	background-color: #5d5959;
	color: white;
	width: 80px;
}
.agree{
	background-color: white;
	width: 90%;
	margin: 0 auto;
}


/* 사진 글자 */
			.jb-wrap {
				width: 67%;
				margin: 0px auto;
				position: relative;
			}
			.jb-wrap img {
				width: 100%;
				vertical-align: middle;
			}
			.jb-text {
				position: absolute;
				top: 0px;
				width: 100%;
				height: 100%;
			}
			.jb-text-table {
				display: table;
				width: 100%;
				height: 100%;
			}
			.jb-text-table-row {
				display: table-row;
			}
			.jb-text-table-cell {
				display: table-cell;
				vertical-align: middle;
			}
			.memeber_name {
				margin: 0px 187px;
				margin-bottom: -37px;
				padding: 2px;
				width: 130px;
				text-align: right;
			}
			.memeber_id{
				margin: 0px 275px;
				margin-bottom: 1000px;
				padding: 2px;
				text-align: right;
				width: 130px;
			}

</style>


</head>
<body>

		<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>마이페이지</h5>
				</div>
			</div>
		</div>
	
		<!-- 공간 -->
		<div style="height: 30px;"></div>


<form class="row g-3" action="/member/join" method="post" id="joinForm">
<div class="row bodyDiv" >
	<div class="col-12">
	
	<!-- 글 작성 테이블 입니다. 테이블 클래스명 : writeTable 수정 후 사용바랍니다.-->
 			<div class="row justify-content-center align-middle">
			
			<!-- 	<div class="row justify-content-center" >
					<div class="col-8" style="text-align: center;" >
						<div><img alt="" height="420px;" src="/resources/images/member/돼지저금통.PNG"><span></span> 이름</div>
						<div>
							이름
						</div>
					</div>
				</div> - -->
				
				



		
<div class="jb-wrap">
	<div class="jb-image"><img alt="" width="700px;" height="420px;" src="/resources/images/member/돼지주황.PNG"></div>
	<div class="jb-text"> 
		<div class="jb-text-table">
			<div class="jb-text-table-row">
				<div class="jb-text-table-cell">
				
					<div class="memeber_name" style="font-size: 25px;">
						<!-- <p class="memeber_name" style="font-size: 25px;"> -->
						
						
						<table class="pig" style="border: 1px solid black; margin-left: 35px; margin-top:10px;">
							<tr style="border: 1px solid black; ">
								<td colspan="4" style="width: 80px; background-color: none; "></td>
								
								<!--  -->
								<td colspan="10" style="width: 80px; font-size:11px; height: 80px;">d</td>
								
								
								<td style="width: 80px; font-size:15px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								
								
								
							</tr>
							<tr style="border: 1px solid black; ">
							<td colspan="4" style="width: 80px; "></td>
							
								<!--  -->
								<td colspan="10" style="width: 80px; font-size:11px; height: 82px;"></td>
								
								<td style="width: 80px; font-size:15px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								
								
							</tr>
							
							<tr style="border: 1px solid black; ">
								<td style="width: 80px; font-size:10px; height: 80px;"></td>
								
								<td colspan="9" style="width: 80px; font-size:15px; height: 13px;"></td>
								
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td colspan="5" style="width: 80px; font-size:14px; height: 13px;">d</td>
								

							</tr>
							<tr style="border: 1px solid black; ">
								<td style="width: 80px; font-size:10px; height: 80px;">d</td>
								
								<td colspan="9" style="width: 80px; font-size:15px; height: 13px;">d</td>
								
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td style="width: 80px; font-size:14px; height: 13px;">d</td>
								<td colspan="5" style="width: 80px; font-size:14px; height: 13px;">d</td>
								
							</tr>
							<tr style="border: 1px solid black; ">
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
								<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>

							
								
								
							</tr>
							
							

						</table>
						<!-- </p> -->
					</div>
					
					
					
					
					
				</div>
			</div>
		</div>
		
				<%-- <div class="jb-text-table-cell">
					<p class="memeber_id" style="font-size: 15px;">${sessionScope.loginInfo.id }</p>
				</div> --%>
				
	</div>
</div>				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				



				<div style="height: 80px;"></div>
				
				<!-- 기본 버튼 클래스명: common_btn -->
				<div class="row justify-content-center">
					<div class="col-8" style="text-align: center;">
						<input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/movie/mainPage';">
						<input class="common_btn" type="button" value="내정보수정" onclick="location.href='updateMyPage?id=${memberInfo.id }';">
						
						<input type="hidden" value="${sessionScope.loginInfo.id }" class="id"> 
						<input class="common_btn" type="button" value="회원탈퇴" onclick="deleteMember();">
						
					</div>
				</div>
			</div>
	</div>
</div>
</form>

</body>
</html>