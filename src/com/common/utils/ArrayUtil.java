package com.common.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * Array manage util
 * @author charmyin
 * @since 2013-8-23
 */
public class ArrayUtil {
	
	/**
	 * Remove empty string elements from origin string array
	 * @return String array
	 */
	public static String[] removeEmptyString(String[] strOrigin){
		List<String> strList = new ArrayList<String>();
		for(String str : strOrigin){
			if(str!=null && !str.trim().isEmpty()){
				strList.add(str);
			}
		}
		return strList.toArray(new String[0]);
	}
}
