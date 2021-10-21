package com.coder.util;

public class PrjSubFunction {
	public static Integer convertId(String strId,String type){
		int id=-1;
		if(type.equals("SID")){
			 id=Integer.parseInt(strId.substring(4,strId.length()));	
		}else if(type.equals("TID")){
			 id=Integer.parseInt(strId.substring(4,strId.length()));	
		}else if(type.equals("ID")){
			 id=Integer.parseInt(strId.substring(3,strId.length()));	
		}
		else if(type.equals("BID")){
			 id=Integer.parseInt(strId.substring(4,strId.length()));	
		}
		return id;}
}
