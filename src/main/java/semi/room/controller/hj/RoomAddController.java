package semi.room.controller.hj;

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

import semi.img_file.vo.kth.ImgFileVo;
import semi.room.dao.hj.RoomDao;
@WebServlet("/addroom")
public class RoomAddController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RoomDao dao=RoomDao.getInstance();
		
		ServletContext context = this.getServletContext();
		String saveDir=context.getRealPath("/images");
		System.out.println("업로드 경로" + saveDir + "<br>");
		
		MultipartRequest mr=new MultipartRequest(
				req, 
				saveDir,
				1024*1024*10, //업로드 크기(10메가) 
				"utf-8", // 인코딩
				new DefaultFileRenamePolicy() //중복 파일명을 위한 객체
		);
		int room_id=Integer.parseInt(mr.getParameter("room_id"));
		String kind=mr.getParameter("kind");
		int capacity=Integer.parseInt(mr.getParameter("capacity"));
		int price=Integer.parseInt(mr.getParameter("price"));
		String src_name=mr.getParameter("src_name");
		int rete=Integer.parseInt(mr.getParameter("rete"));
		
		ImgFileVo vo=dao.roomselectAll(room_id);
	}
	
}
