package pack_Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class MemberMgr {
	
	Connection				objConn 		=		null;
	Statement					objStmt			=		null;	
	ResultSet					objRS			=		null;  	
	PreparedStatement 	objPstmt 		=		null; 
	DBConnectionMgr 		objPool 		= 		null;

	public static void main(String[] args) {
		new MemberMgr( );
	}
			
	
	
	/* 아이디 중복 검사 시작(/member/idCheck.jsp) */
	public boolean checkId(String id) {
				
		boolean res = false;   // 임시 초기화, ID 사용 가능여부를 판별하는 변수
		                                    // true면 입력한 ID는 사용불가
		                                    // false면 입력한 ID는 사용가능		
		try {
						
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();		
			
			String sql = "select count(*) from member where uId = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, id);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				//System.out.println("DB의 테이블에 저장된 입력한 ID의 갯수 : " + objRS.getInt(1));
				// objRS.getInt(1) 의 반환값이 1이라면 => 사용중인 아이디를 의미함
				// res값에는 true 저장해야 함.
				// objRS.getInt(1) 의 반환값이 0이라면 => 사용가능한 아이디를 의미함
				// res값에는 false 저장해야 함, 그러나 이미 false로 초기화되어 있으므로
				// 별도의 작업이 필요없음
				int recordCnt = objRS.getInt(1);
				if (recordCnt == 1) res = true;   
				// DB에서 반환된 데이터가 1이라면 입력한 ID로 조회한 데이터가 
				// 있다는 뜻이므로 다시 말하면 사용할 수 없는 아이디를 의미한다.
				
			}
						
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return res;
	}	
	/* 아이디 중복 검사 끝(/member/idCheck.jsp) */
	
	
	
	/* 우편번호 찾기 시작(/member/zipCheck.jsp) */
	public List<ZipcodeBean> zipcodeRead(String area3) {
		
		List<ZipcodeBean> objList = new Vector<>(); 
		
		try {
			
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();		
			
						
			String sql = "select zipcode, area1, area2, area3, area4 ";
			         sql += " from tblZipcode where area3 like ?";

			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, "%"+ area3 +"%");
			objRS = objPstmt.executeQuery();
			
			while (objRS.next()) {
				ZipcodeBean zipBean = new ZipcodeBean();
				zipBean.setZipcode(objRS.getString(1));
				zipBean.setArea1(objRS.getString(2));
				zipBean.setArea2(objRS.getString(3));
				zipBean.setArea3(objRS.getString(4));
				zipBean.setArea4(objRS.getString(5));
				
				objList.add(zipBean);
			}
			
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		} 
		
		return objList;
		
	}
	
	/* 우편번호 찾기 끝(/member/zipCheck.jsp) */
	
	

	/* 회원가입 시작 (/member/memberProc.jsp) */
	public boolean insertMember(MemberBean bean) {
		
		boolean flag = false;
		
		
		try {
			
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();		
			
			String sql = "insert into member (";
			sql += "uId, uPw, uName, uEmail, gender, uBirthday, ";
			sql += "uZipcode, uAddr, uHobby, uJob, joinTM) values (";
			sql += "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()";
			sql += ")";
			objPstmt = objConn.prepareStatement(sql);			
			objPstmt.setString(1, bean.getuId());			
			objPstmt.setString(2, bean.getuPw());			
			objPstmt.setString(3, bean.getuName());			
			objPstmt.setString(4, bean.getuEmail());			
			objPstmt.setString(5, bean.getGender());			
			objPstmt.setString(6, bean.getuBirthday());			
			objPstmt.setString(7, bean.getuZipcode());			
			objPstmt.setString(8, bean.getuAddr());			
			String[] hobby = bean.getuHobby();
			String[] hobbyName = {"인터넷", "여행", "게임", "영화", "운동"};
			char[] hobbyCode = {'0', '0', '0', '0', '0'};
			for (int i=0; i<hobby.length; i++) {
				for(int j=0; j<hobbyName.length; j++) {
					if (hobby[i].equals(hobbyName[j])) {
						hobbyCode[j] = '1';
					}
				}
			}
			objPstmt.setString(9, new String(hobbyCode));			
			objPstmt.setString(10, bean.getuJob());
			int rowCnt = objPstmt.executeUpdate();
			
			if (rowCnt == 1) flag = true;
						
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}
		
		
		return flag;
	}
	/* 회원가입 끝 (/member/memberProc.jsp) */
	
	

	/* 로그인 처리 시작 (/member/loginProc.jsp) */
	public boolean loginMember(String id, String pw) {
		
		
		boolean loginChkTF = false;
		try {
			
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();		
			
			String sql = "select count(*) from member where uId = ? and uPw = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, id);
			objPstmt.setString(2, pw);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				
				int recordCnt = objRS.getInt(1);
				if (recordCnt == 1) loginChkTF = true;   
				
			}
						
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return loginChkTF;
		
	}
	/* 로그인 처리 끝 (/member/loginProc.jsp) */
	

	
	/* 회원정보 수정 시작 (/member/memberModProc.jsp) */
	
	
	/* 회원정보 수정 끝 (/member/memberModProc.jsp) */
	
	

	
	/* 회원탈퇴 시작 (/member/memberQuitProc.jsp) */
	
	
	/* 회원탈퇴 끝 (/member/memberQuitProc.jsp) */
	
	

	
	
	/* 로그인 사용자 이름 반환(/bbs/write.jsp) 시작 */

	public String getMemberName(String uId) {
	
		String uName = "";		
		String sql = null;
		
		try {			

			objPool = DBConnectionMgr.getInstance();			
			objConn = objPool.getConnection();
			sql = "select uName from member where uId=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
		
			objRS = objPstmt.executeQuery();
			if (objRS.next()) {
				uName = objRS.getNString(1);				
			}
		
		} catch (Exception e) {	
			System.out.println("Exception 이슈 : " + e.getMessage());	
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}
		
		
		return uName;
	}
	
	/* 로그인 사용자 이름 반환(/bbs/write.jsp) 끝 */
	
	
	
	
	

}







