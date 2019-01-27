package model.beans;

public class DonationHistory {
		
	String c_venue,c_date,c_timing;
	public DonationHistory()
	{ 
		super();
		
	}
	
	
	public DonationHistory(String c_venue, String c_date, String c_timing) {
		super();
		this.c_venue = c_venue;
		this.c_date = c_date;
		this.c_timing = c_timing;
	}


	public String getC_venue() {
		return c_venue;
	}
	public void setC_venue(String c_venue) {
		this.c_venue = c_venue;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public String getC_timing() {
		return c_timing;
	}
	public void setC_timing(String c_timing) {
		this.c_timing = c_timing;
	}


	@Override
	public String toString() {
		return "DonationHistory [c_venue=" + c_venue + ", c_date=" + c_date + ", c_timing=" + c_timing + "]";
	}
	
	

}
