package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dbconn.Dbconn;
import domain.BoardVo;
import domain.MemberVo;
import domain.SearchCriteria;

public class MemberDao {

	private Connection conn;
	private PreparedStatement pstmt;
	
	
	public MemberDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	// 회원가입 할 때 필요한 부분 
	//
	//
	//
	//
	//
	public int insertMember(String memberId, String memberPwd,String memberName,String memberEmail,String memberGender, String memberPhone, String ip){
		int value=0;		
		 
		String sql="insert into beomjun9173.bj_a_member(MEMBERID,MEMBERPWD,MEMBERNAME,MEMBEREMAIL,MEMBERGENDER, MEMBERPHONE, MEMBERIP)" 
				+ "values(?,?,?,?,?,?,?)";
			
		//쿼리를 실행하기 위한 쿼리실행 클래스를 생성한다.
		try{
		//	Statement stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			pstmt.setString(3, memberName);
			pstmt.setString(4, memberEmail);
			pstmt.setString(5, memberGender);
			pstmt.setString(6, memberPhone);
			pstmt.setString(7,ip);
//			pstmt.setInt(8, midx);
			value = pstmt.executeUpdate();		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return value;
	}
	//회원리스트 페이지 만들 때 필요한 부분 
	//
	//
	//
	//
	//
	public ArrayList<MemberVo> memberSelectAll(){	
		//객체생성 
		ArrayList<MemberVo> alist  = new ArrayList<MemberVo>();
		ResultSet rs = null;
		String sql="select * from beomjun9173.bj_a_member where delyn='N' order by midx desc";
		
		try{
			//Connection 객체를 통해서 문자열을 쿼리화시킨다.
			pstmt = conn.prepareStatement(sql);
			//여러 데이터를 그대로 복사해서 담는 클래스  ResultSet 
			rs = pstmt.executeQuery();
			//반복문 실행 . rs.next()는 다음 행에 값이 있는지  true 없으면 false. 있으면 그 행으로 이동 
			while(rs.next()){
				
				//객체생성 
				MemberVo mv = new MemberVo();
				//옮겨담고 
				mv.setMidx(rs.getInt("midx"));
				mv.setMembername(rs.getString("memberName"));
				mv.setMemberphone(rs.getString("memberphone"));
				mv.setWriteday(rs.getString("writeday"));
				//담은 mv를 alist에 추가한다.
				alist.add(mv);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			rs.close();
			pstmt.close();
			conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}	
		
		return alist;
	}
	//회원 로그인 할 때 필요한 부분 
	//
	//
	//
	//
	//
	public MemberVo memberLogin(String memberId, String memberPwd) {
		int value = 0;
		ResultSet rs = null;
		MemberVo mv = null;
		String sql = "select * from beomjun9173.bj_a_member where delyn='N' and memberid=? and memberpwd=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mv = new MemberVo();
				mv.setMidx(rs.getInt("midx"));
				mv.setMemberid(rs.getString("memberId"));
				mv.setMembername(rs.getString("memberName"));
				mv.setMemberphone(rs.getString("memberPhone"));
				mv.setMemberemail(rs.getString("memberEmail"));
				mv.setMembergender(rs.getString("memberGender"));
				mv.setManager_id(rs.getString("Manager_id"));
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mv;
	}
	// 회원 아이디 찾기 페이지 만들 때 필요한 부분 
	//
	//
	//
	//
	//
	public MemberVo memberIdSearch(String memberName, String memberEmail ,String memberPhone) {
		int value = 0;
		ResultSet rs = null;
		MemberVo mv = null;
		String sql = "select * from beomjun9173.bj_a_member where delyn='N' and membername=? and membermail=? and memberphone=? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberEmail);
			pstmt.setString(3, memberPhone);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mv = new MemberVo();
				mv.setMidx(rs.getInt("midx"));
				mv.setMemberid(rs.getString("memberId"));
				mv.setMembername(rs.getString("memberName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mv;
	}
	// 회원 비밀번호 찾기 페이지 만들 때 필요한 부분 
	//
	//
	//
	//
	//
	public MemberVo memberPwdSearch(String memberId,String memberName, String memberEmail ,String memberPhone) {
		//int value = 0; // 업데이트나 인서트 
		ResultSet rs = null; // 특정한 값을 가져올 때 
		MemberVo mv = null;
		String sql = "select * from beomjun9173.bj_a_member where delyn='N' and memberid=? and membername=? and membermail=? and memberphone=? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberName);
			pstmt.setString(3, memberEmail);
			pstmt.setString(4, memberPhone);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mv = new MemberVo();
				mv.setMidx(rs.getInt("midx"));
				mv.setMemberid(rs.getString("memberId"));
				mv.setMemberpwd(rs.getString("memberPwd"));
				mv.setMembername(rs.getString("memberName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mv;
	}
	// 회원 중복체크 필요한 부분 
	//
	//
	//
	//
	//
	public MemberVo IdCheckForm(String memberId) {
		ResultSet rs = null;
		MemberVo mv = null;
		
		String sql ="select * from beomjun9173.bj_a_member where delyn='N' and memberid=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				
				mv = new MemberVo();
				mv.setMidx(rs.getInt("midx"));
				mv.setMemberid(rs.getString("memberId"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		
		
		return mv;
	}
	
	
	public int deleteMember(int midx) {
		// 7-3
		int value = 0;

		// 8
		String sql = "update beomjun9173.bj_a_member set delyn='Y' where midx=?";

		// 9
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
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
	//
	//
	//
	//
	//
	//
	//관리자 페이지 보드 작성 구문
	//
	//
	//
	//
	//
	//
	
	public int insertBoard(String subject, String content, String writer, String ip, int midx) {
		int value = 0;

		String sql = "INSERT INTO beomjun9173.bj_notice( originbidx, depth, level_, subject, content, writer, ip, midx) "
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

	

	//
	//
	//
	//
	//
	//
	
	
	
}
 

















