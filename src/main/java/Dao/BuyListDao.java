package Dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.BuyList;
import model.Cart;
import model.Cm_product;

public class BuyListDao {
	private static BuyListDao Instance = new BuyListDao();
	private BuyListDao() { }
	public static BuyListDao getInstance() {
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
	
	public int insertBuyList(List<Cm_product> buy_list) {
		return session.insert("buylistns.insertBuyList",buy_list);
	}
	
	public int selectBuyList(int bl_no) {
		return session.insert("buylistns.selectBuyList",bl_no);
	}
	
	public int insert(BuyList buyList) {
		System.out.println("cm_no = "+buyList.getCm_no());
		System.out.println("id = "+buyList.getId());
		return session.insert("buylistns.insert",buyList);
		
	}
	public List<BuyList> selectBuyAll(String id) {
		return session.selectList("buylistns.selectBuyAll",id);
	}
	//재기추가
	public List<BuyList> selectBuyAlltoMember() {
		
		return session.selectList("buylistns.selectBuyAlltoMember");
	}
}
