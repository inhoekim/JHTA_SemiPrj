package semi.cookieloginfilter.hj;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter("/home/*")
public class CookieLoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		//자식타입으로 형변환 req, resp를 새로 생성
		HttpServletRequest req2=(HttpServletRequest)req;
		HttpServletResponse resp2=(HttpServletResponse)resp;
		
		//servlet에서 session을 사용하기 위해 선언
		HttpSession session=req2.getSession();
		
		Cookie[] cook=req2.getCookies();
		if(cook==null){
			System.out.println("<h1>쿠키가 존재하지 않습니다.</h1>");
		}else {
			for(Cookie ck:cook) {
				if(ck.getName().equals("hlogin_id")) {
					session.setAttribute("hlogin_id", ck.getValue());
				}
			}
		}
		chain.doFilter(req2, resp2);
	}
}
