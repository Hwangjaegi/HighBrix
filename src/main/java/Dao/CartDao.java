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

import model.Cart;

public class CartDao {
	private static CartDao instance = new CartDao();
	private CartDao() {}
	public static CartDao getInstance() {
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
		@SuppressWarnings("unchecked")
		public List<Cart> cart_list(String id) {
			return session.selectList("cartns.cart_list", id);
		}
		public int insert(Cart cart) {
			System.out.println("1 :" + cart.getC_count());
			System.out.println("2 :" + cart.getC_no());
			System.out.println("3 :" + cart.getCm_discount());
			System.out.println("4 :" + cart.getCm_image());
			System.out.println("5 :" + cart.getCm_no());
			System.out.println("6 :" + cart.getCm_price());
			System.out.println("7 :" + cart.getId());
			return session.insert("cartns.insert_cm", cart);
		}
		public int delete(String id, int c_no) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("c_no", c_no);
			return session.delete("cartns.delete", map);
		}
}