package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Class.Week_tab;
import impl.ClassRoomDaoImpl;

public class detailServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置响应编码格式
		response.setCharacterEncoding("utf-8");
		//获取教室参数
		String clsname =new String(request.getParameter("clsname").getBytes("iso-8859-1"),"utf-8");
		// 将教室传至前端
		request.setAttribute("clsname", clsname);
		//
		response.setContentType("application/json,character=utf-8");
		// 初始化Dao实现类
		ClassRoomDaoImpl dao = new ClassRoomDaoImpl();
			// 调用Dao查询教室信息列表数据
		List<Week_tab> week_tabList = dao.week_tabList(clsname);
		JsonObject obj=new JsonObject();
		obj.addProperty("clsname", clsname);
		// 判断集合中的数据
		if (null == week_tabList) {
			obj.addProperty("resultCode", 0);
			obj.addProperty("message", "获取失败");
		}
		else {
			//创建一个JsonArray数组（用于Json数据存放）
			JsonArray array=new JsonArray();
			//遍历查询出来的信息列表 然后放到JsonObject中
			for (Week_tab week : week_tabList) {
				JsonObject dataObject=new JsonObject();
				dataObject.addProperty("Lesson_no",week.getLesson_no());
				dataObject.addProperty("Mon",week.getMon());
				dataObject.addProperty("Tues",week.getTues());
				dataObject.addProperty("Wed",week.getWed());
				dataObject.addProperty("Thur",week.getThur());
				dataObject.addProperty("Fri",week.getFri());
				dataObject.addProperty("Sat",week.getSat());
				dataObject.addProperty("Sun",week.getSun());
				//将dataObject放入JsonArray数组中
				array.add(dataObject);
			}obj.addProperty("resultCode", 1);//1代表获取数据成功
			obj.addProperty("message", "获取成功!");
			obj.add("data", array);
		}
		//响应数据
		response.getWriter().write(obj.toString());
	/*try {
		// 调用Dao查询教室信息列表数据
	List<Week_tab> week_tabList = dao.week_tabList(clsname);
	// 判断集合中的数据
	if (null != week_tabList) {
		//放入request域
		request.setAttribute("week_tab", week_tabList);
	}
	request.getRequestDispatcher("detail.jsp").forward(request, response);
	} catch (Exception e) {
		e.printStackTrace();
	}*/}
}