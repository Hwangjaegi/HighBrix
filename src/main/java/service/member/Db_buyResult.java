package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.BuyListDao;
import Dao.DeliveryBuyDao;
import Dao.MemberDao;
import model.BuyList;
import model.Delivery_buy;
import model.Member;
import service.CommandProcess;

public class Db_buyResult implements CommandProcess {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        Delivery_buy db_buy = new Delivery_buy();
     // 회원 정보 가져오기
        MemberDao md = MemberDao.getInstance();
        Member member = md.select(id);
        
     // 주문 정보를 buyList 테이블에 저장
        BuyListDao buyListDao = BuyListDao.getInstance();
     // 배송 정보 삽입 및 해당 배송 번호 가져오기
        DeliveryBuyDao dbd = DeliveryBuyDao.getInstance();
        
        String db_address = request.getParameter("order_addr");
        String db_tel = request.getParameter("tel");
        String db_request = request.getParameter("memo");
        String name = request.getParameter("name");
        String[] cm_image1 = request.getParameterValues("cm_image");
        String[] cm_name1 = request.getParameterValues("cm_name");
        String[] bl_price1 = request.getParameterValues("price");
        String[] cm_price1 = request.getParameterValues("cm_price");
        String[] bl_count1 = request.getParameterValues("count");
        String[] cm_no1 = request.getParameterValues("cm_no");
        
        int cm_no=0;
        int bl_count=0;
        int bl_price=0;
        int cm_price=0;
        int result = 0;
        String cm_image = null;
        String cm_name = null;
        for(int i = 0; i < cm_no1.length; i++) {
        	cm_no =Integer.parseInt(cm_no1[i]);
        	cm_image = cm_image1[i];
        	cm_name = cm_name1[i];
        	bl_count =Integer.parseInt(bl_count1[i]);
        	cm_price =Integer.parseInt(cm_price1[i]);
        	bl_price =Integer.parseInt(bl_price1[i]);
        	
        	BuyList buyList = new BuyList();
            buyList.setBl_count(bl_count);
            buyList.setBl_price(bl_price);
            buyList.setId(id);
            buyList.setCm_no(cm_no);// 주문 상품 번호
            buyListDao.insert(buyList);
            
         // 배송 정보 설정
            db_buy.setDb_request(db_request);
            db_buy.setDb_address(db_address);
            db_buy.setDb_tel(db_tel);
            db_buy.setDb_name(name);
            db_buy.setCm_no(cm_no);
            db_buy.setId(id);
            db_buy.setCm_image(cm_image);
            db_buy.setCm_name(cm_name);
            db_buy.setCm_price(cm_price);
            db_buy.setBl_count(bl_count);
            result = dbd.insert(db_buy);
         }
        int db_no = dbd.selectdb_no();

       
        // JSP로 전달할 데이터 설정
        request.setAttribute("cm_no", cm_no);
        request.setAttribute("result", result);
        request.setAttribute("member", member);

        return "db_buyResult";
    }
}
