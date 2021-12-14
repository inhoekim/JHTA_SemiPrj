package semi.member.controller.hj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.Vo.hj.MemberVo;
import semi.member.dao.hj.MemberDao;
@WebServlet("/changepwd")
public class ChangePwdController_hj extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hlogin_id=req.getParameter("hlogin_id");
		String jnum=req.getParameter("jnum");
		MemberDao dao=new MemberDao();
		MemberVo vo=dao.selectpwd(hlogin_id, jnum);
		if(vo==null) {	//아이디랑 주민번호가 일치하면 changePwd.jsp페이지로 이동
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/hj/result.jsp").forward(req, resp);
		}else {
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/hj/changePwd.jsp").forward(req, resp); 
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String hlogin_id=req.getParameter("hlogin_id");
		String pwd=req.getParameter("pwd");
		MemberVo vo=new MemberVo(hlogin_id, pwd, null, null, 0, null, null, 0);
		MemberDao dao=new MemberDao();
		int n=dao.changepwd(vo);
		if(n>0) {
			req.setAttribute("result", "success");
		}else {
			req.setAttribute("result", "fail");
		}
		req.getRequestDispatcher("/hj/result.jsp").forward(req, resp);
	}
}
