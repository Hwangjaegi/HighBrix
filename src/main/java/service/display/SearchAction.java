package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BorderDao;
import Dao.Cm_productDao;
import Dao.MemberDao;
import model.Account;
import model.Cm_product;
import model.Member;
import service.CommandProcess;

public class SearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//1페이지에 10개데이터
		final int ROW_PER_PAGE = 4; 
		//10페이지 = 1블록
		final int PAGE_PER_BLOCK = 8;
		//초기값 1 , 페이지블록을 누를때마다 pageNum을 받아온다.
		String pageNum = request.getParameter("pageNum");
		//pageNum이 없거나 값이 비어있다면 pageNum을 1로 해라.
		if(pageNum == null || pageNum.equals("")) pageNum="1";
		// currentPage는 위에서 받은 pageNum으로 정해라
		int currentPage = Integer.parseInt(pageNum);
		// 페이지 식 ★
		// 시작번호 : (페이지번호 - 1) * 페이지당 갯수[ROW_PER_PAGE]+ 1 = 1
		// 설명: 첫번째행은 currentPage값에 1을빼고 고정값 10을 곱하면 0 + 1 = 1 %.1번부터 시작
		int startRow = (currentPage-1) * ROW_PER_PAGE +1;
		// 끝번호 : 시작번호 + 페이지당개수 - 1 = 10
		// 설명 : 마지막 행은 위에서 정의된 startRow값 + 고정값 10 - 1 = 10이 마지막 행 
		int endRow = startRow + ROW_PER_PAGE - 1;
		Cm_productDao cao = Cm_productDao.getinstance();
		//List를 Board클래스형식으로 객체생성하고 그객체안에 BoardDao 클래스를 사용하여 데이터를 가져온다음 넣자
		//List<Board> list = bd.list(); 
				
		// 총 게시글 개수 -> 총 게시글 개수를 알아야 몇페이지를 만들지 알수 있다.
		int total = cao.getTotal(); 
		System.out.println("토탈개수 : " + total);
		// 답글달때 num값이 뒤죽박죽되서 싫어
		int num = total - startRow+1;

		//총페이지 (int)Math.ceil((double)총개수 / 페이지당 개수)
		//(double)total/PAGE_PER_BLOCK => Math.ceil(23.33) => (int)24.0 => 24
		int totalPage = (int)Math.ceil((double)total / PAGE_PER_BLOCK);
		System.out.println("토탈페이지 : " + totalPage);
		//start 페이지 : 현재페이지 - (현재페이지 - 1) % 블럭당 페이지 개수 [startPage = 10page 1블록]
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		System.out.println("스타트페이지 : " + startPage);
		//			ex)7page : 7  -  (7 - 1 = 6) % 10 = 7 - 6 % 10[안나눠지니까 나머지는 6] = 7-6 = 1 
		//endPage : 시작페이지 + 블록당 페이지수 - 1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		System.out.println("엔드페이지 : " + endPage);

		//총 페이지보다 endpage가 클수는 없어서 아래와같이 로직작성
		if(endPage > totalPage) endPage = totalPage;
		//Board클래스를 통해 startRow = 1 , endpage = 10 범위내의 데이터만 읽어와

		//검색결과 페이징
		List<Cm_product> list = cao.cm_list(startRow,endRow); 
		
		String img = "/highbrix/images/cart.jpg";
		String fimg = "/highbrix/images/cart2.jpg";
			
		//페이징 request
		request.setAttribute("list", list);
		request.setAttribute("num", num);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("img", img);
		request.setAttribute("fimg", fimg);
		
		//검색text값 저장		
		String search = request.getParameter("search");
		
		//저장된 text값으로 데이터의 제목에 text값이 포함되어있는 데이터 가져오기
		List<Cm_product> searchlist = cao.Search(search);
		
		//가져온 데이터 request
		request.setAttribute("searchlist", searchlist);

		
		return "searchlist";
	}

}
