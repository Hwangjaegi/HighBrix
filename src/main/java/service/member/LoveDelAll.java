package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.LoveDao;
import model.Love;
import service.CommandProcess;

public class LoveDelAll implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		LoveDao ld = LoveDao.getInstance();
		Love love = new Love();
		love.setId(id);
		
		int result = ld.deleteAll_cm(love);
		request.setAttribute("result", result);
		return "loveDelAll";
	}

}
