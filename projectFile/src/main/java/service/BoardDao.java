package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dbconn.Dbconn;
import domain.BoardVo;
import domain.SearchCriteria;

public class BoardDao {

	Connection conn;
	PreparedStatement pstmt;

	public BoardDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}

	public int insertBoard(String subject, String content, String writer, String ip, int midx) {
		int value = 0;
		
		ResultSet rs = null;
		String sql = "INSERT INTO beomjun9173.bj_a_board(originbidx, depth, level_, subject, content, writer, ip, midx) "
				+ "VALUES (0, 0, 0, ?, ?, ?, ?, ?)";
		
//		String sql2 = "select max(bidx) as maxbidx from bj_a_board" ;
//		
//		String sql3 = "update bj_a_board set originbidx = ? where bidx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.setString(4, ip);
			pstmt.setInt(5, midx);
//			pstmt.setString(6, filename);

			value = pstmt.executeUpdate();
			
//			pstmt = conn.prepareStatement(sql2);
//			rs = pstmt.executeQuery();			
			
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
	public int insertNotice(String subject, String content, String writer, String ip, int midx) {
		int value = 0;

		String sql = "INSERT INTO beomjun9173.bj_notice(originbidx, depth, level_, subject, content, writer, ip, midx) "
				+ "VALUES (0, 0, 0, ?, ?, ?, ?, ?)";

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
		String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, A.* FROM (SELECT * FROM bj_a_board WHERE delyn='N' " + str
				+ " ORDER BY ORIGINbidx desc, depth ASC) A)B WHERE rnum BETWEEN ? AND ?";
		*/
		String sql = "SELECT * FROM beomjun9173.bj_a_board where delyn='N'"+str+"order by bidx desc, depth asc limit ?,?" ;
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
//			pstmt.setInt(2, (scri.getPage() - 1) * 15 + 1);
//			pstmt.setInt(3, (scri.getPage() * 15));
			pstmt.setInt(2, (scri.getPage()-1) * 15);
			pstmt.setInt(3, 15);
			rs = pstmt.executeQuery();

			// ?????? ?????? ???????????? true ?????? ??? ????????? ????????? ????????????.
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx")); // rs??? ?????????  bidx???  bv??? ?????? ?????????.
				bv.setSubject(rs.getString("subject"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setDepth(rs.getInt("depth"));
				bv.setOriginbidx(0);

				alist.add(bv); // ?????????  bv?????????  alist??? ????????????.
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return alist;
	}
	
	//
	//
	public ArrayList<BoardVo> boardSelectAll2() {
		ArrayList<BoardVo> mlist = new ArrayList<BoardVo>();
		ResultSet rs = null;

		
		String sql = "SELECT * FROM beomjun9173.bj_notice where delyn='N' ";

		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// ?????? ?????? ???????????? true ?????? ??? ????????? ????????? ????????????.
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx")); // rs??? ?????????  bidx???  bv??? ?????? ?????????.
				bv.setSubject(rs.getString("subject"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setDepth(rs.getInt("depth"));
				bv.setOriginbidx(0);

				mlist.add(bv); // ?????????  bv????????? 
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
	//
	//
	//
	// ?????? ????????? ?????? ??????
	//
	//
	public BoardVo boardSelectOne2(int bidx) {
		BoardVo bv = null;
		ResultSet rs = null;

		String sql = "select * from beomjun9173.bj_notice where bidx=?";
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
				bv.setWriteday(rs.getNString("writeday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bv;
	}

	public BoardVo boardSelectOne(int bidx) {
		BoardVo bv = null;
		ResultSet rs = null;

		String sql = "select * from beomjun9173.bj_a_board where bidx=?";
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
		String sql = "update beomjun9173.bj_a_board set subject=?, content=?, writer=?, writeday=datetime default now() where bidx=?";
		
		System.out.println(subject);
		System.out.println(content);
		System.out.println(writer);
		System.out.println(bidx);
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

			try {// 11-3 11-1??? ????????? ?????? ????????? ?????????  try??? ?????????.
				pstmt.close(); // 11-1
				conn.close(); // 11-2
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 7-2 // 9-4 value?????? return ?????????. 
		return value;
	}
	public int modifyNotice(String subject, String content, String writer, int bidx) {
		// 7-3
		int value = 0;

		// 8
		String sql = "update beomjun9173.bj_notice set subject=?, content=?, writer=?, writeday=datetime default now() where bidx=?";
		System.out.println(subject);
		System.out.println(content);
		System.out.println(writer);
		System.out.println(bidx);
	
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

			try {// 11-3 11-1??? ????????? ?????? ????????? ?????????  try??? ?????????.
				pstmt.close(); // 11-1
				conn.close(); // 11-2
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 7-2 // 9-4 value?????? return ?????????. 
		return value;
	}
	public int deleteBoard(int bidx) {
		// 7-3
		int value = 0;

		// 8
		String sql = "update beomjun9173.bj_a_board set delyn='Y' where bidx=?";

		// 9
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			// 9-3
			value = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 10

			try {// 11-3 11-1??? ????????? ?????? ????????? ????????? try??? ?????????.
				pstmt.close(); // 11-1
				conn.close(); // 11-2
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 7-2 // 9-4 value?????? return ?????????.
		return value;
	}
	public int deleteBoard2(int bidx) {
		// 7-3
		int value = 0;

		// 8
		String sql = "update beomjun9173.bj_notice set delyn='Y' where bidx=?";
//		String sql = "delete from bj_notice where bidx=?";

		// 9
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			// 9-3
			value = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 10

			try {// 11-3 11-1??? ????????? ?????? ????????? ????????? try??? ?????????.
				pstmt.close(); // 11-1
				conn.close(); // 11-2
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 7-2 // 9-4 value?????? return ?????????.
		return value;
	}

	public int replyBoard(BoardVo bv) {
		// 7-3
		int value = 0;

		// 8
		String sql1 = "update beomjun9173.bj_a_board set depth=depth+1 where originbidx=? and depth > ?";
		String sql2 = "insert into beomjun9173.bj_a_board(originbidx, depth, level_, subject, content, writer, ip, midx)"
				+ "VALUES (?,?,?,?,?,?,?,? )";

		// 9
		try {
			// ???????????? 
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
			// ??????????????? ???????????? ??????????????? ????????? ?????? ???????????? ????????? conn.rollback?????? ???????????????.
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			e.printStackTrace();
		} finally { // 10

			try {// 11-3 11-1??? ????????? ?????? ?????????  try??? ?????????.
				pstmt.close(); // 11-1
				conn.close(); // 11-2
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 7-2 // 9-4 value?????? return ?????????.
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

		String sql = "select count(*) as cnt from beomjun9173.bj_a_board where delyn='N'" + str + "";

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

















