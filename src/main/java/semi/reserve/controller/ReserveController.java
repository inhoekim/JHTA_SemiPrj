package semi.reserve.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.reserve.dao.ihk.ReserveDao;
import semi.room.dao.ihk.RoomDao;

@WebServlet("/reserve")
public class ReserveController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		req.setAttribute("header", "/reserve/header.html");
		req.setAttribute("main", "/reserve/main.jsp");
		req.setAttribute("footer", "/reserve/footer.html");
		RoomDao roomDao = RoomDao.getInstance();
		req.setAttribute("room", roomDao.selectRoom(Integer.parseInt(req.getParameter("room"))));
		req.getRequestDispatcher("/reserve/layout.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession();
		String id = (String) session.getAttribute("hlogin_id");
		if(id == null || id.equals("")) {
			resp.sendRedirect(req.getContextPath() + "/login");
		}else {
			req.setCharacterEncoding("utf-8");
			int room = Integer.parseInt(req.getParameter("roomID"));
			int people = Integer.parseInt(req.getParameter("people"));
			String checkIn = req.getParameter("checkIn");
			String checkOut = req.getParameter("checkOut");
			ArrayList<Integer> oneArr = new ArrayList<>();
			ReserveDao reserveDao = ReserveDao.getInstance();
			HashMap<Integer,ArrayList<String>> map = reserveDao.getReserve(oneArr);
			//예약 가능 확인
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			/*
			for(String reservation: map.get(room)) {
				try {
					Date startDay = dateFormat.parse(reservation.split("~")[0]);
					Date endDay = dateFormat.parse(reservation.split("~")[1]);
					if(!(endDay.before(dateFormat.parse(checkIn)) || startDay.after(dateFormat.parse(checkOut))
						|| endDay.equals(dateFormat.parse(checkIn)) || startDay.equals(dateFormat.parse(checkOut)))){
						System.out.println("("+ room + "번방)");
						System.out.println("체크인:"+ dateFormat.parse(checkIn) + "//체크아웃" + dateFormat.parse(checkOut) + "는");
						System.out.println("예약일:" + startDay + "//종료일: " + endDay + " 충돌");
						flag = false;
					}
				}catch(ParseException e) {
					e.printStackTrace();
				}
			}
			
			*/
			
		}
	}
}
