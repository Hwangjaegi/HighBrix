package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class MyPageForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDao md = MemberDao.getInstance();
		if(session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
			System.out.println("id = "+id);
			Member member = md.select(id);
			
			request.setAttribute("member", member);
		}
		return "myPageForm";
	}

}
