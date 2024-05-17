package service.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Cm_productDao;
import Dao.MemberDao;
import model.Cart;
import model.Cm_product;
import model.Member;
import service.CommandProcess;

public class Db_buyForm implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 String cm_no1 = request.getParameter("cm_no");
    	 String c_no1 = request.getParameter("c_no");
         String c_count1 = request.getParameter("c_count");       
         String id1 = request.getParameter("id");
         String cm_name1 = request.getParameter("cm_name");
         String cm_price1 = request.getParameter("cm_price");
         String cm_discount1 = request.getParameter("cm_discount");
         String cm_image1 = request.getParameter("cm_image");
         String totalprice1 = request.getParameter("totalprice");
         String[] cm_no2 = cm_no1.split(",");
         String[] c_no2 = c_no1.split(",");
         String[] c_count2 =c_count1.split(",");
         String[] id = id1.split(",");
         String[] cm_name = cm_name1.split(",");
         String[] cm_price2 = cm_price1.split(",");
         String[] cm_discount2 = cm_discount1.split(",");
         String[] cm_image = cm_image1.split(",");
         String[] totalprice2 = totalprice1.split(",");
         System.out.println("cm_no= "+cm_no2);
         System.out.println("c_no= "+cm_no1);
         System.out.println("c_count1= "+c_count2);
         System.out.println("id1= "+id);
         System.out.println("cm_name1= "+cm_name);
         System.out.println("cm_price1= "+cm_price2);
         System.out.println("cm_discount1= "+cm_discount2);
         System.out.println("cm_image1= "+cm_image);
         System.out.println("totalprice1= "+totalprice2);

        // DAO 초기화
		MemberDao memberDao = MemberDao.getInstance();
		
		// 회원 정보 가져오기 
        String memberId = (id != null && id.length > 0) ? id[0] : null;
		Member member = memberDao.select(memberId);
	  
		// 선택된 상품 정보를 담을 리스트 생성
		List<Cart> list = new ArrayList<>();
		
		 int c_count = 0;
      	 int cm_no = 0;
      	 int c_no = 0;
      	 int cm_price = 0;
      	 int cm_discount = 0;
      	 int totalprice = 0;
         for(int i = 0; i < c_count2.length; i++) {
         	c_count =Integer.parseInt(c_count2[i]);
         	cm_no =Integer.parseInt(cm_no2[i]);
         	c_no =Integer.parseInt(c_no2[i]);
         	cm_price =Integer.parseInt(cm_price2[i]);
         	cm_discount =Integer.parseInt(cm_discount2[i]);
         	totalprice =Integer.parseInt(totalprice2[i]);
         	
            Cart cart = new Cart(); 
            cart.setC_no(c_no);
            cart.setCm_no(cm_no);
            cart.setC_count(c_count);
			member.setId(id[i]);
			cart.setCm_image(cm_image[i]);
			cart.setCm_name(cm_name[i]);
			cart.setCm_price(cm_price);
			cart.setCm_discount(cm_discount);
			list.add(cart);
         }
		
		// 받아온 정보를 기반으로 상품 객체를 생성하여 리스트에 추가 
//		if (cm_no != null && c_count != null && id != null && 
//			cm_name != null && cm_price != null && cm_discount != null && totalprice != null) {
//			for (int i = 0; i < cm_no.length; i++) {
//				Cm_product cm_product = new Cm_product(); 
//				cm_product.setCm_no(Integer.parseInt(cm_no[i]));
//				cm_product.setCm_count(Integer.parseInt(c_count[i]));
//				member.setId(id[i]);
//				cm_product.setCm_image(cm_image[i]);
//				cm_product.setCm_name(cm_name[i]);
//				cm_product.setCm_price(Integer.parseInt(cm_price[i]));
//				cm_product.setCm_discount(Integer.parseInt(cm_discount[i]));
//				list.add(cm_product);
//			} 
//		}
		 
		// JSP로 전달할 데이터 설정
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("member", member);

        // JSP 경로 반환
        return "db_buyForm";
    }
}
