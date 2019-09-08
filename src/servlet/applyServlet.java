package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import impl.ClassRoomDaoImpl;

public class applyServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置请求编码格式
		request.setCharacterEncoding("utf-8");
		// 设置响应编码格式
		response.setCharacterEncoding("utf-8");
		//
		response.setContentType("application/json,character=utf-8");
		//获取参数
		int week_no= Integer.parseInt(request.getParameter("week"));
		int lesson_no= Integer.parseInt(request.getParameter("lesson"));
		String id=request.getParameter("id");
		String clsroom=new String(request.getParameter("clsname").getBytes("iso-8859-1"),"utf-8");
		String reason=new String(request.getParameter("reason").getBytes("iso-8859-1"),"utf-8");
		// 初始化Dao实现类
		ClassRoomDaoImpl dao = new ClassRoomDaoImpl();
		//创建JSONObject对象
		JsonObject obj=new JsonObject();
		try {
			int status=dao.insertApply(week_no, lesson_no, id, clsroom, reason);
			if(status>0) {
				obj.addProperty("resultCode", 1);
			}else {
				obj.addProperty("resultCode", 0);
			}
			response.getWriter().write(obj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
