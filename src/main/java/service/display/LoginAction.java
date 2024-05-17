package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDao md = MemberDao.getInstance();
		int result = 0;
		Member member = md.select(id);
		if(member == null || member.getDel().equals("y")) result = -1; // 아이디가 없음
		else if(member.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			result = 1; // 로그인 성공
		}
		request.setAttribute("result", result);
		return "login";
	}

}
