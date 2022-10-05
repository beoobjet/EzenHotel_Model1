package pack_Join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import pack_DBCP.DBConnectionMgr;

public class UserListMgr {

	Connection objConn = null;
	Statement objStmt = null;
	ResultSet objRS = null;
	PreparedStatement objPstmt = null;
	DBConnectionMgr objPool = null;

	public boolean mtd_UserPwEdit(String upw, String uid) {

		boolean isOK = true;

		try {

			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();

			String sql = "update memberList";
			sql += " set upw=? where uid=?";
			System.out.print(sql);
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, upw);
			objPstmt.setString(2, uid);

			int rowCnt = objPstmt.executeUpdate();

			if (rowCnt == 1) {
				isOK = true;
			} else {
				isOK = false;
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return isOK;
	}
	
	public boolean mtd_UserInfoEdit(UserList uList, String uid) {

		boolean isOK = true;

		try {

			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();

			String sql = "update memberList";
			sql += " set email=?, name=?, gender=?, country=?, ";
			sql += "bDate=?, contact=?, zipCode=?, address=?, dAddress=?";
			sql += " where uid=?";
			System.out.print(sql);
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uList.getEmail());
			objPstmt.setString(2, uList.getName());
			objPstmt.setString(3, uList.getGender());
			objPstmt.setString(4, uList.getCountry());
			objPstmt.setString(5, uList.getbDate());
			objPstmt.setString(6, uList.getContact());
			objPstmt.setString(7, uList.getZipCode());
			objPstmt.setString(8, uList.getAddress());
			objPstmt.setString(9, uList.getdAddress());
			objPstmt.setString(10, uid);

			int rowCnt = objPstmt.executeUpdate();

			if (rowCnt == 1) {
				isOK = true;
			} else {
				isOK = false;
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return isOK;
	}

	public UserList mtd_Retrieve(String uid) {

		UserList uList = new UserList();

		try {

			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();

			String sql = "select * from memberList";
			sql += " where uid=?";

			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				uList.setName(objRS.getString("name"));
				uList.setUpw(objRS.getString("upw"));
				uList.setGender(objRS.getString("gender"));
				uList.setCountry(objRS.getString("country"));
				uList.setbDate(objRS.getString("bDate"));
				uList.setContact(objRS.getString("contact"));
				uList.setEmail(objRS.getString("email"));
				uList.setZipCode(objRS.getString("zipCode"));
				uList.setAddress(objRS.getString("address"));
				uList.setdAddress(objRS.getString("dAddress"));
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return uList;
	}

	public boolean mtd_Login(String uid, String upw) {

		boolean res = false;

		try {

			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();

			String sql = "select count(*) from memberList where uid = ? and upw = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			objPstmt.setString(2, upw);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {

				int rnt = objRS.getInt(1);
				if (rnt == 1)
					res = true;

			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return res;
	}

	public boolean mtd_IdChk(String uid) {

		boolean res = false;

		try {

			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();

			String sql = "select count(*) from memberList where uid = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uid);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {

				int recordCnt = objRS.getInt(1);
				if (recordCnt == 1)
					res = true;
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return res;
	}

	public boolean mtd_Join(UserList uList) {

		boolean isOK = true;

		try {

			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();

			String sql = "insert into memberList (";
			sql += "uid, upw, email, name, gender, country, ";
			sql += "bDate, contact, zipCode, address, dAddress, joinTM) values (";
			sql += "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()";
			sql += ")";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uList.getUid());
			objPstmt.setString(2, uList.getUpw());
			objPstmt.setString(3, uList.getEmail());
			objPstmt.setString(4, uList.getName());
			objPstmt.setString(5, uList.getGender());
			objPstmt.setString(6, uList.getCountry());
			objPstmt.setString(7, uList.getbDate());
			objPstmt.setString(8, uList.getContact());
			objPstmt.setString(9, uList.getZipCode());
			objPstmt.setString(10, uList.getAddress());
			objPstmt.setString(11, uList.getdAddress());

			int rowCnt = objPstmt.executeUpdate();

			if (rowCnt == 1) {
				isOK = true;
			} else {
				isOK = false;
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}

		return isOK;

	}

}
