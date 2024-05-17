package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.LoveDao;
import model.Love;
import service.CommandProcess;

public class LoveDel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int cm_no = Integer.parseInt(request.getParameter("cm_no"));
		LoveDao ld = LoveDao.getInstance();
		Love love = new Love();
		love.setId(id);
		love.setCm_no(cm_no);
		int result = ld.delete_cm(love);
		request.setAttribute("result", result);
		return "loveDel";
	}

}
