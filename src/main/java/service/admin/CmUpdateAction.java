package service.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Dao.Cm_productDao;
import model.Cm_product;
import service.CommandProcess;

public class CmUpdateAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Cm_product cm = new Cm_product();
		
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 20;
		
		MultipartRequest mr;
		try {
			mr = new MultipartRequest(request, real, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			String cm_image = mr.getFilesystemName("cm_image");
			String cm_content = mr.getParameter("cm_content");
			String test = request.getParameter("cm_content");
			String cm_detailimg = mr.getFilesystemName("cm_detailimage");
			int cm_no = Integer.parseInt(mr.getParameter("cm_no"));
			String cm_name = mr.getParameter("cm_name");
			int cm_price = Integer.parseInt(mr.getParameter("cm_price"));
			int cm_discount = Integer.parseInt(mr.getParameter("cm_discount"));
			int cm_count = Integer.parseInt(mr.getParameter("cm_count"));
			
			cm.setCm_image(cm_image);
			System.out.println("1"+cm.getCm_image());
			cm.setCm_content(cm_content);
			System.out.println("2"+cm.getCm_content());
			cm.setCm_no(cm_no);
			System.out.println("3"+cm.getCm_no());
			cm.setCm_name(cm_name);
			System.out.println("4"+cm.getCm_name());
			cm.setCm_price(cm_price);
			System.out.println("5"+cm.getCm_price());
			cm.setCm_discount(cm_discount);
			System.out.println("6"+cm.getCm_discount());
			cm.setCm_count(cm_count);
			System.out.println("7"+cm.getCm_count());
			cm.setCm_detailimage(cm_detailimg);
			System.out.println("8"+cm.getCm_detailimage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		Cm_productDao cd = Cm_productDao.getinstance();
		int result = cd.update(cm);
		request.setAttribute("result", result);
		return "cmUpdate";
	}
}