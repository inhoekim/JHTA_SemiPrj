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

import semi.member.Vo.je.HloginVoje;
import semi.member.dao.je.HloginDaoje;

import semi.payment.dao.PaymentDao;
import semi.payment.vo.PaymentVo;

import semi.reserve.dao.ihk.ReserveDao;
import semi.room.dao.ihk.RoomDao;

@WebServlet("/reserve")
public class ReserveController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("hlogin_id");
		if(id == null || id.equals("")) {
			resp.sendRedirect(req.getContextPath() + "/home?spage=/home/login.jsp");
			return;
		}
		req.setCharacterEncoding("utf-8");
		RoomDao roomDao = RoomDao.getInstance();
		HloginVoje userVo = new HloginDaoje().selecthloginid(id);
		req.setAttribute("user", userVo);
		req.setAttribute("room", roomDao.selectRoom(Integer.parseInt(req.getParameter("room"))));
		req.getRequestDispatcher("/reserve/layout.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession();
		String userID = (String) session.getAttribute("hlogin_id");
		if(userID == null || userID.equals("")) {
			resp.sendRedirect(req.getContextPath() + "/home?spage=/home/login.jsp");
			return;
		}
		req.setCharacterEncoding("utf-8");
		int roomID = Integer.parseInt(req.getParameter("roomID"));
		int method = Integer.parseInt(req.getParameter("paymentMethod"));
		String checkIn = req.getParameter("checkIn");
		String checkOut = req.getParameter("checkOut");
		ArrayList<Integer> oneArr = new ArrayList<>();
		oneArr.add(roomID);
		ReserveDao reserveDao = ReserveDao.getInstance();
		HashMap<Integer,ArrayList<String>> map = reserveDao.getReserve(oneArr);
		//?????? ?????? ??????
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for(String reservation: map.get(roomID)) {
			try {
				Date startDay = dateFormat.parse(reservation.split("~")[0]);
				Date endDay = dateFormat.parse(reservation.split("~")[1]);
				if(!(endDay.before(dateFormat.parse(checkIn)) || startDay.after(dateFormat.parse(checkOut))
						|| endDay.equals(dateFormat.parse(checkIn)) || startDay.equals(dateFormat.parse(checkOut)))){
					req.setAttribute("result", "fail");
					req.setAttribute("failMsg", "?????? ???????????? ????????? ????????? ??? ????????????. ??????????????? ?????? ???????????????.");	
					req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
					return;
				}
			}catch(ParseException e) {
				e.printStackTrace();
			}
		}
		int result = reserveDao.reserve(userID,roomID,checkIn,checkOut);
		if(result > 0) {
			//???????????????
			long day = 0;
			try {
				day = (dateFormat.parse(checkOut).getTime() - dateFormat.parse(checkIn).getTime());
				day = day / (24*60*60*1000);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			//??? 1??? price ????????????
			RoomDao roomDao = RoomDao.getInstance();
			int totalCost = (int) day * roomDao.selectRoom(roomID).getPrice();
			//?????? row ??????
			PaymentDao paymentDao = PaymentDao.getInstance();
			int n = paymentDao.insert(new PaymentVo(-1,result,method,totalCost,1));
			if(n > 0) {
				req.setAttribute("result", "success");
				req.setAttribute("successMsg", "??????????????? ??????????????? ??????????????????!");
				req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
			}else {
				req.setAttribute("result", "fail");
				req.setAttribute("failMsg", "?????????????????? ????????? ?????????????????????. ??????????????? ?????????????????????!");
				req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
			}
		}else {
			req.setAttribute("result", "fail");
			req.setAttribute("failMsg", "?????? ???????????? ????????? ??????????????????. ??????????????? ?????????????????????!");
			req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
		}
	}
}

