package service.border;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.BorderDao;
import Dao.MemberDao;
import model.Account;
import model.Member;
import service.CommandProcess;

public class contentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {


		String pageNum = request.getParameter("pageNum");
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		String id = request.getParameter("id");
		System.out.println("아이디 : " + id);
		//입력받은 password
		String password = "";
		if(request.getParameter("password") == null) {
			password = "member";
		}else password = request.getParameter("password");
		//클릭한 게시판 password
		String passwordChk = request.getParameter("passwordChk");
		
		int result = 0;
		
		if(password.equals(passwordChk) || id.equals("admin")) {
			BorderDao bd = BorderDao.getInstance();
			bd.readcountUpdate(a_no); // 조회수증가 
			Account account = bd.select(a_no); // 제목클릭시 상세보기로 이동할때 데이터가져오기
			MemberDao md = MemberDao.getInstance();
			if (account.getId().equals("n")) {
				account.setName("비회원");
			}else {
				Member member  = md.select(account.getId());
				account.setName(member.getName());
			}
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("a_no", a_no);
			request.setAttribute("password", password);
			request.setAttribute("Account", account); //이페이지에서 가져온결과 사용하기위해 setAttribute사용
		}else result = -1;
		
			request.setAttribute("result", result);
		
		return "content";
	}

}
