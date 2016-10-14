package boardDB;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class boardDBDAO {

	private static boardDBDAO instance = new boardDBDAO();

	public static boardDBDAO getInstance() {
		return instance;
	}

	private Connection getConnection() throws Exception {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}

	//게시판 목록 카운팅
	public int listCount() throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return x;

	}

	//게시판 DB 가져오기
	public List<boardDBDTO> getBoard() throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<boardDBDTO> boardList = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from board order by num desc");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardList = new ArrayList<boardDBDTO>();
				do {
					boardDBDTO board = new boardDBDTO();
					board.setNum(rs.getInt("num"));
					board.setUsername(rs.getString("username"));
					board.setPasswd(rs.getString("passwd"));
					board.setTitle(rs.getString("title"));
					board.setMemo(rs.getString("memo"));
					board.setReg_time(rs.getTimestamp("reg_time"));
					board.setHit(rs.getShort("hit"));
					board.setRef(rs.getInt("ref"));
					board.setIndent(rs.getInt("indent"));
					board.setStep(rs.getInt("step"));
					boardList.add(board);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return boardList;
	}
	
	//게시글 삽입
	public void insertBoard(boardDBDTO board) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into board values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getUsername());
			pstmt.setString(3, board.getPasswd());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getMemo());
			pstmt.setTimestamp(6, board.getReg_time());
			pstmt.setShort(7, board.getHit());
			pstmt.setInt(8, board.getRef());
			pstmt.setInt(9, board.getIndent());
			pstmt.setInt(10, board.getStep());
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
	}
	
	//num별 게시글 보기
	public boardDBDTO getBoard(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boardDBDTO DTO = null;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("update board set hit=hit+1 where num=?");
			pstmt.setLong(1, num);
			pstmt.executeUpdate();	
			
			pstmt = conn.prepareStatement("select * from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				DTO = new boardDBDTO();
				DTO.setUsername(rs.getString("username"));
				DTO.setPasswd(rs.getString("passwd"));
				DTO.setTitle(rs.getString("title"));
				DTO.setMemo(rs.getString("memo"));
				DTO.setReg_time(rs.getTimestamp("reg_time"));
				DTO.setHit(rs.getShort("hit"));
				DTO.setRef(rs.getInt("ref"));
				DTO.setIndent(rs.getInt("indent"));
				DTO.setStep(rs.getInt("step"));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return DTO;
	}
	
	//삭제 전 비밀번호 check
	public int deleteCheck(int num, String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPasswd = "";
		int x = 0;

		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbPasswd = rs.getString("passwd");
				if(dbPasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from board where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1;
				} else{
					x = -1;
				}
			}
			System.out.println(x);
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return x;
	}
	
	
	//수정 시 DB내용 가져오기
	public boardDBDTO modifyCheck(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boardDBDTO DTO = null;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				DTO = new boardDBDTO();
				DTO.setNum(rs.getInt("num"));
				DTO.setUsername(rs.getString("username"));
				DTO.setPasswd(rs.getString("passwd"));
				DTO.setTitle(rs.getString("title"));
				DTO.setMemo(rs.getString("memo"));
				DTO.setReg_time(rs.getTimestamp("reg_time"));
				DTO.setHit(rs.getShort("hit"));
				DTO.setRef(rs.getInt("ref"));
				DTO.setIndent(rs.getInt("indent"));
				DTO.setStep(rs.getInt("step"));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.clearBatch();
			if(conn!=null)
				conn.close();
		}
		return DTO;
	}
	
	
	//수정
	public int update(boardDBDTO content, int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPasswd = "";
		int x = 0;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbPasswd = rs.getString("passwd");
								
				if(dbPasswd.equals(content.getPasswd())){
					pstmt = conn.prepareStatement("update board set title=?, memo=? where num=?");
					pstmt.setString(1, content.getTitle());
					pstmt.setString(2, content.getMemo());
					pstmt.setInt(3, num);
					pstmt.executeUpdate();
					x = 1;
				} else{
					x = 0;
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return x;
	}
	
	//reply getTitle
	public String getTitle(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String title = null;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select title from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
				title = rs.getString("title");
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return title;
	}

	//글 ref,indent,step값 가져오기
	public boardDBDTO getStep(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boardDBDTO DTO = null;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select * form board where num=?");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				DTO = new boardDBDTO();
				DTO.setNum(rs.getInt("num"));
				DTO.setUsername(rs.getString("username"));
				DTO.setPasswd(rs.getString("passwd"));
				DTO.setTitle(rs.getString("title"));
				DTO.setMemo(rs.getString("memo"));
				DTO.setReg_time(rs.getTimestamp("reg_time"));
				DTO.setHit(rs.getShort("hit"));
				DTO.setRef(rs.getInt("ref"));
				DTO.setIndent(rs.getInt("indent"));
				DTO.setStep(rs.getInt("step"));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return DTO;
	}
	
	/*//reply update
	public void replyUpdate(boardDBDTO reply) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;

		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into board values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, reply.getNum());
			pstmt.setString(2, reply.getUsername());
			pstmt.setString(3, reply.getPasswd());
			pstmt.setString(4, reply.getTitle());
			pstmt.setString(5, reply.getMemo());
			pstmt.setTimestamp(6, reply.getReg_time());
			pstmt.setShort(7, reply.getHit());
			pstmt.setInt(8, reply.getRef());
			pstmt.setInt(9, reply.getIndent()+1);
			pstmt.setInt(10, reply.getStep()+1);
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
	}*/
	
	//
}
