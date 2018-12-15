package com.teng.utils;
import java.security.MessageDigest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	private static final String KEY=":Cookie@com.teng";
	/**
	 * 创建cookie的方法
	 * @param username 
	 * @param req
	 * @param resp
	 * @param sec cookie失效的时间，单位：秒
	 */
	public static void creatCook(String username,HttpServletRequest req,HttpServletResponse resp,int sec){
		Cookie userCookie=new Cookie("userKey", username);
		Cookie ssidCookie=new Cookie("ssid", md5Encrypt(username));
		userCookie.setMaxAge(sec);
		ssidCookie.setMaxAge(sec);
		resp.addCookie(userCookie);
		resp.addCookie(ssidCookie);
	}
	/**
	 * 这个方法的作用是加密，把一个明文字符串给加密
	 * @param ss
	 * @return
	 */
	public static String md5Encrypt(String ss){
		ss=ss==null?"":ss+KEY;
		char[] md5Digist={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};//字典
		String s=null;
		try {
			MessageDigest md=MessageDigest.getInstance("MD5");//加密算法为md5
			byte[] ssar=ss.getBytes();
			md.update(ssar);//把明文放到加密类MessageDigest的对象实例中去
			byte[] mssarr=md.digest();//这里就是真正的加密了
			
			int len=mssarr.length;
			char[] str=new char[len*2];
			int k=0;//计数
			
			for(int i=0;i<len;i++){
				byte b=mssarr[i];
				str[k++]=md5Digist[b >>>4 &0xf];
				str[k++]=md5Digist[b &0xf];
			}
			s= new String(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	
}
