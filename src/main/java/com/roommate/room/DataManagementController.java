package com.roommate.room;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DataManagementController {
	
	static String username = "sa", pass = "123456", dataName = "Roommate", port = "64201";

	@RequestMapping(value="/addUserInfo", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String addEmployee (@RequestBody User user){
		Database database = new Database(username, pass, dataName, port);
		Connection connection = null;
		JSONObject jsonObject = new JSONObject();
		
		try{
			connection = database.connect();
			ResultSet resultSet = database.checkUser(connection, user);
			while(resultSet.next()){
				if(resultSet.getString(1).equals(user.getEmail())){ //check if there is a user with that email address in the database
					jsonObject.put("data", "That email address is already taken");
					jsonObject.put("success", false);
					return jsonObject.toJSONString();
				}
			}
			database.addUserInfo(connection, user);
		}catch(Exception e){
			e.printStackTrace();
			return e.toString();
		}
		jsonObject.put("data", "You successfully created account");
		jsonObject.put("success", true);
		return jsonObject.toJSONString();	
	}
	
	@RequestMapping(value="/checkUser", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String checkUser (@RequestBody User user){
		Database database = new Database(username, pass, dataName, port);
		Connection connection = null;
		JSONObject jsonObject = new JSONObject();
		try {
			connection = database.connect();
			ResultSet resultSet = database.checkUser(connection, user);
			while(resultSet.next()){
				if(resultSet.getString(1).equals(user.getEmail()) && resultSet.getString(2).equals(user.getPassword())){
					jsonObject.put("name", resultSet.getString(3));
					jsonObject.put("lastName", resultSet.getString(4));
					jsonObject.put("data", "Logged in");
					jsonObject.put("success", true);
					return jsonObject.toJSONString(); 
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
		jsonObject.put("data", "Wrong email or password");
		jsonObject.put("success", false);
		return jsonObject.toJSONString(); 
	}

}
