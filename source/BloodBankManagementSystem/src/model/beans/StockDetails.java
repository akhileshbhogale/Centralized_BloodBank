package model.beans;

public class StockDetails {
	
	String supplier_name,blood_group,blood_bag_type;
	int price,quantity;
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
				+ blood_bag_type + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
	

}
