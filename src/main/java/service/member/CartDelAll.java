package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.CartDao;
import service.CommandProcess;

public class CartDelAll implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String c_nos1 = request.getParameter("c_nos");
		String[] c_nos = c_nos1.split(",");
		for (String c : c_nos) {
			System.out.println("c = " + c);
		}

		if (c_nos != null && c_nos.length > 0) {
			CartDao cd = CartDao.getInstance();
			int result = 0;
			for (String c_no : c_nos) {
				int c_no_int = Integer.parseInt(c_no);
				result += cd.delete(id, c_no_int);
			}
			request.setAttribute("result", result);
		}
		return "cartDelAll";
	}
}