package semi.member.controller.sh;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.Vo.je.HloginVoje;

import semi.member.dao.sh.GaipDao;

@WebServlet("/select/list")

public class SelectGaipAdminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GaipDao dao=new GaipDao();
		ArrayList<HloginVoje> list=dao.AdminselectAll();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/sh/Adminlist.jsp").forward(req, resp);
	}
}

