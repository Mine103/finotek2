package com.finotek.noticeboard.vo;

public class PageVO {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int total;
	
	private Criteria cri;

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotal() {
		return total;
	}

	public Criteria getCri() {
		return cri;
	}
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil(total*1.0) / cri.getAmount());
		
		if(realEnd < this.endPage) {
			endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage > realEnd;
	}
	
	@Override
	public String toString() {
		return "PageVo [startPage="+startPage+", endPage="+endPage+", prev="+prev+", next="+next+", total="+total+"]";
	}
	
}
