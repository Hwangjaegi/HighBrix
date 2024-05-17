package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class AdminMember implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		
//			startRow : (현재페이지 - 1) * 페이지당 갯수 + 1
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
//			endRow 시작번호 = startRow + 페이지당 갯수 -1
		int endRow = startRow + ROW_PER_PAGE - 1;
		MemberDao md = MemberDao.getInstance();
		int total = md.getTotal();
//		총 페이지
		int totalPage = (int)(Math.ceil((double)total/ROW_PER_PAGE));
//		블록에 시작페이지 현재페이지 - (현재페이지 - 1) % 블록당 페이지
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK -1;
//		endPage는 totalPage보다 클 수 없다
		if (endPage > totalPage) endPage = totalPage;
		List<Member> list = md.list(startRow, endRow);
		
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		return "adminMember";
	}
}
