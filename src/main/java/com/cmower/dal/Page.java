package com.cmower.dal;

import org.apache.ibatis.session.RowBounds;

/**
 * 分页查询时的参数设置类.<br>
 * 
 * <P>
 * 1.PAGE_SHOW_COUNT──当然默认一页显示10。<br>
 * 2.pageNum──第几页。<br>
 * 3.numPerPage──一页显示多少，为空时，显示PAGE_SHOW_COUNT。<br>
 * 4.totalCount──总共数目。totalCount/numPerPage=多少页<br>
 * 5.orderField──排序的列。<br>
 * 6.orderDirection──排序的方向。
 * </P>
 */
public class Page extends BaseEntity<Page> {
	public static int PAGE_SHOW_COUNT = 50;
	private int pageNum = 1;
	private int numPerPage = 0;
	private long totalCount = 0;
	private String orderField = "";
	private String orderDirection = "";

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setDefaultPageCount(int count) {
		if (count > 0) {
			PAGE_SHOW_COUNT = count;
		}
	}

	public int getNumPerPage() {
		return numPerPage > 0 ? numPerPage : PAGE_SHOW_COUNT;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderDirection() {
		return "desc".equalsIgnoreCase(orderDirection) ? "desc" : "asc";
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartIndex() {
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		return pageNum * this.getNumPerPage();
	}

	public RowBounds createRowBounds() {
		RowBounds ro = new RowBounds(this.getStartIndex(), this.getNumPerPage());
		return ro;
	}

	@Override
	public String toString() {
		return "条件：" + pageNum + "，" + numPerPage + "，" + totalCount + "，" + orderField + "，" + orderDirection + "，"
				+ mo;
	}
}
