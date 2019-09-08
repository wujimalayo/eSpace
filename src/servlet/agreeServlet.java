package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import impl.ClassRoomDaoImpl;

public class agreeServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置响应编码格式
		response.setCharacterEncoding("utf-8");
		// 获取申请编号
		int app_no = Integer.parseInt(request.getParameter("no"));
		// 获取操作key
		int key = Integer.parseInt(request.getParameter("key"));
		if(key==1)
			{System.out.println("同意");}
		else if(key==0) {
			System.out.println("不同意");
		}else
			System.out.println("非Int型");
		// 初始化Dao实现类
		ClassRoomDaoImpl dao = new ClassRoomDaoImpl();
		//创建JSONObject对象
				JsonObject obj=new JsonObject();
		try {
			int status=dao.approve(app_no, key);
			if(status>0){
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

