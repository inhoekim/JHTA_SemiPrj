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
		String saveDir=context.getRealPath("/images");
		//System.out.println("업로드 경로" + saveDir + "<br>");
		
		MultipartRequest mr=new MultipartRequest(
				req, 
				saveDir,
				1024*1024*10, //업로드 크기(10메가) 
				"utf-8", // 인코딩
				new DefaultFileRenamePolicy() //중복 파일명을 위한 객체
		);
		String kind=mr.getParameter("kind"); //객실등급
		int capacity=Integer.parseInt(mr.getParameter("capacity")); //객실인원
		int price=Integer.parseInt(mr.getParameter("price")); //가격
		Double rate=Double.parseDouble(mr.getParameter("rate")); //객실평점
		String src_name=mr.getFilesystemName("src_name"); //파일 경로
		
		//db저장
		//File f=new File(saveDir + "\\"); //업로드된 파일정보를 갖는 객체
		RoomVo vo=new RoomVo(0, kind, capacity, price, rate, src_name);
		RoomDao dao=RoomDao.getInstance();
		int n=dao.insertRoom(vo);
		if(n>0) {
			req.setAttribute("result", "success");
			req.setAttribute("successMsg", "객실 등록 완료");
		}else {
			req.setAttribute("result", "fail");
			req.setAttribute("failMsg", "다시 한 번 확인해 주세요.");
		}
		req.setAttribute("header", "/Admin/header.jsp");
		req.setAttribute("main", "/Admin/Adminaddroom.jsp");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
	}
}
