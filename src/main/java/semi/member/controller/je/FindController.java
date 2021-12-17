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

@WebServlet("/hlogin/select/id")
public class FindController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jnum=req.getParameter("jnum");
		HloginDaoje dao=new HloginDaoje();
		String hlogin_id=dao.select(jnum);
		
		JSONObject json=new JSONObject();
		if(hlogin_id!=null) {
			json.put("find",true);
			json.put("hlogin_id", hlogin_id);
		}else {
			json.put("find", false);
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print(json);
		
	}

}