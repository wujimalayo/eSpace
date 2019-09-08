package impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Class.Apply_Info;
import Class.ClassRoom;
import Class.Week_tab;
import util.JDBCUtil;
import util.DbUtil;

public class ClassRoomDaoImpl {
	public List<ClassRoom> selectRoomList(int week, int lesson,String status) {
		// 编写sql
		String sql = "select * from clsroom_tab where week_day=" + week + " and lesson_no=" + lesson+
				" and status="+status;
		List<ClassRoom> RoomList = new ArrayList<ClassRoom>();
		// 创建教室信息对象
		ClassRoom clsroom = null;
		ResultSet rs = null;
		try {
			rs = JDBCUtil.query(sql);
			while (rs.next()) {
				clsroom = new ClassRoom();
				clsroom.setClsname(rs.getString("cls_name"));
				clsroom.setBuilding(rs.getString("building"));
				clsroom.setFloor(rs.getInt("floor"));
				clsroom.setStatus(rs.getString("status"));
				// 放入集合
				RoomList.add(clsroom);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConn(null, rs, null);
		}
		return RoomList;
	}

	public int bookRoom(int week, int lesson, String clsroom) {
		// 编写更新sql语句
		String sql = "update clsroom_tab set status='课' where week_day=" + week + " and lesson_no=" + lesson
				+ " and cls_name='" + clsroom + "'";
		// 创建连接、预编译对象、状态变量
		Connection conn = null;
		// 创建返回状态参数
		int status=0;
		try {
			conn = DbUtil.getConnection();
			status=JDBCUtil.insert(sql, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public List<ClassRoom> indexRoomList(int week,int floor) {
		// 编写sql
		String sql = "select * from clsroom_tab where week_day=" + week + 
				" and lesson_no=2 and floor="+floor+" and building='致远楼'";
		List<ClassRoom> indexRoomList = new ArrayList<ClassRoom>();
		// 创建教室信息对象
		ClassRoom clsroom = null;
		ResultSet rs = null;
		try {
			rs = JDBCUtil.query(sql);
			while (rs.next()) {
				clsroom = new ClassRoom();
				clsroom.setClsname(rs.getString("cls_name"));
				clsroom.setFloor(rs.getInt("floor"));
				clsroom.setStatus(rs.getString("status"));
				// 放入集合
				indexRoomList.add(clsroom);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConn(null, rs, null);
		}
		return indexRoomList;
	}
	public List<ClassRoom> mdlRoomList(int week,int floor) {
		// 编写sql
		String sql = "select * from clsroom_tab where week_day=" + week + 
				" and lesson_no=2 and floor="+floor+" and building='明德楼'";
		List<ClassRoom> mdlRoomList = new ArrayList<ClassRoom>();
		// 创建教室信息对象
		ClassRoom clsroom = null;
		ResultSet rs = null;
		try {
			rs = JDBCUtil.query(sql);
			while (rs.next()) {
				clsroom = new ClassRoom();
				clsroom.setClsname(rs.getString("cls_name"));
				clsroom.setFloor(rs.getInt("floor"));
				clsroom.setStatus(rs.getString("status"));
				// 放入集合
				mdlRoomList.add(clsroom);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConn(null, rs, null);
		}
		return mdlRoomList;
	}
	public int insertApply(int week_no, int lesson_no, String id, String clsroom, String reason) {
		// sql
		//
		String sql = "insert into apply_tab(app_week,app_lesson,id,app_clsroom,app_reason) values(" + week_no + ","
				+ lesson_no + ",'" + id + "','" + clsroom + "','" + reason + "')";
		// 创建连接、预编译对象、状态变量
		Connection conn = null;
		int status = 0;
		try {
			conn = DbUtil.getConnection();
			status = JDBCUtil.insert(sql, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public List<Week_tab> week_tabList(String clsroom) {
		// 编写sql
		String sql ="SELECT lesson_no,\r\n" + 
				"	(SELECT `status` from clsroom_tab a where a.lesson_no=b.lesson_no and week_day=1 and cls_name='"+clsroom+"') as Mon,\r\n" + 
				"	(SELECT `status` from clsroom_tab a where a.lesson_no=b.lesson_no and week_day=2 and cls_name='"+clsroom+"') as Thues,\r\n" + 
				"	(SELECT `status` from clsroom_tab a where a.lesson_no=b.lesson_no and week_day=3 and cls_name='"+clsroom+"') as Wed,\r\n" + 
				"	(SELECT `status` from clsroom_tab a where a.lesson_no=b.lesson_no and week_day=4 and cls_name='"+clsroom+"') as Thur,\r\n" + 
				"	(SELECT `status` from clsroom_tab a where a.lesson_no=b.lesson_no and week_day=5 and cls_name='"+clsroom+"') as Fri,\r\n" + 
				"	(SELECT `status` from clsroom_tab a where a.lesson_no=b.lesson_no and week_day=6 and cls_name='"+clsroom+"') as Sat,\r\n" + 
				"	(SELECT `status` from clsroom_tab a where a.lesson_no=b.lesson_no and week_day=7 and cls_name='"+clsroom+"') as Sun\r\n" + 
				"from clsroom_tab b\r\n" + 
				"where cls_name='"+clsroom+"'\r\n" + 
				"GROUP BY lesson_no";
		List<Week_tab> week_tabList = new ArrayList<Week_tab>();
		// 创建教室信息对象
		Week_tab week_tab= null;
		ResultSet rs = null;
		try {
			rs = JDBCUtil.query(sql);
			while (rs.next()) {
				week_tab = new Week_tab();
				week_tab.setLesson_no(rs.getInt("lesson_no"));
				week_tab.setMon(rs.getString("Mon"));
				week_tab.setTues(rs.getString("Thues"));
				week_tab.setWed(rs.getString("Wed"));
				week_tab.setThur(rs.getString("Thur"));
				week_tab.setFri(rs.getString("Fri"));
				week_tab.setSat(rs.getString("Sat"));
				week_tab.setSun(rs.getString("Sun"));
				// 放入集合
				week_tabList.add(week_tab);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConn(null, rs, null);
		}
		return week_tabList;
	}
	public List<Apply_Info> app_tabList(){
		//编写sql语句
		String sql="select apply_no,app_week,app_lesson,id,app_clsroom,app_date,app_remark from apply_tab";
		List<Apply_Info> Apply_tabList = new ArrayList<Apply_Info>();
		//创建申请信息表对象
		Apply_Info app_tab=null;
		ResultSet rs = null;
		try {
			rs = JDBCUtil.query(sql);
			while (rs.next()) {
				app_tab=new Apply_Info();
				app_tab.setNo(rs.getInt("apply_no"));
				app_tab.setWeek(rs.getInt("app_week"));
				app_tab.setLesson(rs.getInt("app_lesson"));
				app_tab.setId(rs.getString("id"));
				app_tab.setClsname(rs.getString("app_clsroom"));
				app_tab.setApp_time(rs.getString("app_date"));
				app_tab.setRemark(rs.getString("app_remark"));
				Apply_tabList.add(app_tab);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeConn(null, rs, null);
		}
		return Apply_tabList;
	}
	public String app_reason(String app_date) {
		//sql语句
		String sql="SELECT app_reason from apply_tab where app_date='"+app_date+"'";
		String reason=null;
		ResultSet rs=null;
		try {
			rs=JDBCUtil.query(sql);
			while(rs.next()) {
				reason=rs.getString("app_reason");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeConn(null, rs, null);
		}
		return reason;
	}

	public int approve(int app_no, int key) {
		//判断操作
		String sql=null;
		if(key==1) {
			sql="update apply_tab set app_remark='已批准' where apply_no=" + app_no;
		}else {
			sql="update apply_tab set app_remark='未批准' where apply_no=" + app_no;
		}
		// 创建连接、预编译对象、状态变量
		Connection conn = null;
		// 创建返回状态参数
		int status = 0;
		try {
			conn = DbUtil.getConnection();
			status = JDBCUtil.insert(sql, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public int echarts(int week_no, int lesson_no) {
		//判断操作
		String sql=null;
		sql="select count(0) where week_no ="+week_no+" and where lesson_no ="+lesson_no+" and where status='空'";
		// 创建连接、预编译对象、状态变量
		Connection conn = null;
		// 创建返回状态参数
		int status = 0;
		try {
			conn = DbUtil.getConnection();
			status = JDBCUtil.insert(sql, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}