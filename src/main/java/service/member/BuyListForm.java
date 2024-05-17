package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.BuyListDao;
import Dao.CartDao;
import Dao.Cm_productDao;
import Dao.DeliveryBuyDao;
import model.Cart;
import model.Cm_product;
import service.CommandProcess;

public class BuyListForm  implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int bl_no = Integer.parseInt("bl_no");
		
		Cm_productDao bd = Cm_productDao.getinstance();
		List<Cm_product> db_list= bd.select_buy();
		
		DeliveryBuyDao dbd = DeliveryBuyDao.getInstance();
		request.setAttribute("db_list", db_list);
		return null;
	}

}
