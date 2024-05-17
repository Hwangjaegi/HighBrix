package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BorderDao;
import Dao.Cm_productDao;
import model.Account;
import model.Cm_product;
import service.CommandProcess;

public class Product_View implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int cm_no = Integer.parseInt(request.getParameter("cm_no"));
		System.out.println("cm_no :"+cm_no);
		
		Cm_productDao cao = Cm_productDao.getinstance();
		
		Cm_product cm_product = cao.select_no(cm_no);
		//DTO에 상품정보를 담았음
		
		request.setAttribute("cm_product", cm_product);
		
		
		return "product_View";
	}

}
