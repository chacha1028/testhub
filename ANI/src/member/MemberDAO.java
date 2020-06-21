package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		
		try {
			String dbURL="jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbID="system";
			String dbPassword="oracle";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String memberID, String memberPassword) {
		String SQL = "SELECT memberPassword FROM MEMBER WHERE memberID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).contentEquals(memberPassword)) {
					return 1; //로그인 성공
				}else
					return 0; //비번 불일치
			}return -1; //아이디 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(Member member) {
		String SQL = "INSERT INTO MEMBER VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getMemberID());
			pstmt.setString(2, member.getMemberPassword());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberGender());
			pstmt.setString(5, member.getMemberEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}return -1;
	}
	
	
	
	
}
