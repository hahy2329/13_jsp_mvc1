package step2_00_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DAO(Data Access Object) : 데이터 접근 객체(Input <->Output)
//DB랑 CONNECTION을 맺자!
public class MemberDAO {
	
	//SingleTon패턴 : 객체를 하나만 만든다(static)
	
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	//반환타입은 Connection 메서드명은 관례적으로 getConnection으로 작성한다.
	public void getConnection() {
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 외우지 말 것 
			
			// DB 연결 정보 > "jdbc:mysql://DB서버주소:프로토콜번호/DB명?옵션"
			String url = "jdbc:mysql://localhost:3306/LOGIN_EX?serverTimezone=UTC"; //외우지 말것 
			// DB 연결 계정
			String user    = "root";
			// DB 연결 비밀번호
			String password  = "root";
			
			//데이터베이스 연동 
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	public void getClose() {
		if(rs != null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if(pstmt != null)try{pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if(conn != null)try{conn.close();} catch (SQLException e) {e.printStackTrace();}
	}
	
	
	public boolean insertMember(MemberDTO memberDTO) {
		
		boolean isJoin = false;
		
			try {
				getConnection();
				pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID=?");
				
				pstmt.setString(1, memberDTO.getMemberId());
				rs = pstmt.executeQuery();
				
				if(!rs.next()) {
					
					pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(?,?,?,NOW())");
					pstmt.setString(1, memberDTO.getMemberId());
					pstmt.setString(2, memberDTO.getPasswd());
					pstmt.setString(3, memberDTO.getName());
		
					pstmt.executeUpdate();
					isJoin = true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				getClose();
			}
			
		return isJoin;
		
	}
	
	public boolean loginMember(String memberId, String passwd) {
		boolean isLogin = false;
		
		try {
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID=? AND PASSWD = ?");
			pstmt.setString(1, memberId);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				isLogin = true;
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		//로그인 작업 
		return isLogin;
	}
	
	public boolean deleteMember(MemberDTO memberDTO) {
		boolean isDelete = false;
	
		try {
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID =? AND PASSWD=?");
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, memberDTO.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt = conn.prepareStatement("DELETE FROM MEMBER WHERE MEMBER_ID=?");
				pstmt.setString(1, memberDTO.getMemberId());
				pstmt.executeUpdate();
				
				isDelete = true;
				
				
			}
					
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		
		return isDelete;
		
	}
	
	
	public boolean updateMember(MemberDTO memberDTO) {
		
		boolean isUpdate = false;
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND PASSWD = ?");
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, memberDTO.getPasswd());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pstmt = conn.prepareStatement("UPDATE MEMBER SET NAME = ? WHERE MEMBER_ID = ?");
				pstmt.setString(1, memberDTO.getName());
				pstmt.setString(2, memberDTO.getMemberId());
				pstmt.executeUpdate();
				isUpdate = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isUpdate;
		
	}

	
	
	
	
	
	
}
	

