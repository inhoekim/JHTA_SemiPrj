package semi.room.controller.hj;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.room.dao.hj.RoomDao;
import semi.room.vo.ihk.RoomVo;
@WebServlet("/deleteroom")
public class RoomDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int room_id=Integer.parseInt(req.getParameter("room_id"));
		ServletContext context = this.getServletContext();
		String saveDir=context.getRealPath("/images");
		
		//파일삭제
		RoomDao dao=RoomDao.getInstance();
		RoomVo vo=dao.roomselect(room_id);
		if(vo.getSrc_name()!=null) {
			File f=new File(saveDir + "\\" + vo.getSrc_name());
			f.delete();
		}
		int n=dao.roomdelete(room_id);
		if(n>0) {
			resp.sendRedirect("/Admin/Adminlistroom.jsp");
		}else {
			System.out.println("<h1>삭제 실패</h1>");
		}
	}
}
	

