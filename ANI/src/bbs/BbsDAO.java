package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class BbsDAO {

	
	
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		
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
	
	public Date getDate() {
		String SQL = "SELECT SYSDATE from dual";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getDate(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}return null;
	}
	
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}return -1;
	}
	
	public int write(String bbsAni, String bbsArea,String bbsTitle, String memberName, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsAni);
			pstmt.setString(3, bbsArea);
			pstmt.setString(4, bbsTitle);
			pstmt.setString(5, memberName);
			pstmt.setDate(6, (java.sql.Date) getDate());
			pstmt.setString(7, bbsContent);
			pstmt.setInt(8, 1);
		
			return pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}return -1;
	}
	
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "SELECT * FROM (SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC) WHERE ROWNUM <= 10"; 
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsAni(rs.getString(2));
				bbs.setBbsArea(rs.getString(3));
				bbs.setBbsTitle(rs.getString(4));
				bbs.setMemberName(rs.getString(5));
				bbs.setBbsDate(rs.getString(6));
				bbs.setBbsContent(rs.getString(7));
				bbs.setBbsAvailable(rs.getInt(8));
				list.add(bbs);
			}
		}catch(Exception e){
			e.printStackTrace();
		}return list;
	}
	
	
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM (SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC) WHERE ROWNUM <= 10"; 
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
		}catch(Exception e) {
			e.printStackTrace();
		}return false;
	}
	
	public Bbs getBbs(int bbsID) {
		
		
		String SQL = "SELECT * FROM BBS WHERE bbsID=?"; 
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
				if(rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsAni(rs.getString(2));
					bbs.setBbsArea(rs.getString(3));
					bbs.setBbsTitle(rs.getString(4));
					bbs.setMemberName(rs.getString(5));
					bbs.setBbsDate(rs.getString(6));
					bbs.setBbsContent(rs.getString(7));
					bbs.setBbsAvailable(rs.getInt(8));
					return bbs;
				}
		}catch(Exception e) {
			e.printStackTrace();
		}return null;
	}
	
	public int update(int bbsID, String bbsAni, String bbsArea,String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsAni=?, bbsArea=?, bbsTitle=?, bbsContent=? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsAni);
			pstmt.setString(2, bbsArea);
			pstmt.setString(3, bbsTitle);
			pstmt.setString(4, bbsContent);
			pstmt.setInt(5, bbsID);
			
		
			return pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}return -1;
	}
	
	public int delete(int bbsID) {
		String SQL = "UPDATE BBS SET bbsAvailable=0 WHERE bbsID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}return -1;
		
	}
	
	
	
	
}
