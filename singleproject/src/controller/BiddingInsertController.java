package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BiddingDAO;
import model.BiddingVO;

public class BiddingInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		BiddingVO bidding = new BiddingVO();
		bidding.setNo(request.getParameter("auction_no"));
		bidding.setPrice(Integer.parseInt(request.getParameter("registerPrice")));
		bidding.setId((String)session.getAttribute("id"));
		BiddingDAO.getInstance().insert(bidding);
		
		response.sendRedirect("auctionBoardList.do");
	}

}
