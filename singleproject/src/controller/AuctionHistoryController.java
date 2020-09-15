package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HistoryDAO;

public class AuctionHistoryController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setAttribute("his", HistoryDAO.getInstance().selectHistory() );
		request.getRequestDispatcher("/auction/auctionHistory.jsp").forward(request, response);
		

	}

}
