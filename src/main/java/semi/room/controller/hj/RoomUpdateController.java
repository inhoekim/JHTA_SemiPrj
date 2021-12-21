package semi.room.controller.hj;

import java.io.File;
import java.io.IOException;

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
@WebServlet("/updateroom")
public class RoomUpdateController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		String kind=mr.getParameter("kind"); //객실등급
		int capacity=Integer.parseInt(mr.getParameter("capacity")); //객실인원
		int price=Integer.parseInt(mr.getParameter("price")); //가격
		Double rate=Double.parseDouble(mr.getParameter("rate")); //객실평점
		String src_name=mr.getFilesystemName("src_name");
		
		RoomDao dao=RoomDao.getInstance();
		RoomVo vo=dao.roomselect(room_id);
		
		int n=0;
		if(src_name!=null) { //수정할 파일이 전송된 경우 - 기존파일삭제 / 새파일 update
			String src_name1=vo.getSrc_name(); //이거없어도 되는거 아닌가? / 중복된 변수명이라 src_name1로 변경
			File f=new File(saveDir + "\\" + src_name);
			f.delete(); //기존 파일 삭제
			String newSavefilename=mr.getFilesystemName("src_name");
			RoomVo vo1=new RoomVo(room_id, kind, capacity, price, rate, newSavefilename);
			n=dao.roomupdate(vo1);
		}else { //수정할 파일이 전송되지 않은 경우 기존 파일정보 유지하기
			RoomVo vo1=new RoomVo(room_id, kind, capacity, price, rate, src_name);
			n=dao.roomupdate(vo1);
		}
		if(n>0) {
			req.setAttribute("result", "success");
			req.setAttribute("successMsg", "객실 수정 완료");
		}else {
			req.setAttribute("result", "fail");
			req.setAttribute("failMsg", "다시 한 번 확인해 주세요.");
		}
		req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
	}
}

