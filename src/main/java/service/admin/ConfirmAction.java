package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Cm_productDao;
import model.Cm_product;
import service.CommandProcess;

public class ConfirmAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String cm_name = request.getParameter("cm_name");
		Cm_productDao cd = Cm_productDao.getinstance();
		Cm_product cm_product = cd.select_pro(cm_name);
		String msg = "";
		if (cm_product == null) msg="사용 가능한 상품명입니다";
		else msg="중복된 상품명, 다시 작성해 주세요.";
		request.setAttribute("msg", msg);
		return "confirm";
	}
}