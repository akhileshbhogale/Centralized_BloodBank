package model.beans;

public class BloodBagTypes {
	private int blood_bag_type_id;
	private String blood_bag_type,blood_bag_description;
	//default constr.
	public BloodBagTypes() {
		super();
		// TODO Auto-generated constructor stub
	}
	//Param Constructor
	public BloodBagTypes(int blood_bag_type_id, String blood_bag_type, String blood_bag_description) {
		super();
		this.blood_bag_type_id = blood_bag_type_id;
		this.blood_bag_type = blood_bag_type;
		this.blood_bag_description = blood_bag_description;
	}
	//Getter Setters
	public int getBlood_bag_type_id() {
		return blood_bag_type_id;
	}
	public void setBlood_bag_type_id(int blood_bag_type_id) {
		this.blood_bag_type_id = blood_bag_type_id;
	}
	public String getBlood_bag_type() {
		return blood_bag_type;
	}
	public void setBlood_bag_type(String blood_bag_type) {
		this.blood_bag_type = blood_bag_type;
	}
	public String getBlood_bag_description() {
		return blood_bag_description;
	}
	public void setBlood_bag_description(String blood_bag_description) {
		this.blood_bag_description = blood_bag_description;
	}
	//toString
	@Override
	public String toString() {
		return "BloodBagTypes [blood_bag_type_id=" + blood_bag_type_id + ", blood_bag_type=" + blood_bag_type
				+ ", blood_bag_description=" + blood_bag_description + "]";
	}
	
	
	
}
