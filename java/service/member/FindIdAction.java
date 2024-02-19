package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class FindIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.findId(name, tel);
		
		request.setAttribute("member", member);
		return "findId";
	}
	
}
