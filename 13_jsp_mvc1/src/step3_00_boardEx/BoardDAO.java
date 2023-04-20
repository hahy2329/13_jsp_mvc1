package step3_00_boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	
	private BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
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
			String url = "jdbc:mysql://localhost:3306/BOARD_EX?serverTimezone=UTC"; //외우지 말것 
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
	
	
	public void insertBoard(BoardDTO boardDTO) {
		
		try {
			getConnection();
			
			String sql = "INSERT INTO BOARD(WRITER, EMAIL, SUBJECT, PASSWORD, ENROLL_DT, READ_CNT, CONTENT)";
				   sql +="VALUES(?,?,?,?,NOW(),0,?)";//BOARDId는 primary이므로 자동으로 들어가기에 위에 빼줌
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getWriter());
			pstmt.setString(2, boardDTO.getEmail());
			pstmt.setString(3, boardDTO.getSubject());
			pstmt.setString(4, boardDTO.getPassword());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		
	}
	
	public ArrayList<BoardDTO> getBoardList(){
		
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		//select > add 
		
		try {
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardDTO temp = new BoardDTO();
				temp.setBoardId(rs.getLong("BOARD_ID"));
				temp.setWriter(rs.getString("WRITER"));
				temp.setSubject(rs.getString("SUBJECT"));
				temp.setEnrollDt(rs.getDate("ENROLL_DT"));
				temp.setReadCnt(rs.getLong("READ_CNT"));
				boardList.add(temp);
				
				//한 줄씩 읽어온 rs에서 새로운 객체 temp에 넣어주고 boardList에 없을때까지 추가한다.
				
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		
		return boardList;
	}
	
	
}
