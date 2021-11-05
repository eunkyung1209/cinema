package com.kh.project.common.vo;

public class PageVO extends BaseSearchVO{
	private int nowPage;		//현재 선택된 페이지 번호   -> 1 '2' 3 4 5 next -> 2번
	private int totalCnt;		//전체 데이터 수   -> 게시글 수
	private int beginPage;		//화면에 보이는 첫 페이지   -> '1' 2 3 4 5 next / '6' 7 8 9 10 next ...
	private int endPage;		//화면에 보이는 마지막 페이지   -> 1 2 3 4 '5' next / 6 7 8 9 '10' next ...
	private int displayCnt;		//한 화면에 보여지는 게시글 수   -> 1페이지에 게시글 n개 -> n개
	private int displayPageCnt;	//한 번에 보여지는 페이지 수   -> 1 2 3 4 5 next -> 5개
	private boolean prev;		//이전 버튼의 유무   -> 버튼이 있으면 true, 없으면 false
	private boolean next;		//다음 버튼의 유무   -> 버튼이 있으면 true, 없으면 false
	private int startNum;		//시작 ROW_NUM
	private int endNum;			//마지막 ROW_NUM
	
	//생성자
	public PageVO() {
		nowPage = 1;		//선택된 페이지 번호 초기화(커뮤니티 버튼 누르면 1로 뜨게)
		displayCnt = 10;		//한 화면에 보여지는 게시글 수 초기화
		displayPageCnt = 5;	//한 번에 보여지는 페이지 수
	}
	
	//게터 세터
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public boolean getPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean getNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	//게터만
	public int getBeginPage() {
		return beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	
	//세터 추가..
	public void setDisplayCnt(int displayCnt) {
		this.displayCnt = displayCnt;
	}
	
	//ROW_NUM 값 게터 세터
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum() {
		this.startNum = (nowPage - 1) * displayCnt + 1;	//시작 ROW_NUM 계산
	}
	
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum() {
		this.endNum = nowPage * displayCnt;	//마지막 ROW_NUM 계산
	}

	//이 메소드 호출 시 페이징 처리의 모든 정보가 세팅
	public void setPageInfo() {
		//화면에 보이는 마지막 페이지 번호 설정
		//Math 클래스의 ceil 함수 - 올림 함수 - 계산하기 위해 ceil() 안을 실수로 바꿔줌
		endPage = (int)(Math.ceil(nowPage / (double)displayPageCnt)) * displayPageCnt;
		
		//화면에 보이는 첫 페이지 번호 설정
		beginPage = endPage - displayPageCnt + 1;
		
		//전체 페이지 수 설정
		int totalPage = (int)(Math.ceil(totalCnt / (double)displayCnt));
		
		//next 버튼의 유무 (다음 버튼)
		if(endPage < totalPage) {	//현 화면의 마지막 페이지 번호가 전체 페이지 수 보다 작으면
			next = true;			//다음 버튼 보여짐
		}
		else {						//현 화면의 마지막 페이지 번호가 전체 페이지 수와 같으면
			next = false;			//다음 버튼 보여지지 않음
			endPage = totalPage;	//마지막 페이지 번호 = 전체 페이지 수
			//		1 2 3 4 5 next
			// prev 6 7 8
		}
		
		//prev 버튼의 유무 (이전 버튼)
		//beginPage가 1이면 이전 버튼은 없고, 1이 아니면 이전 버튼은 있다.
		prev = beginPage == 1 ? false : true;
		
		//ROW_NUM 값 설정
		setStartNum();
		setEndNum();
	}
	
}
