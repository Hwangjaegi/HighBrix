package service.border;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.BorderDao;
import model.Account;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		//session체크
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		int result = 0;
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		
		BorderDao bdo = BorderDao.getInstance();
		
		//a_no를 활용하여 account에 등록한 게시판 정보를 가져옵니다 
		Account account = bdo.select(a_no);
		//가져온 게시판정보에서 id값을 가져옵니다.
		String idChk = account.getId();
		
		//삭제권한부여 세션id와 게시글 id가 같다면 삭제가능 
		//또는 세션id가 admin이라면 삭제가능 
		//같지않으면 되돌아감.
		if(id == null) {
			id = "n";
		}
		
		if(idChk.equals(id) || id.equals("admin")) {
			result = bdo.delete(a_no);			
		}else result = 0;
		
		request.setAttribute("result", result);
		
		return "delete";
	}

}
