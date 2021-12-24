package semi.room.controller.hj;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.room.dao.hj.RoomDao;
import semi.room.vo.ihk.RoomVo;
@WebServlet("/addroom")
public class RoomAddController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		ServletContext context = this.getServletContext();
		String saveDir=context.getRealPath("/images/room/");
		//System.out.println("업로드 경로" + saveDir + "<br>");
		
		MultipartRequest mr=new MultipartRequest(
				req, 
				saveDir,
				1024*1024*10, //업로드 크기(10메가) 
				"utf-8", // 인코딩
				new DefaultFileRenamePolicy() //중복 파일명을 위한 객체
		);
		String kind=mr.getParameter("kind"); //객실등급
		String capacity=mr.getParameter("capacity"); //객실인원
		String price=mr.getParameter("price"); //가격
		String rate=mr.getParameter("rate"); //객실평점
		String src_name=mr.getFilesystemName("src_name"); //파일 경로
		if(kind.equals("") || capacity.equals("") || rate.equals("") || price.equals("") || src_name.equals("")){
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/admin?apage=/Admin/AdminResult.jsp").forward(req, resp);
		}
		//db저장
		//File f=new File(saveDir + "\\"); //업로드된 파일정보를 갖는 객체
		RoomVo vo=new RoomVo(0, kind, Integer.parseInt(capacity), Integer.parseInt(price), Double.parseDouble(rate), src_name);
		RoomDao dao=RoomDao.getInstance();
		int n=dao.insertRoom(vo);
		
		if(n>0) {
			resp.sendRedirect(req.getContextPath() + "/listroom");
		}
	}
}
