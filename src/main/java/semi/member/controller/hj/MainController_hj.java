package semi.member.controller.hj;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.dao.hj.MemberDao;
@WebServlet("/main")
public class MainController_hj extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	메인 컨트롤러 작성 => 안에 로그인컨트롤러에 있는 쿠키값(아이디, 비번)을 메인컨트롤러에 작성	
		Cookie[] cookies=req.getCookies();

		HashMap<String, String> map=new HashMap<String, String>();
		
		if(cookies!=null){
			for(Cookie ck:cookies){
				String ckName=ck.getName(); 
				String ckValue=ck.getValue();
				if(ckName.equals("hlogin_id")) {
					map.put("hlogin_id", ckValue);
				}
			}
		}
		MemberDao dao=new MemberDao(); 
		boolean chk=dao.isMember(map);
		
		if(chk==true){
//			Cookie cook1=new Cookie("hlogin_id", );
//			cook1.setMaxAge(10);
//			cook1.setPath("/");
//			resp.addCookie(cook1);
//			Cookie cook2=new Cookie("pwd", pwd);
//			cook2.setMaxAge(10);
//			cook2.setPath("/");
//			resp.addCookie(cook2);
			HttpSession session=req.getSession();
			session.setAttribute("hlogin_id", map.get("hlogin_id"));
			
			req.getRequestDispatcher("/semiPrj/hj/main_test.jsp").forward(req, resp);
		}
		
	}
}	
