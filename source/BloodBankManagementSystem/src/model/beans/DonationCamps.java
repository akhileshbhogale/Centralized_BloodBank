package model.beans;

public class DonationCamps {
	private int camp_id;
	private String organizer_email,camp_venue,camp_timing;
	private Date camp_date;
	
	public DonationCamps() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DonationCamps(int camp_id, String organizer_email, String camp_venue, String camp_timing, Date camp_date) {
		super();
		this.camp_id = camp_id;
		this.organizer_email = organizer_email;
		this.camp_venue = camp_venue;
		this.camp_timing = camp_timing;
		this.camp_date = camp_date;
	}

	@Override
	public String toString() {
		return "DonationCamps [camp_id=" + camp_id + ", organizer_email=" + organizer_email + ", camp_venue="
				+ camp_venue + ", camp_timing=" + camp_timing + ", camp_date=" + camp_date + "]";
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	public String getOrganizer_email() {
		return organizer_email;
	}

	public void setOrganizer_email(String organizer_email) {
		this.organizer_email = organizer_email;
	}

	public String getCamp_venue() {
		return camp_venue;
	}

	public void setCamp_venue(String camp_venue) {
		this.camp_venue = camp_venue;
	}

	public String getCamp_timing() {
		return camp_timing;
	}

	public void setCamp_timing(String camp_timing) {
		this.camp_timing = camp_timing;
	}

	public Date getCamp_date() {
		return camp_date;
	}

	public void setCamp_date(Date camp_date) {
		this.camp_date = camp_date;
	}
	
}
