package Dao;

import java.io.Reader;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.*;
import javax.sql.DataSource;

import model.Account;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//재기님 DAO
public class BorderDao {
	
	private static BorderDao instance = new BorderDao();
	private BorderDao() {};
	
	public static BorderDao getInstance() {
		return instance;
	}
	//Data Pool 사용
	//mybatis 사용객체 선언 이름은 session으로 설정
	private static SqlSession session;
	//초기화 블록을 통해 값을 초기화한다. [자바5장에서 배웠던것] , [사용용도 static변수값을 초기화할때 사용]
	//{}만 쓰면 인스탄스 초기화블록 , static {} 형식으로쓰면 클래스 초기화 블록
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("에러내용 : "+e.getMessage());
		}
	}
	public Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("연결에러표시 : " +e.getMessage());
		}
		return conn;
	}
	
	//--------
	public int getTotal() {
		return (int) session.selectOne("borderns.getTotal");
	}

	@SuppressWarnings("unchecked")	//없으면 노란선
	public List<Account> list(int startRow, int endRow) {
		//조회 결과가 여러건 selectList, 전달할 데이터가 많은 경우에는 map에 저장하여 전송
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("borderns.list",map);
	}

	public int insert(Account account) { 
		return session.insert("borderns.insert",account); 
	}
	public void readcountUpdate(int a_no) {
		session.selectOne("borderns.readcount",a_no);
	}

	public Account select(int num) {
		System.out.println("num값 : " +num);
		return (Account) session.selectOne("borderns.select",num);
	}

	public int update(Account account) {
		return (int) session.update("borderns.update",account);
	}

	public int delete(int a_no) {
		return (int) session.delete("borderns.delete",a_no);
	}

	public int selectNum() {
		return (int) session.selectOne("borderns.selectNum");
	}

	public void updateUp(Account account) {
		session.update("borderns.updateUp", account);		
	}

	
}
