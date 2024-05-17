package service.border;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Dao.BorderDao;
import model.Account;
import service.CommandProcess;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		String uploadFilePath = request.getServletContext().getRealPath("/images/upload_img");
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

		// form name값
		int pageNum = Integer.parseInt(multi.getParameter("pageNum"));
		int a_no = Integer.parseInt(multi.getParameter("a_no"));
		String title = multi.getParameter("title");
		String file = multi.getFilesystemName("file");
		String password = multi.getParameter("password");
		String content = multi.getParameter("content");
		//게시글을 입력하고 DB에 저장한다음 꺼내서 보여줄 때 줄바꿈이 되지않아 
		//게시글 입력 후 textarea에서 엔터 = \r\n이므로 <br>로 치환시켜서 뿌려주면 줄바꿈이된다.
		content = content.replace("\r\n", "<br>");
		

		Account account = new Account();

		account.setA_title(title);
		account.setA_password(password);
		account.setA_image(file);
		account.setA_content(content);
		account.setA_no(a_no);

		BorderDao bdo = BorderDao.getInstance();
		
		int result = bdo.update(account);		
		

		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);

		return "update";
	}

}
