package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	//변수의 선언의 위치가 변수를 사용할 수 있는 범위
	DBConnectionMgr dbcp;
	// 객체생성시 클래스이름과 동일한 이름을 가진 메서드가 있으면 자동호출되는 메서드\
	// 생성자 메서드, 생성자
	public MemberDAO() {
		// jdbc1, 2단계
		// 싱글톤
		dbcp = DBConnectionMgr.getInstance();
	}
	public boolean login(MemberDTO dto) throws Exception {
		Connection con = dbcp.getConnection();
		String sql = "select id from member where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ResultSet rs = ps.executeQuery();
		boolean result = false;
		if(rs.next()) {
			result = true;
		}
		dbcp.freeConnection(con, ps, rs);
		return result;
	}
	
	public boolean insert(MemberDTO dto) throws Exception {
		Connection con = dbcp.getConnection();
		String sql = "insert into member values (?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getTel());
		int result = ps.executeUpdate();
		boolean result2 = false;
		if(result != 0) {
			result2 = true;
		}
		dbcp.freeConnection(con, ps);
		return result2;
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









