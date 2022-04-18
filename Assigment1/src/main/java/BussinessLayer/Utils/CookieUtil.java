package BussinessLayer.Utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	public static Cookie addCookie(String name,String value,int hour,HttpServletResponse res) {
		Cookie cookie=new Cookie(name, value);
		cookie.setMaxAge(hour*60*60);
		cookie.setPath("/");
		res.addCookie(cookie);
		return cookie;
		
	}
	public static String getCookie(String name,HttpServletRequest req) throws Exception {
		Cookie []cookie=req.getCookies();
		if(cookie!=null) {
			for(Cookie x:cookie) {
				if(name.equals(x.getName())) {
					return x.getValue();
				}
			}
		}
		throw new Exception();
	}
	

}
