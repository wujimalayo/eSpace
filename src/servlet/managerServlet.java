package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Class.ClassRoom;
import impl.ClassRoomDaoImpl;

public class managerServlet extends HttpServlet{
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
		// 将星期、楼层传至前端
		request.setAttribute("week_no", week_no);
		request.setAttribute("floor_no", floor);
		//
		response.setContentType("application/json,character=utf-8");
		// 初始化Dao实现类
		ClassRoomDaoImpl dao = new ClassRoomDaoImpl();
		try {
			// 调用Dao查询商品信息列表数据
		List<ClassRoom> indexRoomlist = dao.indexRoomList(week_no,floor);
		// 判断集合中的数据
		if (null != indexRoomlist) {
			//放入request域
			request.setAttribute("clsroom", indexRoomlist);
		}
		request.getRequestDispatcher("table_test1.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
}
}