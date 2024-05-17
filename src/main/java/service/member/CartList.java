package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.CartDao;
import Dao.MemberDao;
import model.Cart;
import model.Member;
import service.CommandProcess;

public class CartList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		MemberDao md = MemberDao.getInstance();
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
			Member member = md.select(id);

			request.setAttribute("member", member);
		}
		String id = (String) session.getAttribute("id");
		CartDao cd = CartDao.getInstance();
		List<Cart> cart_list = cd.cart_list(id);

		request.setAttribute("cart_list", cart_list);

		return "cartList";
	}
}
