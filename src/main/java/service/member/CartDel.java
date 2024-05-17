package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.CartDao;
import service.CommandProcess;

public class CartDel implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		
		CartDao cd = CartDao.getInstance();
		int result = cd.delete(id, c_no);
		
		request.setAttribute("result", result);

		return "cartDel";
	}
}
