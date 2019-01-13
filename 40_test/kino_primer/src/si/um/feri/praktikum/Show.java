package si.um.feri.praktikum;

import java.sql.Timestamp;
import java.util.Date;

public class Show {
	private int bazniID, movieID;
	private String showsID, city, center, theater;
	private Date date;
	private Date time;
	private Timestamp timestamp;

	public Show(int bazniID, String showsID, Date date, Date time, String city, String center, String theater, int movieID){
		this.bazniID=bazniID;
		this.showsID=showsID;
		this.date=date;
		this.time=time;
		this.city=city;
		this.center=center;
		this.theater=theater;
		this.movieID=movieID;
	}
	public Show(int bazniID, String showsID, Timestamp timestamp, String city, String center, String theater, int movieID) {
		this.bazniID=bazniID;
		this.showsID=showsID;
		this.timestamp=timestamp;
		this.city=city;
		this.center=center;
		this.theater=theater;
		this.movieID=movieID;
	}
	
	public int getShowID() {
		return bazniID;
	}
	public void setShowID(int bazniID) {
		this.bazniID = bazniID;
	}
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public String getShowsID() {
		return showsID;
	}
	public void setShowsID(String showsID) {
		this.showsID = showsID;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Show [bazniID=" + bazniID + ", movieID=" + movieID + ", showsID=" + showsID + ", city=" + city
				+ ", center=" + center + ", theater=" + theater + ", date=" + date + ", time=" + time + "]";
	}
}