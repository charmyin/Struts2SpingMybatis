package com.common.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;


public class GetFilePath {	
	public static String getFilePath(HttpServletRequest request){
		
		/*File file= new File(request.getServletContext().getRealPath("/") + File.separator + "uploadfile");
		if(!file .exists()  || !file .isDirectory()){
			file.mkdir();
		}
		
		
//		request.getServletContext().getRealPath("/");
		
		System.out.println("**************************************************"+request.getServletContext().getRealPath("/"));
		return request.getServletContext().getRealPath("/") + File.separator + "uploadfile";*/
		return "";
	}
}
