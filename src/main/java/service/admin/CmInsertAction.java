package service.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Dao.Cm_productDao;
import model.Cm_product;
import service.CommandProcess;

public class CmInsertAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		Cm_product cm_product = new Cm_product();
		
		String real = request.getSession().getServletContext().getRealPath("/images/product_img");
		int maxSize = 1024 * 1024 * 20;
		int result = 0;
		
		try {
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8",
						new DefaultFileRenamePolicy());
			String cm_image = mr.getFilesystemName("cm_image");
			String cm_detailimg = mr.getFilesystemName("cm_detailimage");
			String cm_content = mr.getParameter("cm_content");
			String cm_name = mr.getParameter("cm_name");
			int cm_price = Integer.parseInt(mr.getParameter("cm_price"));
			int cm_discount = Integer.parseInt(mr.getParameter("cm_discount"));
			int cm_count = Integer.parseInt(mr.getParameter("cm_count"));
			
			cm_product.setCm_name(cm_name);
			cm_product.setCm_price(cm_price);
			cm_product.setCm_discount(cm_discount);
			cm_product.setCm_count(cm_count);
			cm_product.setCm_image(cm_image);
			cm_product.setCm_content(cm_content);	
			cm_product.setCm_detailimage(cm_detailimg);
			
			
			Cm_productDao cd = Cm_productDao.getinstance();
			Cm_product cm_product2 = cd.select_pro(cm_name);
			
			if (cm_product2 == null) result = cd.insert_pro(cm_product);
			else result = -1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("result", result);
		return "cmInsert";
	}
}
