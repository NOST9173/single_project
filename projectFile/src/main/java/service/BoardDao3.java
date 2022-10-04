package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dbconn.Dbconn;
import domain.BoardVo;
import domain.SearchCriteria;

public class BoardDao3 {

	Connection conn;
	PreparedStatement pstmt;

	public BoardDao3() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}

	public int insertBoard(String subject, String content, String writer, String ip, int midx) {
		int value = 0;

		String sql = "INSERT INTO beomjun9173.bj_c_board(originbidx, depth, level_, subject, content, writer, ip, midx) "
				+ "VALUES ( 0, 0, 0, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.setString(4, ip);
			pstmt.setInt(5, midx);
			

			value = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return value;
	}

	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri) {
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;

		String str = "";
		if (scri.getSearchType().equals("subject")) {
			str = "and subject like ?";
		} else {
			str = "and writer like ?";
		}
//		String sql = "select * from a_board where delyn='N' order by originbidx desc, depth asc";
		/*
		String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, A.* FROM (SELECT * FROM bj_c_board WHERE delyn='N' " + str
				+ " ORDER BY ORIGINbidx desc, depth ASC) A)B WHERE rnum BETWEEN ? AND ?";
		*/
		String sql = "SELECT * FROM beomjun9173.bj_c_board where delyn='N' "+str+"order by bidx desc, depth asc limit ?,?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 15 + 1);
			pstmt.setInt(3, (scri.getPage() * 15));
			rs = pstmt.executeQuery();

			// 다음 값이 존재하면 true 이고 그 행으로 커서가 이동한다.
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx")); // rs에 복사된  bidx를  bv에 옮겨 담는다.
				bv.setSubject(rs.getString("subject"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setDepth(rs.getInt("depth"));
				bv.setOriginbidx(0);

				alist.add(bv); //각각의  bv객체를  alist에 추가한다.
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return alist;
	}
	
	public ArrayList<BoardVo> boardSelectAll2() {
		ArrayList<BoardVo> mlist = new ArrayList<BoardVo>();
		ResultSet rs = null;

		
		String sql = "SELECT * FROM beomjun9173.bj_notice where delyn='N'";

		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 다음 값이 존재하면 true 이고 그 행으로 커서가 이동한다.
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx")); // rs에 복사된  bidx를  bv에 옮겨 담는다.
				bv.setSubject(rs.getString("subject"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setDepth(rs.getInt("depth"));
				bv.setOriginbidx(0);

				mlist.add(bv); // 각각의  bv객체를 
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mlist;
	}

	public BoardVo boardSelectOne(int bidx) {
		BoardVo bv = null;
		ResultSet rs = null;

		String sql = "select * from beomjun9173.bj_c_board where bidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setOriginbidx(rs.getInt("originbidx"));
				bv.setDepth(rs.getInt("depth"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setMidx(rs.getInt("midx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("content"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setFilename(rs.getString("filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bv;
	}

	public int modifyBoard(String subject, String content, String writer, int bidx) {
		// 7-3
		int value = 0;

		// 8
		String sql = "update beomjun9173.bj_c_board set subject=?, content=?, writer=?, writeday=datetime default now() where bidx=?";

		// 9
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.setInt(4, bidx);
			// 9-3
			value = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 10

			try {// 11-3 11-1에 빨간줄 뜨면 마우스 올려서  try로 묶는다.
				pstmt.close(); // 11-1
				conn.close(); // 11-2
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 7-2 // 9-4 value값을 return 시킨다. 
		return value;
	}

	public int deleteBoard(int bidx) {
		// 7-3
		int value = 0;

		// 8
		String sql = "update beomjun9173.bj_c_board set delyn='Y' where bidx=?";

		// 9
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			// 9-3
			value = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 10

			try {// 11-3 11-1에 빨간줄 뜨면 마우스 올려서 try로 묶는다.
				pstmt.close(); // 11-1
				conn.close(); // 11-2
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 7-2 // 9-4 value값을 return 시킨다.
		return value;
	}

	public int replyBoard(BoardVo bv) {
		// 7-3
		int value = 0;

		// 8
		String sql1 = "update beomjun9173.bj_c_board set depth=depth+1 where originbidx=? and depth > ?";
		String sql2 = "insert into beomjun9173.bj_c_board(originbidx, depth, level_, subject, content, writer, ip, midx)"
				+ "VALUES (?,?,?,?,?,?,?,? )";

		// 9
		try {
			// 트랜잭션 
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bv.getOriginbidx());
			pstmt.setInt(2, bv.getDepth());
			// 9-3
			value = pstmt.executeUpdate();

			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, bv.getOriginbidx());
			pstmt.setInt(2, bv.getDepth() + 1);
			pstmt.setInt(3, bv.getLevel_() + 1);
			pstmt.setString(4, bv.getSubject());
			pstmt.setString(5, bv.getContent());
			pstmt.setString(6, bv.getWriter());
			pstmt.setString(7, bv.getIp());
			pstmt.setInt(8, bv.getMidx());

			value = pstmt.executeUpdate();

			conn.commit();

		} catch (SQLException e) {
			// 실행하다가 잘못되어 정상적으로 실행이 되지 않는다면 아래의 conn.rollback으로 돌려놓는다.
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			e.printStackTrace();
		} finally { // 10

			try {// 11-3 11-1에 빨간줄 뜨면 마우스  try로 묶는다.
				pstmt.close(); // 11-1
				conn.close(); // 11-2
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 7-2 // 9-4 value값을 return 시킨다.
		return value;
	}

	public int boardTotal(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		String str = "";
		if (scri.getSearchType().equals("subject")) {
			str = "and subject like ?";
		} else {
			str = "and writer like ?";
		}

		String sql = "select count(*) as cnt from beomjun9173.bj_c_board where delyn='N'" + str + "";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return cnt;
	}

}



















