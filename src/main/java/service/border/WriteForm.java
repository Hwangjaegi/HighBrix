package service.border;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import Dao.BorderDao;
import model.Account;
import service.CommandProcess;

public class WriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("아이디 : "+id);
		
		String pageNum = request.getParameter("pageNum");
		int a_no = 0 , a_ref = 0, a_level = 0, a_step = 0;
		
		a_no = Integer.parseInt(request.getParameter("a_no"));
		
		if(a_no != 0) { // num이 0이 아니면 답변글 0이면 처음쓴글  => num이 0이면 글쓰기 , num이 0이아니면 답변글
			BorderDao bd = BorderDao.getInstance();
			//원본글을 읽어야 re_step , re_level 를 정할수있음?
			Account account = bd.select(a_no); //답변은 원본(또는 읽은글)에 대한 정보가 필요하다.
			//거기에 ref가 뭐라되어있는지
			a_ref = account.getA_ref();
			a_level = account.getA_level();
			a_step = account.getA_step();
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("a_no", a_no);
		request.setAttribute("a_ref", a_ref);
		request.setAttribute("a_level", a_level);
		request.setAttribute("a_step", a_step);
		request.setAttribute("id", id);
		
		return "WriteForm";
	}

}
