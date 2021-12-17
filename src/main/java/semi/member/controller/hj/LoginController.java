package semi.member.controller.hj;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.gaip.util.sh.Utility;
import semi.member.dao.hj.MemberDao;
import semi.review.dao.kth.ReviewBoardDao;
import semi.review.dao.kth.ReviewCommentsDao;
import semi.review.vo.kth.ReviewBoardVo;
import semi.review.vo.kth.ReviewCommentsVo;
@WebServlet("/login")
public class LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/login/login_hj.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String hlogin_id=req.getParameter("hlogin_id");
		String pwd=Utility.encoding(req.getParameter("pwd")); //비밀번호 암호화로 Utility추가: String pwd=Utility.encoding(req.getParameter("pwd"));
		//12-14일 13시 상훈 수정
		String chk=req.getParameter("chk");
		System.out.println("ho");
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("hlogin_id", hlogin_id);
		map.put("pwd", pwd);

		MemberDao dao=new MemberDao(); 
		boolean b=dao.isMember(map);	
		
		if(chk!=null){ //체크박스에 체크한 경우 
			Cookie cook1=new Cookie("hlogin_id",hlogin_id);
			cook1.setMaxAge(60*60); //60분 -테스트중이라 10초
			cook1.setPath("/");
			resp.addCookie(cook1);
		}
		if(b) {
			// 12월15일 태형 수정
			// 알람 기능
			ReviewCommentsDao reviewDao = ReviewCommentsDao.getInstance();
			ArrayList<ReviewCommentsVo> list = reviewDao.selectReview(hlogin_id);
			
			HttpSession session=req.getSession();
			session.setAttribute("hlogin_id", hlogin_id);
			
			// 12월15일 태형 수정
			req.setAttribute("list", list);
			req.getRequestDispatcher("/hj/main_test.jsp").forward(req, resp);
			
			//resp.sendRedirect("/semiPrj/hj/main_test.jsp");
		
		}else {
			req.setAttribute("errMsg", "아이디 또는 비밀번호가 맞지 않습니다.");
			req.getRequestDispatcher("/login/login_hj.jsp").forward(req, resp);
		}
	}
}
