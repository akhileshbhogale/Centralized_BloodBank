package model.beans;

public class StockDetails {
	
	String supplier_name,blood_group,blood_bag_type;
	int price,quantity,stock_id;
	public StockDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StockDetails(String supplier_name, String blood_group, String blood_bag_type, int quantity, int price) {
		super();
		this.supplier_name = supplier_name;
		this.blood_group = blood_group;
		this.blood_bag_type = blood_bag_type;
		this.price = price;
		this.quantity = quantity;
		this.stock_id=-1;
	}
	
	
	
	public StockDetails(String blood_group, String blood_bag_type, int price, int quantity, int stock_id) {
		super();
		this.blood_group = blood_group;
		this.blood_bag_type = blood_bag_type;
		this.price = price;
		this.quantity = quantity;
		this.stock_id = stock_id;
	}
	
	
	
	
	
	public int getStock_id() {
		return stock_id;
	}
	public void setStock_id(int stock_id) {
		this.stock_id = stock_id;
	}
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	public String getBlood_group() {
		return blood_group;
	}
	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}
	public String getBlood_bag_type() {
		return blood_bag_type;
	}
	public void setBlood_bag_type(String blood_bag_type) {
		this.blood_bag_type = blood_bag_type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "StockDetails [supplier_name=" + supplier_name + ", blood_group=" + blood_group + ", blood_bag_type="
				+ blood_bag_type + ", price=" + price + ", quantity=" + quantity + ", stock_id=" + stock_id + "]";
	}
	
	
	

}
