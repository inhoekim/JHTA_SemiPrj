package semi.member.controller.je;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import semi.member.dao.je.HloginDaoje;


@WebServlet("/hlogin/update/num")
public class UpdateControllerje extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pwd=req.getParameter("pwd");
		String jnum=req.getParameter("jnum");
		HloginDaoje dao=new HloginDaoje();
		int n=dao.update(pwd,jnum);
		JSONObject json=new JSONObject();
		if(n>0) {
			json.put("find", true);
		}else {
			json.put("find",false);
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print(json);
		
	}

}