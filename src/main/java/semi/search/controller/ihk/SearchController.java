package semi.search.controller.ihk;

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

import semi.reserve.dao.ihk.ReserveDao;
import semi.room.dao.ihk.RoomDao;

@WebServlet("/search")
public class SearchController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String checkIn = req.getParameter("checkInForm");
		String checkOut =req.getParameter("checkOutForm");
		int peopleNum = Integer.parseInt(req.getParameter("peopleNum"));
		RoomDao roomDao = RoomDao.getInstance();
		ArrayList<Integer> rooms = roomDao.capaciousRoom(peopleNum);
		ReserveDao reserveDao = ReserveDao.getInstance();
		HashMap<Integer,ArrayList<String>> map = reserveDao.getReserve(rooms);
		ArrayList<Integer> result = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for(int room : rooms) {
			System.out.println(room + "번방: ");
			boolean flag = true;
			for(String reservation: map.get(room)) {
				try {
					Date startDay = dateFormat.parse(reservation.split("~")[0]);
					Date endDay = dateFormat.parse(reservation.split("~")[1]);
					if(!(endDay.before(dateFormat.parse(checkIn)) || startDay.after(dateFormat.parse(checkOut))
						|| endDay.equals(dateFormat.parse(checkIn)) || startDay.equals(dateFormat.parse(checkOut)))){
						System.out.println("체크인:"+ dateFormat.parse(checkIn) + "//체크아웃" + dateFormat.parse(checkOut) + "는");
						System.out.println("예약일:" + startDay + "//종료일: " + endDay + " 충돌");
						flag = false;
					}
				}catch(ParseException e) {
					e.printStackTrace();
				}
			}
			//해당 room에 존재하는 모든 예약결과와 충돌나는 것이 없는 일정일때 result에 담는다
			if(flag) {
				System.out.println(room);
				result.add(room);	
			}
		}
		req.setAttribute("result", result);
		req.getRequestDispatcher("/search/layout.jsp").forward(req, resp);

	}
}
