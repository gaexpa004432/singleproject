package model;

public class AuctionVO {
	private int no;
	private String name;
	private int limit;
	private String picture;
	private int startprice;
	private String id;
	private String limit_date;
	
	public AuctionVO(String limit_date) {
		super();
		this.limit_date = limit_date;
	}
	public String getLimit_date() {
		return limit_date;
	}
	public void setLimit_date(String limit_date) {
		this.limit_date = limit_date;
	}
	public AuctionVO(int no, String name, int limit, String picture, int startprice, String id) {
		super();
		this.no = no;
		this.name = name;
		this.limit = limit;
		this.picture = picture;
		this.startprice = startprice;
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getStartprice() {
		return startprice;
	}
	public void setStartprice(int startprice) {
		this.startprice = startprice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "AuctionVO [no=" + no + ", name=" + name + ", limit=" + limit + ", picture=" + picture + ", startprive="
				+ startprice + ", id=" + id + "]";
	}
	public AuctionVO() {
		super();
	}
	
	
}
