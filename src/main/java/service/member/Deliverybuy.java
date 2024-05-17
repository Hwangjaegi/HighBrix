package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Cm_productDao;
import Dao.MemberDao;
import model.Cm_product;
import model.Member;
import service.CommandProcess;

public class Deliverybuy implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int cm_no = Integer.parseInt(request.getParameter("cm_no"));
		int cm_count = Integer.parseInt(request.getParameter("cm_count"));
		int cm_price = Integer.parseInt(request.getParameter("cm_price"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));

		
		Cm_productDao cmd = Cm_productDao.getinstance();
		Cm_product cm = cmd.select(cm_no);
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		
		request.setAttribute("id", id);
		request.setAttribute("cm", cm);
		request.setAttribute("c_no", c_no);
		request.setAttribute("member", member);
		request.setAttribute("cm_price", cm_price);
		request.setAttribute("cm_count", cm_count);
		
		return "db_buyForm";
	}

}
