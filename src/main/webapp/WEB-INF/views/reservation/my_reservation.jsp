<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* 사진 글자 */
.jb-wrap {
   width: 100%;
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

.myReserve{
}
 
.myReserveTable{
	width: 550px;
	margin-left: 15px;
} 

.myReserveTable tr, td{
	text-align: left;

}

td:last-child {
	padding-left: 50px;
}

</style>


</head>
<body>
<div class="row">
	<div class="col-12 bodyDiv">
	
	<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>나의 예매내역</h5>
				</div>
			</div>
		</div>
		
		<div style="height: 50px;"></div>
		
		<div class="row justify-content-center">
			<div class="col-2 text-center" style=" height: 300px;">
				<img alt="" src="/resources/images/reservation/프사.png">
				<div class="m-3">${sessionScope.loginInfo.nickName } 님</div>
			
			</div>
			
			<div class="col-6 text-center">
				
				<c:choose>
					<c:when test="${empty myReserveList }">
						<div class="jb-wrap m-2">
					         <div class="jb-image">
					         	<img alt="" width="700px;" height="200px;" src="/resources/images/reservation/티켓1.jpg">
					         </div>
					         
				         	<div class="jb-text"> 
					            <div class="jb-text-table">
					               <div class="jb-text-table-row">
					                  <div class="jb-text-table-cell">
					                  
					                     <div class="myReserve">
					                        <table class="myReserveTable">
					                        	<colgroup>
					                        		<col width="30%">
					                        		<col width="*">
					                        	</colgroup>
					                        	<tr>
					                        		<td rowspan="3"><img alt="" width="30px;" height="150px;" src="/resources/images/reservation/영화.PNG"> </td>
					                        		<td style="vertical-align: middle; font-size: 15px;">
					                        			<div class="text-center" style="font-size: 30px;">TICKET</div>
					                        			<div style="height: 30px;"></div>
					                        			<div class="m-1" style="font-size: 20px;">예매내역이 없습니다.</div>
					                        			
					                        		</td>
					                        	</tr>
					                        </table>
					                        
					                        
					                     </div>
					                     
					                  </div>
					               </div>
					            </div>
						 	</div>
						 	
						</div>
					
					</c:when>
					
					<c:otherwise>
					
						<c:forEach items="${myReserveList }" var="myReserve">
						<div class="jb-wrap m-2">
					         <div class="jb-image">
					         	<img alt="" width="700px;" height="200px;" src="/resources/images/reservation/티켓1.jpg">
					         </div>
					         
				         	<div class="jb-text"> 
					            <div class="jb-text-table">
					               <div class="jb-text-table-row">
					                  <div class="jb-text-table-cell">
					                  
					                     <div class="myReserve">
					                        <table class="myReserveTable">
					                        	<colgroup>
					                        		<col width="30%">
					                        		<col width="*">
					                        	</colgroup>
					                        	<tr>
					                        		<td rowspan="3"><img alt="" width="40px;" height="180px;" src="/resources/images/movie/${myReserve.attachedImgName }"> </td>
					                        		<td style="vertical-align: middle; font-size: 15px;">
					                        			<div class="text-center" style="font-size: 30px;">TICKET</div>
					                        			<div style="height: 30px;"></div>
					                        			<div class="m-1" style="font-size: 20px;">${myReserve.title }</div>
					                        			
					                        			<div class="m-2">${myReserve.screenDay } ${myReserve.screenTime } ~ ${myReserve.screenEndTime }</div>
					                        			<div class="m-2">OISONE ${myReserve.loc } ${myReserve.areaName } ${myReserve.theaterName } / ${myReserve.seatCnt }명</div>
					                        		</td>
					                        	</tr>
					                        </table>
					                        
					                        
					                     </div>
					                     
					                  </div>
					               </div>
					            </div>
						 	</div>
						 	
						</div>
						</c:forEach>
					
					
					</c:otherwise>
				</c:choose>
				
				
				
				
				
				
				
		 	</div>
		</div>
	
				
		
		
	
	
	
	
	
	</div>
</div>


</body>
</html>