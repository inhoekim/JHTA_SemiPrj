package semi.member.controller.je;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import semi.member.Vo.je.BoardVoje;
import semi.member.dao.je.BoardDaoje; 
@WebServlet("/board/insert")
public class BoardInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String hlogin_id=req.getParameter("hlogin_id");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		int service_id=0;
		int ref=0;
		int lev=0;
		int step=0;
		String snum=req.getParameter("service_id");
		if(snum!=null && !snum.equals("")) {//답글인 경우			
			service_id=Integer.parseInt(snum);
			ref=Integer.parseInt(req.getParameter("ref"));
			lev=Integer.parseInt(req.getParameter("lev"));
			step=Integer.parseInt(req.getParameter("step"));
		}
		BoardDaoje dao=new BoardDaoje();
		BoardVoje vo=new BoardVoje(service_id, hlogin_id, title, content, pwd, ref, lev, step, null, null);
		int n=dao.insert(vo);
		JSONObject json=new JSONObject();
		if(n>0) {
			json.put("find", true);
		}else {
			json.put("find", false);
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print(json);
	}

}
