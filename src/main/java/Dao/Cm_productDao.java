package Dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cm_product;

public class Cm_productDao {

		private static Cm_productDao instance = new Cm_productDao();
		private Cm_productDao() {};
		
		public static Cm_productDao getinstance() {
			return instance;
		}
		
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
		/* 관리자 상품조회 */
		public Cm_product select_pro(String cm_name) {
			return (Cm_product)session.selectOne("cm_productns.select_pro", cm_name);
		}
		/* 관리자 상품등록 */
		public int insert_pro(Cm_product cm_product) {
			System.out.println("1 = "+cm_product.getCm_name());
			System.out.println("2 = "+cm_product.getCm_price());
			System.out.println("3 = "+cm_product.getCm_discount());
			System.out.println("dao cm_content = "+cm_product.getCm_content());
			System.out.println("5 = "+cm_product.getCm_image());
			System.out.println("6 = "+cm_product.getCm_count());
			System.out.println("7 = "+cm_product.getCm_detailimage());
			return session.insert("cm_productns.insert_pro", cm_product);
		}
		@SuppressWarnings("unchecked")
		/* 일반상품 페이지리스트 */
		public List<Cm_product> cm_list(int startRow, int endRow) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			return session.selectList("cm_productns.cm_list", map);
		}
		public int getTotal() {
			return (int) session.selectOne("cm_productns.getTotal");
		}
		/* 일반상품번호조회 */
		public Cm_product select_no(int cm_no) {
			return (Cm_product) session.selectOne("cm_productns.select_no", cm_no);
		}

		/* 일반상품조회 */
	    public Cm_product select(int cm_no) { return (Cm_product)
	    session.selectOne("cm_productns.select", cm_no); }
	    
		/* 관리자 상품수정 */
	    public int update(Cm_product cm) { return
	    session.update("cm_productns.update_pro", cm); }

	    /* 관리자 상품삭제 */
	    public int delete_pro(int cm_no) { return 
	    session.delete("cm_productns.delete_pro", cm_no); }
		
	    /* 할인상품조회 */
		@SuppressWarnings("unchecked")
		public List<Cm_product> disproductList() {
			return session.selectList("cm_productns.disproductList");
		}

		public int getTotaldis() {	
			return (int) session.selectOne("cm_productns.getTotaldis");
		}
		/* 할인상품 페이지리스트 */
		@SuppressWarnings("unchecked")
		public List<Cm_product> dis_list(int startRow, int endRow) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			return session.selectList("cm_productns.dis_list", map);
		}
		
		/* 일반상품 메인페이지 */
		@SuppressWarnings("unchecked")
		public List<Cm_product> select_main1() {
			return session.selectList("cm_productns.select_main1");
		}
		@SuppressWarnings("unchecked")
		public List<Cm_product> select_main2() {
			return session.selectList("cm_productns.select_main2");
		}
		@SuppressWarnings("unchecked")
		public List<Cm_product> select_main3() {
			return session.selectList("cm_productns.select_main3");
		}
		@SuppressWarnings("unchecked")
		public List<Cm_product> Search(String search) {
//			Map<String, String> map = new HashMap<String, String>();
//			map.put("search", search);
			return session.selectList("cm_productns.search",search);
		}

		@SuppressWarnings("unchecked")
		public List<Cm_product> select_buy() {
			return session.selectList("cm_productns.select_buy");

		}	
}
