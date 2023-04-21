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
	
	public BoardDTO getBoardDetail(long boardId, boolean isIncreaseReadCnt) {
		
		
		BoardDTO boardDTO = new BoardDTO();
		
		
		try {
			getConnection();
			
			if(isIncreaseReadCnt) {
				
				pstmt = conn.prepareStatement("UPDATE BOARD SET READ_CNT= READ_CNT+1 WHERE BOARD_ID = ?");
				pstmt.setLong(1, boardId);
				pstmt.executeUpdate();
				
				
			}
			
			
			
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE BOARD_ID = ?");
			pstmt.setLong(1, boardId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				boardDTO.setBoardId(rs.getLong("BOARD_ID"));
				boardDTO.setWriter(rs.getString("WRITER"));
				boardDTO.setEmail(rs.getString("EMAIL"));
				boardDTO.setSubject(rs.getString("SUBJECT"));
				boardDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
				boardDTO.setReadCnt(rs.getLong("READ_CNT"));
				boardDTO.setContent(rs.getString("CONTENT"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		
		return boardDTO;
		
		
	}
	
	public boolean checkValidateMember(BoardDTO boardDTO) {
		
		boolean isValidate=false;
		
		try {	
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE BOARD_ID=? AND PASSWORD=?");
			pstmt.setLong(1, boardDTO.getBoardId());
			pstmt.setString(2, boardDTO.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isValidate = true;
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		
		return isValidate;
		
		
	}//아이디체크용
	
	
	public boolean updateBoard(BoardDTO boardDTO) {
		
		
		System.out.println(boardDTO); // 잘 넘어왔는지 확인사살
		boolean isUpdate = false;
		
		try {	
			if(checkValidateMember(boardDTO)) {
				
				getConnection();
				
				pstmt = conn.prepareStatement("UPDATE BOARD SET SUBJECT = ?, CONTENT = ? WHERE BOARD_ID = ?");
				pstmt.setString(1, boardDTO.getSubject());
				pstmt.setString(2, boardDTO.getContent());
				pstmt.setLong(3, boardDTO.getBoardId());
				pstmt.executeUpdate();
				isUpdate = true;
				
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
			
		return isUpdate;
		
	}
	
	
	
	
	public boolean deleteBoard(BoardDTO boardDTO) {

		boolean isDelete = false;
		
		try {
			
			if (checkValidateMember(boardDTO)) {
				getConnection();
				pstmt = conn.prepareStatement("DELETE FROM BOARD WHERE BOARD_ID = ?");
				pstmt.setLong(1, boardDTO.getBoardId());
				pstmt.executeUpdate();
				isDelete = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isDelete;
		
	}
	
	
	
}
