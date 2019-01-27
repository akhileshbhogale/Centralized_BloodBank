package model.beans;

public class BloodGroups {
	private int blood_group_id;
	private String blood_group;
	//Default const.
	public BloodGroups() {
		super();
		// TODO Auto-generated constructor stub
	}
	//Param const
	public BloodGroups(int blood_group_id, String blood_group) {
		super();
		this.blood_group_id = blood_group_id;
		this.blood_group = blood_group;
	}
	//toString
	@Override
	public String toString() {
		return "BloodGroups [blood_group_id=" + blood_group_id + ", blood_group=" + blood_group + "]";
	}
	//Getter Setters
	public int getBlood_group_id() {
		return blood_group_id;
	}
	public void setBlood_group_id(int blood_group_id) {
		this.blood_group_id = blood_group_id;
	}
	public String getBlood_group() {
		return blood_group;
	}
	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}
	
	
	
}
