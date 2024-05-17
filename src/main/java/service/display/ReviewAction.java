package service.display;

import java.io.*;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.Part;

import Dao.ReviewDao;
import model.Review;
import service.CommandProcess;

public class ReviewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("아이디 : " + id);
		
		//파일업로드
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		//파일 엔코딩 타입
		String encType = "UTF-8";
		//파일 업로드 시 실제 저장되는 경로 -> highbrix의 upload.img폴더안에 저장됩니다 
		String uploadFilePath = request.getServletContext().getRealPath("/images/review_img");
		System.out.println("uploadFilePath : "+uploadFilePath);
		//request된 데이터를 저장할 변수선언
		MultipartRequest multi = null;
		
		try {
			// multipartRequest로만든 multi 변수에 아래와같이 입력해주고 업로드 시 업로드완료 출력
			multi = new MultipartRequest(request, uploadFilePath,uploadFileSizeLimit,
					encType, new DefaultFileRenamePolicy());
			System.out.println("서버상 실제경로 : "+ uploadFilePath +"에 업로드 완료!");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		
		/*
		 * private int rno; private String r_title; private String r_content; private
		 * String r_image; private Date r_date; private int r_score; private int p_no;
		 * private int g_no; private String id;
		 */
		
		//Form데이터 받기
		int r_score = Integer.parseInt(multi.getParameter("rating"));
		int cm_no = Integer.parseInt(multi.getParameter("cm_no"));
		
		System.out.println(r_score);
		String r_Title = multi.getParameter("r_Title");
		System.out.println(r_Title);
		String r_Content = multi.getParameter("r_Content");
		System.out.println(r_Content);
		String r_img = multi.getFilesystemName("file");
		System.out.println(r_img);
		
		Review review = new Review();
		
		if(r_img == null || r_img == "") {
			review.setR_image("");
		}else review.setR_image(r_img);
		
		
		
		review.setR_title(r_Title);
		review.setR_content(r_Content);
		review.setR_score(r_score);
		review.setId(id);
		review.setCm_no(cm_no);
		System.out.println("제목 : "+review.getR_title());
		System.out.println("내용 : "+review.getR_content());
		System.out.println("이미지 : "+review.getR_image());
		System.out.println("점수 : "+review.getR_score());
		System.out.println("아이디 : "+review.getId());
		System.out.println("상품번호 : "+review.getCm_no());
		
		ReviewDao rd =ReviewDao.getInstance();
		
		int result = rd.insert(review);
		
		request.setAttribute("result", result);
		request.setAttribute("cm_no", cm_no);
		return "review";
	}

}
