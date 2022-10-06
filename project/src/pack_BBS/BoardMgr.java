package pack_BBS;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import pack_DBCP.DBConnectionMgr;

public class BoardMgr {
	
	private DBConnectionMgr objPool;
	
	Connection 				objConn 		= 		null;
	PreparedStatement 	objPstmt 		= 		null;
	Statement				 	objStmt 		= 		null;
	ResultSet 					objRS 			= 		null;
	String saveFolder = "D:/lhj/slisp/JSP/Project/WebContent/fileUpload";

	public BoardMgr() {
		try {
			objPool = DBConnectionMgr.getInstance();
			
		} catch (Exception e) {
			e.getMessage();
		}

	}
	
	public void mtd_Test() {
		try {
			objConn = 	objPool.getConnection();
		
		} catch (Exception e) {
			System.out.println(e.getMessage());	
		}
	}
	

	public int bbsBoard(HttpServletRequest req) {

		String saveFolder = "D:/lhj/slisp/JSP/Project/WebContent/fileUpload";
		
		int maxSize = 50*1024*1024;
		String fileEnc = "UTF-8";     
		MultipartRequest  objMulti = null;
		
		String txtType="";
		String uName="";
		String subject = "";
		String content = "";
		String oriFileName = "";
		String systemFileName = "";
		String fileName="";
		long fileSize = 0;
		int rtnCnt = 0;
		
		// 파일 업로드 시작
		try {
			
			objMulti = new MultipartRequest(req,saveFolder,maxSize,	fileEnc,new DefaultFileRenamePolicy());
			
			txtType = objMulti.getParameter("txtType");
			uName = objMulti.getParameter("uName");
			subject = objMulti.getParameter("subject");
			content = objMulti.getParameter("content");
			fileName = objMulti.getParameter("fileName");
//			System.out.print(fileName);
			
			if(objMulti.getParameter("fileName") != null){
				oriFileName = objMulti.getOriginalFileName("fileName");
				systemFileName = objMulti.getFilesystemName("fileName");
				fileSize = objMulti.getFile("fileName").length();		
			}else {
							
			}
			

		
		} catch (IOException e) {
			System.out.println(e.getMessage());	
		} 
		// 파일 업로드 끝

		// DB 접속 데이터 전송 및 반환 시작 
		try {
			
			objConn = 	objPool.getConnection();
			
			String sql = "insert into tblBoard(txtType,uName,subject,content,oriFileName,systemFileName,fileSize,regTM) values";
			          sql +=" (?,?,?,?,?,?,?,now())";
			
			objPstmt= objConn.prepareStatement(sql);
			objPstmt.setString(1, txtType);
			objPstmt.setString(2, uName);
			objPstmt.setString(3, subject);
			objPstmt.setString(4, content);
			objPstmt.setString(5, oriFileName);
			objPstmt.setString(6, systemFileName);
			objPstmt.setLong(7, fileSize);		
					
			rtnCnt = objPstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());		
		} finally {
			objPool.freeConnection(objConn);
		}	
		return rtnCnt;	
	}	
	// DB 접속 데이터 전송 및 반환 끝

	
	// 게시판 목록 시작
	public Vector<BoardBean> BoardList(){
		
		Vector<BoardBean> vList = new Vector<>();
		String sql = null;
		
		try {
					objConn = objPool.getConnection();
					objStmt = objConn.createStatement();			
					String sql2 = "select txtType, subject, uName, regTM, readCnt, num";
							  sql2 += " from tblBoard order by num desc";				
					objRS = objStmt.executeQuery(sql2);		
					
					while (objRS.next()) {
						BoardBean bean = new BoardBean();
						bean.setTxtType(objRS.getString("txtType"));
						bean.setSubject(objRS.getString("subject"));
						bean.setuName(objRS.getString("uName"));						
						bean.setRegTM(objRS.getString("regTM"));
						bean.setReadCnt(objRS.getInt("readCnt"));
						bean.setNum(objRS.getInt("num"));
						vList.add(bean);
					}	
					
						
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return vList;
	}
	// 게시판 목록 끝
	
	// 상세보기 시작 
	public Vector<BoardBean> mtd_read(int num) {
		
		Vector<BoardBean> vList = new Vector<>();
		
		try {
			
			
			objConn = objPool.getConnection();
						
			String sql3 = "select * from tblBoard where num = ?";				
			objPstmt = objConn.prepareStatement(sql3);
			objPstmt.setInt(1, num);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				BoardBean bean = new BoardBean();
				bean.setTxtType(objRS.getString("txtType"));
				bean.setSubject(objRS.getString("subject"));
				bean.setuName(objRS.getString("uName"));						
				bean.setRegTM(objRS.getString("regTM"));
				bean.setContent(objRS.getString("content"));
				bean.setSystemFileName(objRS.getString("systemFileName"));
				vList.add(bean);
			}	
			
			
		
			
			
				
} catch (Exception e) {
	System.out.println("Exception : " + e.getMessage());
} finally {
	objPool.freeConnection(objConn, objPstmt);
}

return vList;
}
	// 상세보기 끝  
	
	// 게시글 삭제 시작 
	public int deleteBoard(int num) {

		int exeCnt = 0; 

		try {
			objConn = objPool.getConnection();
			
			
			//////////// 게시글 삭제 시작 ///////////////
			String sql4 = "delete from tblBoard where num=?";
			objPstmt = objConn.prepareStatement(sql4);
			objPstmt.setInt(1, num);
			exeCnt = objPstmt.executeUpdate();
			//////////// 게시글 삭제 끝 ///////////////

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return exeCnt;
	}
	// 게시글 삭제 끝 
	
	
	// 게시글 수정 시작 
	public int updateBoard(int num) {
		
		String sql5 = null;
		int exeCnt = 0;
		try {
			BoardBean bean = new BoardBean();
			objConn = objPool.getConnection();
			
			sql5 = "update tblBoard set subject=?, content=? where num=?";
			objPstmt = objConn.prepareStatement(sql5);
			objPstmt.setString(1, bean.getSubject());
			objPstmt.setString(2, bean.getContent());
			objPstmt.setInt(3, bean.getNum());
			exeCnt = objPstmt.executeUpdate();
			// exeCnt : DB에서 실제 적용된 데이터(=row, 로우)의 개수 저장됨

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}

		return exeCnt;
	}
	// 게시글 수정 끝
	}
	


	
	
	
	

