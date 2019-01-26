package model.beans;

public class Orders {
	private int order_id,stock_id,quantity,price,address_id;
	private String order_type,buyer_email;
	private Date order_date;
	
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Orders(int order_id, int stock_id, int quantity, int price, int address_id, String order_type,
			String buyer_email, Date order_date) {
		super();
		this.order_id = order_id;
		this.stock_id = stock_id;
		this.quantity = quantity;
		this.price = price;
		this.address_id = address_id;
		this.order_type = order_type;
		this.buyer_email = buyer_email;
		this.order_date = order_date;
	}

	@Override
	public String toString() {
		return "Orders [order_id=" + order_id + ", stock_id=" + stock_id + ", quantity=" + quantity + ", price=" + price
				+ ", address_id=" + address_id + ", order_type=" + order_type + ", buyer_email=" + buyer_email
				+ ", order_date=" + order_date + "]";
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getStock_id() {
		return stock_id;
	}

	public void setStock_id(int stock_id) {
		this.stock_id = stock_id;
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

	public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	public String getOrder_type() {
		return order_type;
	}

	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
}
