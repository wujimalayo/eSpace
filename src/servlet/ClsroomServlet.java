package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Class.ClassRoom;
import impl.ClassRoomDaoImpl;

public class ClsroomServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置响应编码格式
		response.setCharacterEncoding("utf-8");
		// 获取当前星期参数、传至前端
		int week_no = Integer.parseInt(request.getParameter("week_no"));
		request.setAttribute("week_no", week_no);
		//获取周次参数
		int week=Integer.parseInt(request.getParameter("week"));
		//获取节次参数
		int lesson=Integer.parseInt(request.getParameter("lesson"));
		//获取状态参数
		String status=new String(request.getParameter("status").getBytes("iso-8859-1"),"utf-8");
		// 
		response.setContentType("application/json,character=utf-8");
		// 初始化Dao实现类
		ClassRoomDaoImpl dao = new ClassRoomDaoImpl();
			// 调用Dao查询商品信息列表数据
		List<ClassRoom> RoomList = dao.selectRoomList(week,lesson,status);
		JsonObject obj=new JsonObject();
		obj.addProperty("week", week);
		obj.addProperty("lesson", lesson);
		// 判断集合中的数据
		if (null == RoomList) {
			obj.addProperty("resultCode", 0);
			obj.addProperty("message", "获取失败");
		}else {
			//创建一个JsonArray数组（用于Json数据存放）
			JsonArray array=new JsonArray();
			//遍历查询出来的信息列表 然后放到JsonObject中
			for(ClassRoom room : RoomList) {
				JsonObject dataObject=new JsonObject();
				dataObject.addProperty("clsname",room.getClsname());
				dataObject.addProperty("building",room.getBuilding());
				dataObject.addProperty("floor",room.getFloor());
				dataObject.addProperty("status",room.getStatus());
				//将dataObject放入JsonArray数组中
				array.add(dataObject);
			}obj.addProperty("resultCode", 1);//1代表获取数据成功
			obj.addProperty("message", "获取成功!");
			obj.add("data", array);
		}//响应数据
		response.getWriter().write(obj.toString());
	}
}
