package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CartDao;
import model.Cart;
import service.CommandProcess;

public class CartInsert implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		CartDao cd = CartDao.getInstance();
		
		int c_count = Integer.parseInt(request.getParameter("c_count"));
		System.out.println("c_count="+c_count);
		int cm_no = Integer.parseInt(request.getParameter("cm_no"));
		System.out.println("cm_no="+cm_no);
		String id = request.getParameter("id");
		System.out.println("id="+id);
		
		Cart cart = new Cart();
		cart.setC_count(c_count);
		cart.setCm_no(cm_no);
		cart.setId(id);
		
		int result = cd.insert(cart);
		
		System.out.println("왔니?");
		request.setAttribute("result", result);
		request.setAttribute("cm_no", cm_no);
		
		return "cartInsert";
	}
}