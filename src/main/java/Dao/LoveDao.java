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

import model.Cm_product;
import model.Love;


public class LoveDao {
	private static LoveDao Instance = new LoveDao();
	private LoveDao() { }
	public static LoveDao getInstance() {
		return Instance;
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
	public int insert_cm(int cm_no, String id, String cm_name, String cm_image, int cm_price) { 
		Map<String, Object> map= new HashMap<String, Object>(); 
		map.put("cm_no", cm_no); 
		map.put("id", id);
		map.put("cm_name", cm_name);
		map.put("cm_image", cm_image);
		map.put("cm_price", cm_price);
		return (int) session.insert("lovens.insert_cm", map); }
	
	public int delete_cm(Love love) {
		return session.delete("lovens.delete_cm",love);
	}
	
	public int deleteAll_cm(Love love) {
		return session.delete("lovens.deleteAll_cm",love);
	}
	
	public List<Love> lovelist() {
		return session.selectList("lovens.lovelist");
		
	}
	public List<Love> select_cm(String id) {
		return session.selectList("lovens.select_cm",id);
	}
}
