package model.beans;

public class Stocks {
	private int stock_id,blood_group_id,blood_bag_type_id,quantity,price;
	private String owner_email;
	
	public Stocks() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Stocks(int stock_id, int blood_group_id, int blood_bag_type_id, int quantity, int price,
			String owner_email) {
		super();
		this.stock_id = stock_id;
		this.blood_group_id = blood_group_id;
		this.blood_bag_type_id = blood_bag_type_id;
		this.quantity = quantity;
		this.price = price;
		this.owner_email = owner_email;
	}

	@Override
	public String toString() {
		return "Stocks [stock_id=" + stock_id + ", blood_group_id=" + blood_group_id + ", blood_bag_type_id="
				+ blood_bag_type_id + ", quantity=" + quantity + ", price=" + price + ", owner_email=" + owner_email
				+ "]";
	}

	public int getStock_id() {
		return stock_id;
	}

	public void setStock_id(int stock_id) {
		this.stock_id = stock_id;
	}

	public int getBlood_group_id() {
		return blood_group_id;
	}

	public void setBlood_group_id(int blood_group_id) {
		this.blood_group_id = blood_group_id;
	}

	public int getBlood_bag_type_id() {
		return blood_bag_type_id;
	}

	public void setBlood_bag_type_id(int blood_bag_type_id) {
		this.blood_bag_type_id = blood_bag_type_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOwner_email() {
		return owner_email;
	}

	public void setOwner_email(String owner_email) {
		this.owner_email = owner_email;
	}
	
}
