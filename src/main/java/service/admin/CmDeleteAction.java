package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Cm_productDao;
import model.Cm_product;
import service.CommandProcess;

public class CmDeleteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cm_no = Integer.parseInt(request.getParameter("cm_no"));
		
		Cm_productDao cd = Cm_productDao.getinstance();
		int result = cd.delete_pro(cm_no);
		request.setAttribute("result", result);
		return "CmDelete";
	}
}
