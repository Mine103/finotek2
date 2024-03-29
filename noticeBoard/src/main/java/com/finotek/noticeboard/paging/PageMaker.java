package com.finotek.noticeboard.paging;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;
	
	private Criteria criteria;

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
		calcData();
	}
	
	private void calcData() {
		 endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);

	     startPage = (endPage - displayPageNum) + 1;

	     int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum()));

	     if (endPage > tempEndPage) {
	         endPage = tempEndPage;
	     }

	     prev = startPage == 1 ? false : true;
	     next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;
	}
	
}
