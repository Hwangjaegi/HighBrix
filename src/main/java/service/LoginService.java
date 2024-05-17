package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;

public class LoginService implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
	    String password = request.getParameter("password");
	    MemberDao md = MemberDao.getInstance();
		boolean isAdmin = md.isAdmin(id, password);
        if (isAdmin) {
            return "/views/admin/adminMain";
        } else {
//            return "redirect:member/login.yj";
        	return "loginTo";
        }
	}
}