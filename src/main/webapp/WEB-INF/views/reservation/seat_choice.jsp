<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/resources/reservation/js/seat_choice.js?ver=8"></script>
<style type="text/css">

.bodyDiv{
 text-align: center;
 padding: 0px;
}

/* 예매하기 영역 */
.reserveDiv{
	height: 800px;
	margin: 0 auto;
	margin: 20px;
	border: 1px solid gray;
}

/* 예매하기 순서 */
.reserveOrder{
	border-right: 1px solid gray; 

}
.reserveOrderDiv{
	height: 200px;	
	padding-top: 80px;
}

/* 선택한 타이틀 */
.reserveTitle{
	height: 200px;
	background-color: #f2f2f2;
	padding-top: 20px;
	border-bottom: 1px solid gray;
}

ul{
	padding: 10px;
}

.reserveTitlePeople{
	padding-top: 30px;
}

/* 좌석 하나하나 선택 */
.seat {
       width: 40px;
       height: 40px;
       margin: 3px;
   }
   
.clicked {
    background-color: red;
    color: white;
}

/* 상영 정보 */
.movietTimeInfo{
	margin-top: 80px;
	text-align: left;

}
</style>


</head>
<body>
<div class="row bodyDiv justify-content-center">
	<div class="col-12">
		
		
		<!-- 예매하기 영역 -->
		<div class="row justify-content-center">
			<div class="col-10 reserveDiv" >
				<div class="row justify-content-center">
				
					<!-- 예매순서 -->
					<div class="col-1 reserveOrder" >
					
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1" >01</div> 
								<div>상영시간</div> 
							</div>
						</div>
						<div class="row reserveOrderDiv" style="background-color: #ed7d31; color: white;">
							<div class="col-12">
								<div class="m-1">02</div> 
								<div>좌석선택</div>
							</div>
						</div>
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1">03</div>
								<div>결제하기</div>
							</div>
						</div>
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1">04</div>
								<div>결제완료</div>
							</div>
						</div>
						
					</div>
					
					
					<!-- 메인내용 선택 -->
					<div class="col-11 reserveContent" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleMtInfo" >
								<div class="row">
									<div class="col-5 reserveTitleMovitTimeInfo" > 
										<div class="row">
											<div class="col-3" >
												<img alt="" height="150px;" src="/resources/images/movie/${mvInfo.attachedImgName }">
											</div>
											
											<div class="col-7 movietTimeInfo" >
												<div>${mvInfo.title } </div> 
												<div>
													${mvInfo.screenDay }
													${mvInfo.screenTime } ~ ${mvInfo.screenEndTime }
												</div>
												<div>
													${mvInfo.areaName }
													${mvInfo.theaterName }
												</div>
											
											
											</div>
										</div>
										
									</div>
									<div class="col-7 reserveTitlePeople" >
										<div class="row">
											<div class="col-6">
												<div>
													인원 수 
													<input type="number" value="0" min="0" max="20" id="seatCnt" required>
												</div>
												
												<div class="selectSeat1 m-3" >
													선택한 좌석 : <span id="seatChoiceIs"> </span>
												 </div>
											</div>
											<div class="col-6">
												<div class="m-3">
													<input class="common_btn" type="button" onclick="seatClick();" value="결제진행">
												</div> 
											</div>
										</div>
										 
										
									</div>
									
									
								</div>
								
								
								
							</div>
						</div>
						
						<div class="row justify-content-center">
							<div class="col-12 seatContent">
								
								<div style="height: 50px;"></div>
								<img alt="" src="/resources/images/reservation/스크린.png">
								<div style="height: 50px;"></div>
								
								<!-- 좌석 -->
								<div class="seat-wrapper"></div>
								
								
							</div>
							
							
						</div>
					</div>	
					
				
				</div>
			</div>
		</div>
	
	
	</div>
</div>




</body>
<script>
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";

    for (let i = 1; i < 7; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 1; j < 11; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                
               
                
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
                
                document.getElementById('seatChoiceIs').textContent = selectedSeats;
                document.getElementById('seatCnt').value = selectedSeats.length;
                
            })
        }
    }
    
    function seatClick() {
        location.href = '/reservation/payMent?seatCode=' + selectedSeats;
	}
    

    function mapping(input, i, j) {
        if (i === 1) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        } else if (i === 5) {
            input.value = "F" + j;
        } else if (i === 6) {
            input.value = "G" + j;
        }
    }
    
    
    
    
</script>





</html>