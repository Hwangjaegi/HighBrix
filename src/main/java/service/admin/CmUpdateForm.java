package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Cm_productDao;
import model.Cm_product;
import service.CommandProcess;

public class CmUpdateForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cm_no = Integer.parseInt(request.getParameter("cm_no"));
		Cm_productDao cd = Cm_productDao.getinstance();
		Cm_product cp = cd.select_no(cm_no);
		
		request.setAttribute("cm_product", cp);
		return "cmUpdateForm";
	}
}
