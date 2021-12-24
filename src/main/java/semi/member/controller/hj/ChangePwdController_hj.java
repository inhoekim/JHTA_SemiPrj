package semi.member.controller.hj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.gaip.util.sh.Utility;
import semi.member.Vo.je.HloginVoje;
import semi.member.dao.je.HloginDaoje;
@WebServlet("/changepwd")
public class ChangePwdController_hj extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hlogin_id=req.getParameter("hlogin_id");
		String jnum=req.getParameter("jnum");
		HloginDaoje dao=new HloginDaoje();
		HloginVoje vo=dao.selectpwd(hlogin_id, jnum);
		if(vo==null) {	//아이디랑 주민번호가 일치하면 changePwd.jsp페이지로 이동
			req.setAttribute("result", "fail");
			req.setAttribute("failMsg", "변경에 실패했습니다. 다시 한 번 확인해 주세요.");
			req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
		}else {
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/home?spage=/home/changePwd.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
//		String pwd=req.getParameter("pwd");
		String hlogin_id=req.getParameter("hlogin_id");
//		if(pwd.equals("")) {
//			req.setAttribute("result", "fail");
//			req.setAttribute("failMsg", "비밀번호을 변경하지 못 했습니다.");
//			req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
//		}
		String pwd=Utility.encoding(req.getParameter("pwd"));
		
		HloginVoje vo=new HloginVoje(hlogin_id, pwd, null, null, 0, null, null, 0);
		HloginDaoje dao=new HloginDaoje();
		int n=dao.changepwd(vo);
		if(n>0) {
			req.setAttribute("result", "success");
			req.setAttribute("successMsg", "비밀번호 변경이 완료되었습니다!");
		}
		req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
//		else {
//			req.setAttribute("result", "fail");
//			req.setAttribute("failMsg", "변경에 실패했습니다.<br> 다시 한 번 확인해 주세요.");
//			req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
//		}
	}
}
