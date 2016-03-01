package com.roommate.room;

import java.util.Random;

public class AdDetails {
	String available_from, mobile, city, hood, address, room_type, room_number, place_size, set, details, url;
	short rent, essentials, tv, ac, wifi, desk;
	
	public String getUrl(){
		Random r = new Random();
		return "Ad?id=" + this.city + "-" + this.hood + "-" + r.nextInt(999999);
	}
	public String getAvailable_from() {
		return available_from;
	}
	public void setAvailable_from(String available_from) {
		this.available_from = available_from;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getHood() {
		return hood;
	}
	public void setHood(String hood) {
		this.hood = hood;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	public String getPlace_size() {
		return place_size;
	}
	public void setPlace_size(String place_size) {
		this.place_size = place_size;
	}
	public String getSet() {
		return set;
	}
	public void setSet(String set) {
		this.set = set;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public short getRent() {
		return rent;
	}
	public void setRent(short rent) {
		this.rent = rent;
	}
	public short getEssentials() {
		return essentials;
	}
	public void setEssentials(short essentials) {
		this.essentials = essentials;
	}
	public short getTv() {
		return tv;
	}
	public void setTv(short tv) {
		this.tv = tv;
	}
	public short getAc() {
		return ac;
	}
	public void setAc(short ac) {
		this.ac = ac;
	}
	public short getWifi() {
		return wifi;
	}
	public void setWifi(short wifi) {
		this.wifi = wifi;
	}
	public short getDesk() {
		return desk;
	}
	public void setDesk(short desk) {
		this.desk = desk;
	}
}
