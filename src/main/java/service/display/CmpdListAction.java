package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Cm_productDao;
import model.Cm_product;
import service.CommandProcess;

public class CmpdListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		final int ROW_PER_PAGE = 4; // 한페이지의 상품 갯수
		final int PAGE_PER_BLOCK = 4; // 한블록의 페이지 갯수
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum :" +pageNum);
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); //페이지 번호

		//시작번호 (페이지 - 1) * 페이지당 갯수 + 1
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		// 페이지 끝번호 시작번호 + 페이지당갯수 - 1
		int endRow = startRow + ROW_PER_PAGE - 1;
		
		Cm_productDao cpd = Cm_productDao.getinstance();
		//	String condition = "select * from cmproduct order by desc";
		int total = cpd.getTotal();
		System.out.println("total :"+total); //15
		int num = total - startRow + 1;
		System.out.println("num : "+num);
		int totalPage = (int)Math.ceil((double)total/ ROW_PER_PAGE); // 총 페이지 수 4
		System.out.println("totalPage : "+ totalPage);
		// 현재페이지 - (현재페이지 - 1)%10
		int startPage = currentPage - (currentPage -1) % PAGE_PER_BLOCK; // 한 블록의 시작 페이지
		System.out.println("startpage : " +startPage);
		// 시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + PAGE_PER_BLOCK -1 ;
		System.out.println("endpage : "+endPage);
		// endPage 는 총페이지 보다 크면 안된다
		if (endPage > totalPage)
			endPage = totalPage;
		System.out.println("startRow : "+startRow+"/ endRow : "+ endRow);
		
		List<Cm_product> list = cpd.cm_list(startRow, endRow);
		
		String img = "/highbrix/images/cart.jpg";
		String fimg = "/highbrix/images/cart2.jpg";
		
		request.setAttribute("num", num);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("img", img);
		request.setAttribute("fimg", fimg);
		
		return "cmproductList";
	}

}
