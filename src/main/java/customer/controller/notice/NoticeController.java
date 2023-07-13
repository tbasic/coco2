package customer.controller.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("NoticeController~~~~~");
//		search
		String field=request.getParameter("f");
		if(field==null || field.equals("")) {
			field="title";
		}
		System.out.println("field : "+field);
		String query=request.getParameter("q");
		if (query==null) {
			query="";
		}
		
		System.out.println("query : "+query);
		
		NoticeDao dao=new NoticeDao();
		List<Notice> list=dao.noticeSelAll(field,query);
		
//		forward처리
		//List<Notice> 를 request에 저장
		request.setAttribute("list", list);
		request.setAttribute("query", query);
		
		request.getRequestDispatcher("notice.jsp").forward(request, response);		
		
	}
}
