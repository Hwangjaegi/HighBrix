package service.border;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.border.Border;

import Dao.BorderDao;
import model.Account;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//수정권한위해 session 체크
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int result = 0;		
		
		String pageNum = request.getParameter("pageNum");
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		
		BorderDao bd = BorderDao.getInstance();
		
		//권한부여
		Account account = bd.select(a_no);
		String idChk = account.getId();
		
		if(idChk.equals(id) || idChk.equals("n")) {
			result = 1;
		}else {
			result = 0;
		}
		
		request.setAttribute("account", account);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("a_no", a_no);
		request.setAttribute("result", result);
		
		return "updateForm";
	}

}
