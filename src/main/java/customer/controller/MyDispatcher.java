package customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.member.LoginController;
import customer.controller.member.LoginProcController;
import customer.controller.notice.NoticeController;
import customer.controller.notice.NoticeDelProcController;
import customer.controller.notice.NoticeDetailController;

public class MyDispatcher extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("http신호호호호호호");
		String uri=request.getRequestURI();
		String conPath=request.getContextPath();
		String com=uri.substring(conPath.length());
		System.out.println(com);
		
//		NoticeDetailController controller1=new NoticeDetailController();
//		NoticeEditController controller2=new NoticeEditController();
		Controller controller=null;
		
		try {
			if(com.equals("/customer/notice.do")) {
				controller=new NoticeController();
			}else if(com.equals("/customer/noticeDetail.do")) {
				controller=new NoticeDetailController();
			}else if(com.equals("/login/login.do")) {
				controller=new LoginController();
			}else if(com.equals("/login/loginProc.do")) {
				controller=new LoginProcController();
			}else if(com.equals("/customer/noticeDelProc.do")) {
				controller=new NoticeDelProcController();
			}
			controller.execute(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}

}
