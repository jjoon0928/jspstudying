package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {
	//변수의 선언의 위치가 변수를 사용할 수 있는 범위
	DBConnectionMgr dbcp;
	// 객체생성시 클래스이름과 동일한 이름을 가진 메서드가 있으면 자동호출되는 메서드\
	// 생성자 메서드, 생성자
	public ProductDAO() {
		// jdbc1, 2단계
		// 싱글톤
		dbcp = DBConnectionMgr.getInstance();
	}
	public ArrayList<ProductDTO> list() throws Exception {
		Connection con = dbcp.getConnection();
		String sql = "select * from product";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		//dto넣을 컨테이너 생성
		ArrayList<ProductDTO> list = new ArrayList<>();
		while(rs.next()) { //해당 행이 있으면
			//dto를 생성
			//각 컬럼의 값을 꺼낸 것을  dto에 넣는다.
			ProductDTO dto = new ProductDTO();
			dto.setId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setPrice(rs.getString(4));
			dto.setCompany(rs.getString(5));
			dto.setImg(rs.getString(6));
			list.add(dto);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}
	
	public ProductDTO one(String id) throws Exception {
		Connection con = dbcp.getConnection();
		String sql = "select * from product where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		ProductDTO dto = new ProductDTO();
		if(rs.next()) {
			dto.setId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setPrice(rs.getString(4));
			dto.setCompany(rs.getString(5));
			dto.setImg(rs.getString(6));
		}
		dbcp.freeConnection(con, ps, rs);
		return dto;
	}
	
	public boolean insert2(MemberDTO dto){
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dbcp.getConnection();
			String sql = "insert into member values (?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTel());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean result2 = false;
		if(result != 0) {
			result2 = true;
		}
		dbcp.freeConnection(con, ps);
		return result2;
	}
}









