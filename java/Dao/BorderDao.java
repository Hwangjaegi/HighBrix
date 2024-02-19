package Dao;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Acount;

public class BorderDao {
	
	private static BorderDao instance = new BorderDao();
	private BorderDao() {};
	
	public static BorderDao getInstance() {
		return instance;
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
	
	public int getTotal() {
		int total = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						
		String sql = "select count(*) from board1";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) { //데이터 건수 1건 : 233
				total= rs.getInt(1); // 1행 값 가져와
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) pstmt.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return total;
	}

	public List<Acount> list(int startRow, int endRow){
		List<Acount> list = new ArrayList<Acount>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// 대부분 게시판은 최신게 위로오기떄문에 num을 내림차순으로 한다 
		//String sql = "select * from (select rownum rn, a.* from (select * from board1 order by num desc) a)"
		//		+ " where rn between ? and ?";
		String sql = "select * from (select rownum rn, a.* from (select * from board1 order by ref desc,re_step) a)"
				+ " where rn between ? and ?";

		//mysql = "select * from board1 order by num desc limit (? - 1) , 10;
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			//데이터가 입력되면 하나씩 받자.
			while(rs.next()) {
				Acount acount = new Acount();
				acount.setA_no(rs.getInt("num"));
				acount.setA_content(rs.getString("content"));
				acount.setA_title(rs.getString("subject"));
				acount.setA_date(rs.getDate("reg_date"));
				acount.setA_password(rs.getString("password"));
				acount.setA_view(rs.getInt("readcount"));
				acount.setA_ref(rs.getInt("ref"));
				acount.setA_step(rs.getInt("re_step"));
				acount.setA_level(rs.getInt("re_level"));
				acount.setA_del(rs.getString("del"));
				
				list.add(acount);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) pstmt.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
		System.out.println("list="+list.size());
		return list;
	}
	
}
