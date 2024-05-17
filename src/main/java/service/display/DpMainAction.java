package service.display;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dao.Cm_productDao;
import Dao.ReviewDao;
import model.Cm_product;
import model.Review;
import service.CommandProcess;

public class DpMainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		
		
		// 메인페이지 상품 데이터추출
		Cm_productDao pdo = Cm_productDao.getinstance();
		List<Cm_product> list = pdo.select_main1();
		System.out.println("상품 조회개수 : " +list.size());
		request.setAttribute("list", list);
		
		List<Cm_product> list2 = pdo.select_main2();
		System.out.println("할인상품 조회개수 : " +list2.size());

        // 최대 3개까지 데이터를 추출
        List<Cm_product> limitedDiscountProducts = list2.subList(0, Math.min(3, list2.size()));
		request.setAttribute("list2", limitedDiscountProducts);
		//request.setAttribute("list2", list2);
		
		List<Cm_product> list3 = pdo.select_main3();
		request.setAttribute("list3", list3);
		System.out.println("신상품 조회개수 : " +list3.size());
		
		String img = "/highbrix/images/cart.jpg";
		String fimg = "/highbrix/images/cart2.jpg";
		
		//리뷰 보여주기 (1)
		ReviewDao rd = ReviewDao.getInstance();
		List<Review> review = rd.selectPro();
		System.out.println("review 개수 : " + review.size());
		
		
		request.setAttribute("review",review); //(2)
		request.setAttribute("id", id);
		request.setAttribute("img", img);
		request.setAttribute("fimg", fimg);
		
		
		
		return "dpMain";
	}

}
