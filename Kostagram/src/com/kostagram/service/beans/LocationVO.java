package com.kostagram.service.beans;

import java.util.Date;

public class LocationVO {
	private String location_name;
	private double lat;
	private double lon;
	private Date reg_date;
	private long photo_cnt;
	
	public LocationVO() {
		// TODO Auto-generated constructor stub
	}

	public LocationVO(String location_name, double lat, double lon, Date reg_date, long photo_cnt) {
		super();
		this.location_name = location_name;
		this.lat = lat;
		this.lon = lon;
		this.reg_date = reg_date;
		this.photo_cnt = photo_cnt;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public long getPhoto_cnt() {
		return photo_cnt;
	}

	public void setPhoto_cnt(long photo_cnt) {
		this.photo_cnt = photo_cnt;
	}

	@Override
	public String toString() {
		return "Location [location_name=" + location_name + ", lat=" + lat + ", lon=" + lon + ", reg_date=" + reg_date
				+ ", photo_cnt=" + photo_cnt + "]";
	}
	
}
