package service.border;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;

public class contentPassChk implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session.getId() == null) {
			
		}else {
			String id = (String)session.getAttribute("id");
			
			int a_no = Integer.parseInt(request.getParameter("a_no"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String password = request.getParameter("password");
			System.out.println("패스워드 : " +password);
			System.out.println("a_no : " +a_no);
			System.out.println("pageNum : " +pageNum);

			request.setAttribute("a_no", a_no);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("passwordChk", password);
			request.setAttribute("id", id);
		}
		
		return "contentPassChk";
	}

}
