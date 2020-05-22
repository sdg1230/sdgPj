package common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class CharsetEncodingFilter
 */
@WebFilter("/CharsetEncodingFilter")
public class CharsetEncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CharsetEncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//filter는 여러개 클래스만들어서 여러개 적용해도됨.
		//web.xml에 필터랑 필터맵핑만 짝지어서 잘써놓으면됨
		//서블릿 도착전에 처리할 사전작업/ 사전에 처리할작업
		request.setCharacterEncoding("utf-8");
		HttpServletRequest req = (HttpServletRequest)request;
		System.out.println("가자아");
		//다음필터를 요청해, 다음필터가 없으면 나가
		chain.doFilter(request, response);
		//서블릿에서 클라이언트로 응답 나가기 전 사후작업
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
