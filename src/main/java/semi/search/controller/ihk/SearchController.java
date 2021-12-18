package semi.search.controller.ihk;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONArray;
import org.json.JSONObject;

import semi.reserve.dao.ihk.ReserveDao;
import semi.room.dao.ihk.RoomDao;
import semi.room.vo.ihk.RoomVo;

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
		JSONArray possible = new JSONArray();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for(int room : rooms) {
			boolean flag = true;
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
			//해당 room에 존재하는 모든 예약결과와 충돌나는 것이 없는 일정일때 possible에 담는다
			if(flag) {
				JSONObject json =  new JSONObject();
				RoomVo roomVo = roomDao.selectRoom(room);
				json.put("room_id", roomVo.getRoom_id());
				json.put("kind", roomVo.getKind());
				json.put("capacity", roomVo.getCapacity());
				json.put("rate", roomVo.getRate());
				json.put("price", roomVo.getPrice());
				json.put("src", roomVo.getSrc_name());
				possible.put(json);
			}
			
		}
		String costMin = req.getParameter("costMin");
		String costMax = req.getParameter("costMax");
		String review =req.getParameter("review");
		//몇박인지 계산
		long day = 0;
		try {
			day = (dateFormat.parse(checkOut).getTime() - dateFormat.parse(checkIn).getTime());
			day = day / (24*60*60*1000);
		}catch (ParseException e) {
			e.printStackTrace();
		}
		//설정한 가격대와 평점순으로 검색 필터링
		if(costMin != null && costMin != "") {
			resp.setContentType("text/plain;charset=utf-8");
			PrintWriter pw = resp.getWriter();
			JSONArray jsonArr = new JSONArray();
			for(int i = 0; i < possible.length(); i++) {
				JSONObject room = (JSONObject)possible.get(i);
				long totalPrice = ((int)room.get("price")) * day;
				double rate = ((Double)room.get("rate"));
				if(totalPrice < Integer.parseInt(costMin) || totalPrice > Integer.parseInt(costMax)) continue;
				if(rate < Integer.parseInt(review)) continue;
				jsonArr.put(room);
			}
			pw.print(jsonArr);
		}
		//가격대와 평점순과 관계없이 리턴
		else {
			req.setAttribute("result", possible);
			req.setAttribute("maxCost", 0);
			System.out.println("ok");
			req.getRequestDispatcher("/search/layout.jsp").forward(req, resp);
		}

	}
}
