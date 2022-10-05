package pack_Reserve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class ReserveMgr {
	

	private DBConnectionMgr 	objPool = null;
	private Connection 				objConn = null;
	private PreparedStatement 	objPstmt = null;
	private Statement 				objStmt = null;
	private ResultSet 				objRS = null;
	
	public ReserveMgr() {
		try {
			objPool = DBConnectionMgr.getInstance();			
			//System.out.println("ReserveMgr DB 접속 OK");
		} catch(Exception e){
			
		}
	}
	
	// reserve.jsp 예약 현황의 호텔 리스트 조회
	public List<ReserveBean> mtd_hotelList(){
		
		List<ReserveBean> objList = null;
		ReserveBean objResvBean = null;
		
		try {
			objConn = objPool.getConnection();
			objStmt = objConn.createStatement();
			
			String sql = "select hNum, hName, hCode, hType, hAddr from lodgeInfo order by hCode asc;";
			
			objRS = objStmt.executeQuery(sql);
			
			objList = new Vector<ReserveBean>();
			while(objRS.next()) {
				objResvBean = new ReserveBean();
				
				objResvBean.sethNum(objRS.getInt("hNum"));
				objResvBean.sethName(objRS.getString("hName"));
				objResvBean.sethCode(objRS.getString("hCode"));
				objResvBean.sethType(objRS.getString("hType"));
				objResvBean.sethAddr(objRS.getString("hAddr"));
				
				objList.add(objResvBean);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objStmt);
		}
		
		return objList;
		
	}
	
	// reserve.jsp 예약 현황에서 선택한 호텔의 방 리스트 조회
	public List<ReserveRoomBean> mtd_selRoomList(String hCode){
		List<ReserveRoomBean> objList = null;
		ReserveRoomBean objResvRoomBean = null;
		
		try {
			objConn = objPool.getConnection();
			objStmt = objConn.createStatement();
			
			String sql = "select rNum, hCode, rName, rCode, rPeople, rCnt, rPrice from roomInfo where hCode='"+hCode+"';";
			
			objRS = objStmt.executeQuery(sql);
			
			objList = new Vector<ReserveRoomBean>();
			while(objRS.next()) {
				objResvRoomBean = new ReserveRoomBean();
				
				objResvRoomBean.setrNum(objRS.getInt("rNum"));
				objResvRoomBean.sethCode(objRS.getString("hCode"));
				objResvRoomBean.setrName(objRS.getString("rName"));
				objResvRoomBean.setrCode(objRS.getString("rCode"));
				objResvRoomBean.setrPeople(objRS.getInt("rPeople"));
				objResvRoomBean.setrCnt(objRS.getInt("rCnt"));
				objResvRoomBean.setrPrice(objRS.getInt("rPrice"));
				
				objList.add(objResvRoomBean);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objStmt);
		}
		
		return objList;
		
	}

	// reserve.jsp 예약 현황 예약 가능한 객실 갯수 확인 -> 총 예약 가능 객실 수 확인
	public int mtd_roomCntInfo(String rCode){
		String res = "";
		int roomCnt = 0;
		
		try {
			objConn = objPool.getConnection();
			objStmt = objConn.createStatement();
			
			String roomInfoSql = "select rCnt from roominfo where rCode like '"+rCode+"';";
			
			objRS = objStmt.executeQuery(roomInfoSql);
			
			
			while(objRS.next()) {
				roomCnt = objRS.getInt(1);
			}
				
			//System.out.println("roomCnt : " + roomCnt);
			

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objStmt);
		}
		
		return roomCnt;
		
	}
	
	// reserve.jsp 예약 현황 예약 가능한 객실 갯수 확인 -> 객실 별 예약 건 확인
	public List<ReserveRoomInfo> mtd_resvCntInfo(String rCode, String resvDate){
		List<ReserveRoomInfo> objResvInfoList = null;
		ReserveRoomInfo objResvInfo = null;
		
		try {
			objConn = objPool.getConnection();
			objStmt = objConn.createStatement();
			
			String reserveInfoSql = "select num, hCode, rCode, uId, resev_start, resev_end, resev_people, resev_method, resev_date "
					+ "from reserveInfo "
					+ "where rCode like '"+rCode+"' and resev_start like '"+resvDate+"%';";
			
			objRS = objStmt.executeQuery(reserveInfoSql);
			
			//System.out.println(reserveInfoSql+"===================");
			
			objResvInfoList = new Vector<ReserveRoomInfo>();
			while(objRS.next()) {
				objResvInfo = new ReserveRoomInfo();
				
				objResvInfo.setNum(objRS.getInt("num"));
				objResvInfo.sethCode(objRS.getString("hCode")); 
				objResvInfo.setrCode(objRS.getString("rCode")); 
				objResvInfo.setuId(objRS.getString("uId")); 
				objResvInfo.setResev_start(objRS.getString("resev_start")); 
				objResvInfo.setResev_end(objRS.getString("resev_end")); 
				objResvInfo.setResev_people(objRS.getInt("resev_people"));
				objResvInfo.setResev_method(objRS.getInt("resev_method"));
				objResvInfo.setResev_date(objRS.getString("resev_date")); 
				
				objResvInfoList.add(objResvInfo);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objStmt);
		}
		
		return objResvInfoList;
		
	}
	
	public boolean insertResvInfo(String hCode, String rCode, String uId, String resev_start, int dayOfNights, int resev_people, int resev_method) {
		
		boolean resvFlag = false;
		String resev_end = "";
		
		try {
			objConn = objPool.getConnection();
			
			String sql = "insert into reserveInfo(hCode, rCode, uId, resev_start, resev_end, resev_people, resev_method) "; 
					sql += "values(?, ?, ?, ?, DATE_ADD(?, INTERVAL ? DAY), ?, ?)";
					
			objPstmt = objConn.prepareStatement(sql);
			
			objPstmt.setString(1, hCode);
			objPstmt.setString(2, rCode);
			objPstmt.setString(3, uId);
			objPstmt.setString(4, resev_start);
			objPstmt.setString(5, resev_start);
			objPstmt.setInt(6, dayOfNights);
			objPstmt.setInt(7, resev_people);
			objPstmt.setInt(8, resev_method);
			
			objPstmt.executeUpdate();
			/*
			objPstmt.setString(1, rBean.gethCode());
			objPstmt.setString(2, rBean.getrCode());
			objPstmt.setString(3, rBean.getuId());
			objPstmt.setString(4, rBean.getResev_start());
			objPstmt.setString(4, rBean.getResev_start());
			objPstmt.setString(5, dayOfNights); 
			objPstmt.setInt(6, rBean.getResev_people());
			objPstmt.setInt(7, rBean.getResev_method());
			*/
			
			System.out.println("sql : "+sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}
		
		return resvFlag;
	}
	

}
