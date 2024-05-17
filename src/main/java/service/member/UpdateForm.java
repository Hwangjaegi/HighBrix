package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id == null) {
			HttpSession session = request.getSession();
			id = (String)session.getAttribute("id");
		}
		System.out.println("id = "+id);
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		
		request.setAttribute("member", member);
		return "updateForm";
	}
}
