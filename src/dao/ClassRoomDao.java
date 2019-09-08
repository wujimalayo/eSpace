package dao;

import java.util.List;

import Class.ClassRoom;

public interface ClassRoomDao {
	//教室表查询
	List<ClassRoom> selectRoomList(int week,int lesson);
}
