package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.BuyListDao;
import Dao.Cm_productDao;
import Dao.MemberDao;
import model.BuyList;
import model.Cm_product;
import model.Member;
import service.CommandProcess;

public class BuyListAction implements CommandProcess {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) {
    	HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        
        // 회원 정보 가져오기
        MemberDao md = MemberDao.getInstance();
        Member member = md.select(id);

        // 회원의 주문 내역 가져오기
        BuyListDao bld = BuyListDao.getInstance();
      	List<BuyList> buyList = bld.selectBuyAll(id);
      	
//      Cm_productDao cmd = Cm_productDao.getinstance();
//      List<Cm_product> cmp_list = cmd.select_buy();

        // JSP로 전달할 데이터 설정
        request.setAttribute("member", member);
        request.setAttribute("buyList", buyList);
 //       request.setAttribute("cmp_list", cmp_list);

        return "buyList"; // 주문내역 페이지의 JSP 파일명으로 변경해야 할 수도 있습니다.
    } 
}