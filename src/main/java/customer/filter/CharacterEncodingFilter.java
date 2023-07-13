package customer.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(
			ServletRequest request, ServletResponse response
			, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println(">CharacterEncodingFilter.doFilter()호출");
		
		//request.setCharacterEncoding("UTF-8");
		// UTF-8말고 다른거 써야할 경우를 위해 web.xml 가서 주기
		request.setCharacterEncoding(this.encoding);
		
		chain.doFilter(request, response); //다음 필터 이동
		
	}

	private String encoding;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		this.encoding= filterConfig.getInitParameter("encoding");
		if(this.encoding==null) this.encoding = "UTF-8";
		}
  //모든 웹사이트 호출시 필터 올라감
}