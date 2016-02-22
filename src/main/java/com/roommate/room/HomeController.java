package com.roommate.room;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/SL", method = RequestMethod.GET)
	public String SL(){
		return "SL";
	}
	
	@RequestMapping(value="/CreateAd", method = RequestMethod.GET)
	public String WriteProfile(){
		return "CreateAd";
	}
	
	@RequestMapping(value="/uploadImgs", method = RequestMethod.POST)
	public void uploadImg(@RequestParam("img") MultipartFile[] files){ 
		String message="";
		for(int i = 0; i < files.length; i++){
			MultipartFile file = files[i];
			try{
				byte[] bytes = file.getBytes();
				
                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "uploadedImages"); //uploadedImages is the name of the folder created (napravi da se ime foldera kreira po imenu i prezimenu korisnika. pozovi sql
                if (!dir.exists())
                    dir.mkdirs();
                
                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename()); 
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                
                System.out.println("Server File Location="+ serverFile.getAbsolutePath());
 
                message = "You successfully uploaded file";
			}catch(Exception e){
				e.toString();
			}
		}


	}
	
}
