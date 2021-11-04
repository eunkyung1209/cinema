package com.kh.project.chat;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;

@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocketChat {
	
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
    	 System.out.println("웹소켓 서버 생성");
    }
    
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());

        
        try {
            final Basic basic=session.getBasicRemote();
            
            basic.sendText("<div style='text-align:center; color:blue; font-size:14px; padding-right:15px; padding-top:3px; padding-bottom:3px;'>---  채팅에 연결되었습니다 :) ---" + "</div>");
           
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /*
     * ��� ����ڿ��� �޽����� �����Ѵ�.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
        try {
            for(Session session : WebSocketChat.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sender+" : "+message);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * ���� �Է��ϴ� �޼���
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            //basic.sendText("<<<나>>> : "+ message);
           // basic.sendText("<span style='color:red;'>나</span> : "+ message);
            
           // basic.sendText("<div style='text-align:right;'>나 : "+ message + "</div>");
            
			/*
			 * basic.
			 * sendText("<div style='text-align:right; font-size:14px; padding-right:15px;'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"22\" height=\"22\" fill=\"currentColor\" class=\"bi bi-person-fill\" viewBox=\"0 0 16 16\">\r\n"
			 * +
			 * "  <path d=\"M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z\"/>\r\n"
			 * + "</svg> : "+ message + " </div>");
			 */
            
            
         basic.sendText("<div style='text-align:right; font-size:14px; padding-right:15px;'>"+ message + " :  <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-fill\" viewBox=\"0 0 16 16\">\r\n" + 
         		"  <path d=\"M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z\"/>\r\n" + 
         		"</svg> </div>");
            
            
            //basic.sendText("<div class='row'><div class='col justify-content-end'>나</div></div> : "+ message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}
