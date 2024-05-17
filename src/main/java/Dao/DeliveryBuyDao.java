package Dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Delivery_buy;
import service.member.Deliverybuy;

public class DeliveryBuyDao {
	private static DeliveryBuyDao Instance = new DeliveryBuyDao();
	private DeliveryBuyDao() { }
	public static DeliveryBuyDao getInstance() {
		return Instance;
	}
	private static SqlSession session;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public int insert(Delivery_buy db_buy) {
		System.out.println("address : "+db_buy.getDb_address());
		System.out.println("tel : "+db_buy.getDb_tel());
		System.out.println("name : "+db_buy.getDb_name());
		System.out.println("request : "+db_buy.getDb_request());
		System.out.println("id : "+db_buy.getId());
		System.out.println("cm_no : "+db_buy.getCm_no());
		return session.insert("db_buyns.insert_db_buy",db_buy);
	}
	public int selectdb_no() {
		return (int) session.selectOne("db_buyns.selectdb_no");
	}
	@SuppressWarnings("unchecked")
	public List<Deliverybuy> db_list(String id) {
		return session.selectList("db_buyns.db_list", id);
	}
	public int getTotal() {
		return (int) session.selectOne("db_buyns.getTotal");
	}
	@SuppressWarnings("unchecked")	
	public List<Deliverybuy> b_list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("db_buyns.b_list", map);
	}
}
