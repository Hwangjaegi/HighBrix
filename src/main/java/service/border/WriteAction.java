package service.border;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Dao.BorderDao;
import model.Account;
import service.CommandProcess;
import java.io.*;


public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//저장된 session을 id변수에저장
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		//파일 최대사이즈 지정
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		//파일 엔코딩 타입
		String encType = "UTF-8";
		//파일 업로드 시 실제 저장되는 경로 -> highbrix의 upload.img폴더안에 저장됩니다 
		String uploadFilePath = request.getServletContext().getRealPath("/images/upload_img");
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


		  int a_no = Integer.parseInt(multi.getParameter("a_no"));
		  int a_ref = Integer.parseInt(multi.getParameter("a_ref"));
		  int a_level = Integer.parseInt(multi.getParameter("a_level"));
		  int a_step =  Integer.parseInt(multi.getParameter("a_step"));
		  
		  String pageNum = multi.getParameter("pageNum");

		//requset된 파일을 multi를 통해 변수에 담는다
		String title = multi.getParameter("title");
		String file = multi.getFilesystemName("file");
		String password = "";
		if(multi.getParameter("password") == null) {
			password = "member";
		}else password = multi.getParameter("password");
		String content = multi.getParameter("content");
		
		//게시글을 입력하고 DB에 저장한다음 꺼내서 보여줄 때 줄바꿈이 되지않아 
		//게시글 입력 후 textarea에서 엔터 = \r\n이므로 <br>로 치환시켜서 뿌려주면 줄바꿈이된다.
		content = content.replace("\r\n", "<br>");
		
		//DTO에 담기위해 account를 선언
		Account account = new Account();
		
		//DTO에 requset된 데이터를 담는다.
		account.setA_title(title);
		account.setA_password(password);
		account.setA_content(content);
		
		//비회원이라면 id를 n으로 임의로설정
		if (id == null) {
			account.setId("n");
		}else account.setId(id); //아니라면 id를 설정
		
		account.setA_ref(a_ref);
		
		//파일첨부를 안했다면 null.jpg로 설정
		if(file == null) account.setA_image("null.jpg");	
		else account.setA_image(file);	//첨부했다면 file을 설정
				
		BorderDao bao = BorderDao.getInstance();	
		int a_noMax = bao.selectNum();
		//a_step 업데이트

		//새로운 글이 아니라면 == 답변글 이라면
		if(a_no != 0) {			
			bao.updateUp(account);	// 본글의 step를 +1
			account.setA_level(a_level+1);	//답변글의 level을 +1
			account.setA_step(a_step + 1);	//답변글의 step를 +1
					
		} else account.setA_ref(a_noMax);	//새로운 글이라면 a_nomax값을 ref에 저장해

		//위 if문에서 +1한 account값을 다시한번 set해줘야 값이 들어간다.
		account.setA_ref(account.getA_ref());
		account.setA_level(account.getA_level());
		account.setA_step(account.getA_step());
		
		//게시글번호 max + 1한 a_no값 가져오기
		//게시글 최대번호 +1한값을 가져와 DTO에 담는다
		account.setA_no(a_noMax);
		System.out.println("test1" + account.getA_no());
		System.out.println("test2" + account.getA_title());
		System.out.println("test3" + account.getA_password());
		System.out.println("test4" + account.getA_content());
		System.out.println("test5" + account.getA_date());
		System.out.println("test6" + account.getA_view());
		System.out.println("test7" + account.getA_image());
		System.out.println("test8" + account.getA_del());
		System.out.println("test9" + account.getA_ref());
		System.out.println("test10" + account.getA_step());
		System.out.println("test11" + account.getA_level());
		System.out.println("test12" + account.getId());
		
		int result = bao.insert(account);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum); 
		return "Write";
	}

}
