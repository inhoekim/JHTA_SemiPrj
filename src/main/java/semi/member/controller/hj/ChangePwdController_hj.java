package semi.member.controller.hj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.gaip.util.sh.Utility;
import semi.member.Vo.je.HloginVoje;
import semi.member.dao.hj.MemberDao;
@WebServlet("/changepwd")
public class ChangePwdController_hj extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hlogin_id=req.getParameter("hlogin_id");
		String jnum=req.getParameter("jnum");
		MemberDao dao=new MemberDao();
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
		String hlogin_id=req.getParameter("hlogin_id");
		String pwd=Utility.encoding(req.getParameter("pwd"));
		HloginVoje vo=new HloginVoje(hlogin_id, pwd, pwd, hlogin_id, 0, pwd, null, 0);
		MemberDao dao=new MemberDao();
		int n=dao.changepwd(vo);
		if(n>0) {
			req.setAttribute("result", "success");
			req.setAttribute("successMsg", "비밀번호 변경이 완료되었습니다!");
		}else {
			req.setAttribute("result", "fail");
			req.setAttribute("failMsg", "변경에 실패했습니다. 다시 한 번 확인해 주세요.");
		}
		req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
	}
}
