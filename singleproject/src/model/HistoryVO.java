package model;

public class HistoryVO {
	private int his_no;
	private String limit;
	private String picture;
	private String id;
	private String no;
	public int getHis_no() {
		return his_no;
	}
	public void setHis_no(int his_no) {
		this.his_no = his_no;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public HistoryVO(int his_no, String limit, String picture, String id, String no) {
		super();
		this.his_no = his_no;
		this.limit = limit;
		this.picture = picture;
		this.id = id;
		this.no = no;
	}
	public HistoryVO() {
		super();
	}
	@Override
	public String toString() {
		return "HistoryVO [his_no=" + his_no + ", limit=" + limit + ", picture=" + picture + ", id=" + id + ", no=" + no
				+ "]";
	}
	
	
}
