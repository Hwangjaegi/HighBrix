package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Cm_productDao;
import model.Cm_product;
import service.CommandProcess;

public class ReviewForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cm_no = Integer.parseInt(request.getParameter("cm_no"));
		System.out.println("건너온 cm_no : " + cm_no);
		
		Cm_productDao cpd = Cm_productDao.getinstance();
		
		Cm_product cm_product = cpd.select(cm_no);
		
		request.setAttribute("cm_no", cm_no);
		request.setAttribute("cm_product", cm_product);
		return "reviewForm";
	}

}
