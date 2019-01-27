package model.beans;
import java.sql.Timestamp;

public class OrderHistory {
	String name,bloodgroup,bloodbagtype;
	int quantity,price;
	Timestamp order_date;

	public OrderHistory() {
		super();
		
	}

	public OrderHistory(String name, String bloodgroup, String bloodbagtype, int quantity, int price, Timestamp date) {
		super();
		this.name = name;
		this.bloodgroup = bloodgroup;
		this.bloodbagtype = bloodbagtype;
		this.quantity = quantity;
		this.price = price;
		this.order_date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public String getBloodbagtype() {
		return bloodbagtype;
	}

	public void setBloodbagtype(String bloodbagtype) {
		this.bloodbagtype = bloodbagtype;
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

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	

}
