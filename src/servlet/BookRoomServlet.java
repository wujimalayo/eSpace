package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import impl.ClassRoomDaoImpl;

public class BookRoomServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置响应编码格式
		response.setCharacterEncoding("utf-8");
		// 获取周次参数
		int week_no = Integer.parseInt(request.getParameter("week_no"));
		// 将星期传至前端
		request.setAttribute("week_no", week_no);
		// 获取周次参数
		int week = Integer.parseInt(request.getParameter("week"));
		// 获取节次参数
		int lesson = Integer.parseInt(request.getParameter("lesson"));
		// 获取教室参数
		String clsroom= request.getParameter("clsname");
		// 初始化Dao实现类
		ClassRoomDaoImpl dao = new ClassRoomDaoImpl();
		//创建JSONObject对象
				JsonObject obj=new JsonObject();
		try {
			int status=dao.bookRoom(week, lesson, clsroom);
			if(status>0){
				obj.addProperty("resultCode", 1);
			}else {
				obj.addProperty("resultCode", 0);
			}
			response.getWriter().write(obj.toString());
			/*request.setAttribute("book_status", status);
			request.getRequestDispatcher("table_test1.jsp").forward(request, response);*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
