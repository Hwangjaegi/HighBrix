package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	}
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setAddress(address);
		member.setTel(tel);
		member.setEmail(email);
		
		MemberDao md = MemberDao.getInstance();
		int result = md.update(member);
		request.setAttribute("result", result);
		return "update";
	}

}
