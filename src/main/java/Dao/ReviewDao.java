package Dao;

import java.io.Reader;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.*;
import javax.sql.DataSource;

import model.Account;
import model.Review;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//재기님 DAO
public class ReviewDao {
	
	private static ReviewDao instance = new ReviewDao();
	private ReviewDao() {};
	
	public static ReviewDao getInstance() {
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

	public int insert(Review review) {
		
		return session.insert("reviewns.insert",review);
	}

	
	@SuppressWarnings("unchecked")
	public List<Review> select(int cm_no) {
		
		return (List<Review>) session.selectList("reviewns.select",cm_no);
	}

	public int selectCount(int cm_no) {
		
		return (int) session.selectOne("reviewns.selectCount",cm_no);
	}

	public int selectScore(List<Review> review) {
		
		return (int) session.selectOne("reviewns.selectScore",review);
	}

	@SuppressWarnings("unchecked")
	public List<Review> selectPro() {
	
		return session.selectList("reviewns.selectPro");
	}

	
	//--------
	
	
	
}
