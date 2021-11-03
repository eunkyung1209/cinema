<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Chat</title>
</head>
<body>
    
    
    <div style="width: 400px; height: 600px; top: 650px; right: 150px; position: absolute; z-index: 3;" id="chat">
         <div style="background-color: rgb(255, 209, 4); border-radius: 15px;" align="center"> 
         
            <div style="height: 100px; line-height: 44px; padding-left: 15px;" align="left">
            
            	<div style="height: 7px"></div>
            
               <div style="font-weight: bold; font-size: 30px;">
               		OISONE TALK
               		
               		<svg xmlns="http://www.w3.org/2000/svg" width="27" height="28" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
					  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					</svg>
               		
               </div>
              	
               
               <div style="padding-left: 160px;">
               
               		<button type="button"  style="background: #191970 ; outline: none;border: none;border-radius: 6px;color: white;   width:100px;height: 25px" onclick="openSocket();">채팅 참여</button>
               		<!-- <button type="button"  style="background: #191970 ; outline: none;border: none;border-radius: 6px;color: white;   width:120px;height: 25px" onclick="javascript:clearText();">대화내용 지우기</button> -->
        			<button type="button"  style="background: #191970 ; outline: none;border: none;border-radius: 6px;color: white;   width:100px;height: 25px" onclick="closeSocket();">채팅 나가기</button>
        		
        	   </div>	
        			
        			<div style="height: 30px"></div>
        			
               <i class="icon-down-open close" ></i>
               <!-- <button type="button" onclick="closeSocket();">대회방 나가기</button> --> 
            </div>
            <div style="height: 440px; background: white; border-radius: 10px; width: 380px; overflow: auto;" id="messageDiv">
            
               <div id="messages" style="text-align: left; padding-left: 10px;">
               
               
            </div>
               
               
            </div> <!-- Server responses get written here -->
            <div style="height: 10px"></div>
               <div style="background-color: white; height: 60px;border-radius: 10px; width: 380px; padding: 5px">
              
               
                  <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
                  <input type="text" id="messageinput" style="width: 300px; height: 60px; border: none;"> 
                  
                  <button type="button" id="sendBtn" style="background: #191970 ; outline: none;border: none;border-radius: 6px;color: white;   width:53px;height: 40px" onclick="send();">전송</button> 
               		
               
               </div>
               
                <!-- Server responses get written here -->
    			<div id="messages"></div>
               
               
            <div style="height: 10px"></div>
            </div> 
       </div>
     
    
    
    
    
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://localhost:8081/echo.do");
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
                writeResponse("--- ${sessionScope.id}님이 나가셨습니다 ---");
            }
            
        }
        
        function send(){
           // var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text = "";
        }
        
        function closeSocket(){
            ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
        }

        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	}
        
  </script>

</body>
</html>