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

public class mdlServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置响应编码格式
		response.setCharacterEncoding("utf-8");
		// 获取楼层参数
		int floor=Integer.parseInt(request.getParameter("floor_no"));
		// 获取周次参数
		int week_no = Integer.parseInt(request.getParameter("week_no"));
		//
		response.setContentType("application/json,character=utf-8");
		// 初始化Dao实现类
		ClassRoomDaoImpl dao = new ClassRoomDaoImpl();
		// 调用Dao查询商品信息列表数据
		List<ClassRoom> indexRoomlist = dao.mdlRoomList(week_no,floor);
		JsonObject obj=new JsonObject();
		// 判断集合中的数据
		if (null == indexRoomlist) {
			obj.addProperty("resultCode", 0);
			obj.addProperty("message", "获取失败");
		}else {
			//创建一个JsonArray数组（用于Json数据存放）
			JsonArray array=new JsonArray();
			//遍历查询出来的信息列表 然后放到JsonObject中
			for(ClassRoom room : indexRoomlist) {
				JsonObject dataObject=new JsonObject();
				dataObject.addProperty("clsname",room.getClsname());
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