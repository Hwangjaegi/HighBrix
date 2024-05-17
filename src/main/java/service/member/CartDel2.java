package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.CartDao;
import service.CommandProcess;

public class CartDel2 implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String c_no1=request.getParameter("c_nos");
		System.out.println("c_no:"+request.getParameter("c_nos"));
		System.out.println("c_no1="+c_no1);
		String[] c_no2 = c_no1.split(",");
		System.out.println("c_no2="+c_no2);
		
		CartDao cd = CartDao.getInstance();
		
		int c_no=0;
		int result=0;
		for(int i=0; i<c_no2.length; i++) {
			c_no = Integer.parseInt(c_no2[i]);
			
			result = cd.delete(id, c_no);
		}
		
		
		
		
		request.setAttribute("result", result);

		return "cartDel";
	}
}
