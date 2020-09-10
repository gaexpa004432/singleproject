package model;

public class GoodsVO {
	private int goods_id;
	private String name;
	private String unit;
	public GoodsVO(int goods_id, String name, String unit) {
		super();
		this.goods_id = goods_id;
		this.name = name;
		this.unit = unit;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	@Override
	public String toString() {
		return "GoodsVO [goods_id=" + goods_id + ", name=" + name + ", unit=" + unit + "]";
	}
	public GoodsVO() {
		super();
	}
	
	
	
}
