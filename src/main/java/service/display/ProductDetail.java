package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Cm_productDao;
import Dao.LoveDao;
import Dao.MemberDao;
import Dao.ReviewDao;
import model.Cm_product;
import model.Love;
import model.Member;
import model.Review;
import service.CommandProcess;

public class ProductDetail implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int cm_no = Integer.parseInt(request.getParameter("cm_no"));
		
		// 상세페이지
		Cm_productDao cpd = Cm_productDao.getinstance();
		Cm_product cmproduct = cpd.select_no(cm_no);
		cmproduct.setCm_no(cm_no);
		cm_no = cmproduct.getCm_no();
		System.out.println("cmno는 : "+ cm_no);
		System.out.println("디테일이미지 : " + cmproduct.getCm_detailimage());
		
		// 찜하기
		String img = "/highbrix/images/heart.svg";
		String fimg = "/highbrix/images/heart-fill.svg";
		
		
		
		ReviewDao rd = ReviewDao.getInstance();
		int reviewCount = rd.selectCount(cm_no);
		List<Review> review = rd.select(cm_no); // 상품번호와 join한 상품review정보를 가져온다
		
		int averageScore = 0;
		
		if(review != null && !review.isEmpty()) {
			int totalr_score = 0;
			
			for(Review rev : review) {
				totalr_score += rev.getR_score();
			}
			
			averageScore = totalr_score / review.size();
			System.out.println("평균 리뷰점수 : "+ averageScore);
		}else averageScore = 0;
		
		//id를가지고 이름을 가져온다
		MemberDao md = MemberDao.getInstance();
		Member member = null;
		
		if(id == null) {
			String guest = "회원";	//로그인하지 않은사람이 상품의 리뷰를 확인할경우 이름을 회원으로 표시한다
			request.setAttribute("name", guest);
		}else {
			member = md.select(id);	//로그인했다면 id정보를가지고 이름을가져와 리뷰정보에 이름을 표시해준다
			String name = member.getName();
			request.setAttribute("id", id);
			request.setAttribute("name", name);
		}
		
		request.setAttribute("cm_product", cmproduct);
		request.setAttribute("img", img);
		request.setAttribute("fimg", fimg);
		request.setAttribute("r_score", averageScore);
		request.setAttribute("cm_no", cm_no);
		request.setAttribute("review", review);
		request.setAttribute("reviewCount", reviewCount);
		
		
		return "productContent";
	}

}
