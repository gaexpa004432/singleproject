package model;

public class BiddingVO {
	private String bid_no;
	private String no;
	private int price;
	private String id;
	public String getBid_no() {
		return bid_no;
	}
	public void setBid_no(String bid_no) {
		this.bid_no = bid_no;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public BiddingVO(String bid_no, String no, int price, String id) {
		super();
		this.bid_no = bid_no;
		this.no = no;
		this.price = price;
		this.id = id;
	}
	public BiddingVO() {
		super();
	}
	@Override
	public String toString() {
		return "BiddingVO [bid_no=" + bid_no + ", no=" + no + ", price=" + price + ", id=" + id + "]";
	}
	
	
	
}
