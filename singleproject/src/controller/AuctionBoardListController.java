package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AuctionDAO;
import model.AuctionVO;

public class AuctionBoardListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AuctionVO> list = new ArrayList<>();
		list = AuctionDAO.getInstance().selectAll();
		
		request.setAttribute("boardList", list);
		request.getRequestDispatcher("/auction/auctionBoardList.jsp").forward(request, response);
		
		
		
	}

}
