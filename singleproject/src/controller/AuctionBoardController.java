package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AuctionDAO;
import model.AuctionVO;

public class AuctionBoardController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuctionVO auction = new AuctionVO();
		auction.setName(request.getParameter("name"));
		auction.setPicture("임시");
		auction.setStartprice(Integer.parseInt(request.getParameter("startprice")));
		HttpSession session = ((HttpServletRequest)request).getSession();
	int day = Integer.parseInt(request.getParameter("day")) +Integer.parseInt(request.getParameter("time"));
		System.out.println(day);
		auction.setLimit(day);
		auction.setId((String)session.getAttribute("id"));
		AuctionDAO.getInstance().insert(auction);
		
		response.sendRedirect("auctionBoardList.do");
	}

}
