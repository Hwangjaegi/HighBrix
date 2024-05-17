package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import service.CommandProcess;

public class MemberDeleteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(id);
		request.setAttribute("result", result);
		return "memberDelete";
	}
}
