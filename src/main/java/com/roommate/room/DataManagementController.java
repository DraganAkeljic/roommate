package com.roommate.room;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="/login", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String checkUser (@RequestBody User user, HttpServletRequest request){
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
					request.getSession().setAttribute("loggedIn", true);
					request.getSession().setAttribute("name", resultSet.getString(3));
					request.getSession().setAttribute("email", user.getEmail());
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
	
	@RequestMapping(value="/checkLogin", method = RequestMethod.GET)
	public @ResponseBody String checkLogin(HttpServletRequest request){
		HttpSession session = request.getSession();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("name", session.getAttribute("name"));
		jsonObject.put("loggedIn", session.getAttribute("loggedIn"));
		return jsonObject.toJSONString(); 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public @ResponseBody void logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session != null){
			session.removeAttribute("loggedIn");
			session.removeAttribute("name");
		}
		System.out.println("logged out!!");
	}
	
	@RequestMapping(value="/createAd", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String createAd(@RequestBody AdDetails adDetails, HttpServletRequest request){
		JSONObject jsonObject = new JSONObject();
		HttpSession session = request.getSession();
		Database database = new Database(username, pass, dataName, port);
		Connection connection = null;
		try{
			connection = database.connect();
			database.createAd(connection, adDetails, (String) session.getAttribute("email"));
		}catch(Exception e){
			System.out.println(e.toString());
		}
		jsonObject.put("data", "Success");
		return jsonObject.toJSONString();
		
	}
	
	@RequestMapping(value="/uploadImgs", method = RequestMethod.POST)
	public ResponseEntity uploadImg(@RequestParam("img") MultipartFile[] files, HttpServletRequest request){ 
		HttpSession session = request.getSession();
		Database database = new Database(username, pass, dataName, port);
		Connection connection = null;
		ResultSet resultSet = null;
		try{
			connection = database.connect();
			resultSet = database.getAdID(connection, (String) session.getAttribute("email"));
			resultSet.next();
		}catch(Exception e){
			System.out.println(e.toString());
		}
		for(int i = 0; i < files.length; i++){
			MultipartFile file = files[i];
			try{
				byte[] bytes = file.getBytes();
				
                // Creating the directory to store file
                String rootPath = System.getProperty("user.dir");
                File dir = new File(rootPath + File.separator + "AdImages" + File.separator + session.getAttribute("email") + File.separator + resultSet.getString(1)); //users email is the name of the folder created
                if (!dir.exists())
                    dir.mkdirs(); //users first created ad
                
                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename()); 
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes); //write (save) images to the disk
                stream.close();
                try{
                	connection = database.connect();
                	database.setImgFolder(connection, Integer.parseInt(resultSet.getString(1)), dir.getAbsolutePath());
                }catch(Exception e){
                	System.out.println(e.toString());
                }

			}catch(Exception e){
				System.out.println(e.toString());
				new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		return new ResponseEntity<Object>(HttpStatus.OK); //ok status required for the dropzoneJS
	}
}
