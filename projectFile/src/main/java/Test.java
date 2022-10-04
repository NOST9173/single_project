import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Dbconn.Dbconn;

public class Test {

	public static void main(String[] args) {

		Connection conn = null;  // DB 세션 객체 
		PreparedStatement pstm = null; //SQL 객
		ResultSet rs = null;	//쿼리문의 반환값 객체 
	 
	
	 try {

         String quary = "SELECT s_doc_no FROM ENGINEER.DOCUMENT WHERE rownum <= 5";
         
         conn = DBConnection.getConnection(); // DBConnection 클래스의 연결상태를 conn에 저장
         pstm = conn.prepareStatement(quary); // DB에 quary 전송 
         rs = pstm.executeQuery(); // quary 결과 rs에 저장
         
         System.out.println("S_DOC_NO    DESCRIPTION");
         System.out.println("=======================");
         
         while(rs.next()){ // rs에서 다음 데이터가 존재한다면 반복 실행
             String s_dwg_no = rs.getString(1);
             String description = rs.getString(1);
              
             String result = s_dwg_no+" "+description;
             System.out.println(result);
         }
         
         // finally문에서도 DB연결을 종료해 줄 것이지만 TRY문 내에서도 닫아주는 게 좋음
         rs.close();
         pstm.close();
         conn.close();
         
     } catch (SQLException sqle) { // Quary 오류
     
         System.out.println("QUARY ERROR");
         sqle.printStackTrace();
         
     }finally{ // DB 연결 종료
         try{
         
             if ( rs != null ){rs.close();}   
             if ( pstm != null ){pstm.close();}   
             if ( conn != null ){conn.close(); }
             
         }catch(Exception e){
         
             throw new RuntimeException(e.getMessage());
             
         }
         
     }
 }

}

