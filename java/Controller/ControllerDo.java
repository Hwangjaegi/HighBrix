package Controller;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess; // commandProcess.java생성
// urlPatterns="*.do", 끝이 .do인 url을 처리하겠다
@WebServlet(urlPatterns="*.do",		//command.properties에 저장된값을 읽어서 config에 저장한다.
	initParams={@WebInitParam(name="config",value="/WEB-INF/command_do.properties")})
public class ControllerDo extends HttpServlet { 
	private static final long serialVersionUID = 1L;
	//properties는 Map을 상속받은 아이라서 commanMap에 저장할거야
	private Map<String, Object> commandMap = new HashMap<>();
//	init method는 doGet() 또는 doPost() 메서드 하기전에 실행할 메서드
	
	// doget , dopost보다 먼저실행한다.
	public void init(ServletConfig config) throws ServletException { 
	   	String props = config.getInitParameter("config"); 
	   	// props : "/WEB-INF/command.properties"
	   	Properties pr = new Properties();
	   	// Java Properties클래스의 특징 키=값을 가진 Map을 구현
	    FileInputStream f = null; //목적 : 어딘가에 넣고자하기위한
	    try {
	          String configFilePath = 
	        		  //config[//command.properties]의 실제로 들어있는 주소 RealPath
	         		config.getServletContext().getRealPath(props);
	          // configFilePath 실제 사용할 위치에 있는 이름
	          f = new FileInputStream(configFilePath);
	          pr.load(f); //properties를 pr에 담는게 목적이다.
	          // pr에는 command.properties라는 file의 데이터를 사용
	          // command.properties안의 내용중
	          // =앞에 있는 message.do을 key
	          // =뒤에 있는 ch13.service.Message을 값
	    } catch (IOException e) { throw new ServletException(e);
	     } finally {
	          if (f != null) try { f.close(); } catch(IOException ex) {}
	     }
	     Iterator<Object> keyIter = pr.keySet().iterator(); //key를 읽어서 keyIter에 집어넣어
	     // message.do
	     while( keyIter.hasNext() ) {
	          String command = (String)keyIter.next(); //command에 key를넣고
	          // command : message.do
	          String className = pr.getProperty(command);  //getProperty하면 값이읽혀서 className에값이들어간다
	          // className : ch13.service.Message문자
	          try {
	               Class<?> commandClass = Class.forName(className); // className이 클래스로 바뀐다
	               // commandClass : service.Message 클래스
	               Object commandInstance = 
	            		  commandClass.getDeclaredConstructor().newInstance(); // 이클래스를 객체생성한다
	               // commandInstance : service.Message객체
	               commandMap.put(command, commandInstance); 
	               // commnadMap에는
	               // key가 message.do
	               // 값이 Message객체
	          } catch (Exception e) {
	               throw new ServletException(e);
	          }
	     }
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
		String view = null;
		//인터페이스생성
	    CommandProcess com=null; 
	    try { // map key:message.do   Message객체
//	  url : http://localhost(ip번호):8080/ch13/message.do
	    	  String command = request.getRequestURI();
	    	  // command : /ch13/message.do
	    	  // request.getContextPath() : /ch13
	    	  // request.getContextPath().length()+1 : 6
		      command = command.substring(request.getContextPath().length()+1); 
		      // command : message.do
	          com = (CommandProcess)commandMap.get(command); 
	          // com : service.Message객체를 CommandProcess로 형변환
	          // 자식 즉 Message객체의 requestPro()메소드 실행
	          view = com.requestPro(request, response);
	          // view는 "message.jsp" 문자
	    } catch(Throwable e) { throw new ServletException(e); } 
//	 view는 pgm article에 보여줄 프로그램
	    RequestDispatcher dispatcher =
	   request.getRequestDispatcher("/views/display/"+view+".jsp"); // Gugu.java , Message.java의 return값에.jsp를지우고 여기다써도됨
	   // request.getRequestDispatcher(view+".jsp"); // Gugu.java , Message.java의 return값에.jsp를지우고 여기다써도됨
	   dispatcher.forward(request, response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    		request.setCharacterEncoding("utf-8");
    		doGet(request, response);
	}
}