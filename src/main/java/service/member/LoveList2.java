package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.LoveDao;
import model.Cm_product;
import model.Love;
import service.CommandProcess;

public class LoveList2 implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		LoveDao ld = LoveDao.getInstance();
		
		List<Love> l_list = ld.select_cm(id);
		
		request.setAttribute("l_list", l_list);
//		List<Love> lovelist = ld.lovelist();
//		
//		request.setAttribute("lovelist", lovelist);
		return "loveList";
	}
	
}
