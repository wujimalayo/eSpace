package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import impl.ClassRoomDaoImpl;

public class app_reasonInfoServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置响应编码格式
		response.setCharacterEncoding("utf-8");
		//
		response.setContentType("application/json,character=utf-8");
		//获取申请时间
		String app_date=new String(request.getParameter("app_date").getBytes("iso-8859-1"),"utf-8");
		// 初始化Dao实现类
		ClassRoomDaoImpl dao = new ClassRoomDaoImpl();
		// 调用Dao查询申请原因数据
		String reason = dao.app_reason(app_date);
		JsonObject obj=new JsonObject();
		// 判断集合中的数据
		if (null == reason) {
			obj.addProperty("resultCode", 0);
			obj.addProperty("message", "获取失败!");
		}
		else {
			obj.addProperty("app_reason", reason);
			}
		obj.addProperty("resultCode", 1);//1代表获取数据成功
		obj.addProperty("message", "获取成功!");
		//响应数据
		response.getWriter().write(obj.toString());
		}
	}
