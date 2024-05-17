package service.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.LoveDao;
import model.Cm_product;
import model.Love;
import service.CommandProcess;

public class LoveList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String cm_name = request.getParameter("cm_name");
        String cm_image = request.getParameter("cm_image");
        System.out.println("price = "+request.getParameter("cm_price"));
        int cm_price = Integer.parseInt(request.getParameter("cm_price"));
        int cm_no = Integer.parseInt(request.getParameter("cm_no"));
	
		LoveDao ld = LoveDao.getInstance();
		ld.insert_cm(cm_no, id, cm_name, cm_image, cm_price);

		return "loveList";
	}

}
