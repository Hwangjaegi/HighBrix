package Dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	public Member select(String id) {
		return (Member) session.selectOne("memberns.select",id);
	}
	public int insert(Member member) {
		return session.insert("memberns.insert",member);
	}
	public int update(Member member) {
		return session.update("memberns.update",member);
	}
	public int delete(String id) {
		return session.update("memberns.delete",id);
	}
	public Member findId(String name, String tel) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("name", name);
		hm.put("tel", tel);
		return(Member) session.selectOne("memberns.findId",hm);
	}
	public int getTotal() {
		return (int) session.selectOne("memberns.getTotal");
	}
	/*
	 * public List<Member> list(int startRow, int endRow) { Map<String, Integer> map
	 * = new HashMap<String, Integer>(); map.put("startRow", startRow);
	 * map.put("endRow", endRow); return session.selectList("memberns.list",map); }
	 */
	public Member findPassword(String id, String name) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", id);
		hm.put("name", name);
		return(Member) session.selectOne("memberns.findPw",hm);
	}
	@SuppressWarnings("unchecked")
	public List<Member> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("memberns.list", map);
	}
	public boolean isAdmin(String id, String password) {
		Member member = (Member) session.selectOne("memberns.select", id);
		if (member != null && member.getIs_admin().equals("y")) {
			return true;
		} else {
			return false;
		}
	}
}	