package com.spring.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
@Controller
public class AWSUploadController {
	
	@Autowired
	public AWSService s3Service;
	
	@RequestMapping(value="uploadImages.do", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
    public @ResponseBody String initUpload2(@RequestParam("files") MultipartFile[] files, 
    		@RequestParam("ssn_num") String ssn_num, HttpServletRequest request) throws Exception {
		
        try{
 
            AWSCredentials credentials = new BasicAWSCredentials("", "");
            AmazonS3 s3Client = new AmazonS3Client(credentials);
            
            s3Service.multiImagesUpload(ssn_num, files, s3Client);
                        
            System.out.println("---------------- START UPLOAD FILE ----------------");
            
            return "completed! select another files you want";
        } catch(Exception e) {
            e.printStackTrace();
        } 
        
        return "completed! select another files you want";
    }
	
}
