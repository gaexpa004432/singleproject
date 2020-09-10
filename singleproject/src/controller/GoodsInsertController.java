package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GoodsDAO;
import model.GoodsVO;

public class GoodsInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		GoodsVO goodsvo = new GoodsVO();
		goodsvo.setName(request.getParameter("name"));
		goodsvo.setUnit(request.getParameter("unit"));
		
		GoodsDAO.getInstance().insert(goodsvo);
		response.sendRedirect("goodsList.do");
	}

}
