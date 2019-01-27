package model.beans;

import java.sql.Date;

public class UpcomingDonationCamps {
	
	String camp_venue,camp_time;
	Date camp_date;
	public UpcomingDonationCamps() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UpcomingDonationCamps(String camp_venue, String camp_time, Date camp_date) {
		super();
		this.camp_venue = camp_venue;
		this.camp_time = camp_time;
		this.camp_date = camp_date;
	}
	public String getCamp_venue() {
		return camp_venue;
	}
	public void setCamp_venue(String camp_venue) {
		this.camp_venue = camp_venue;
	}
	public String getCamp_time() {
		return camp_time;
	}
	public void setCamp_time(String camp_time) {
		this.camp_time = camp_time;
	}
	public Date getCamp_date() {
		return camp_date;
	}
	public void setCamp_date(Date camp_date) {
		this.camp_date = camp_date;
	}
	@Override
	public String toString() {
		return "UpcomingCamps [camp_venue=" + camp_venue + ", camp_time=" + camp_time + ", camp_date=" + camp_date
				+ "]";
	}

		
	

}
