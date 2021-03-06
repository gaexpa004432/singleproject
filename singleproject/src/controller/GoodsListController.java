package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HumanDAO;
import model.HumanVO;

public class GoodsListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<HumanVO> list =new ArrayList<>();
		list = HumanDAO.getInstance().selectAll();
		request.setAttribute("goodsList", list);
		request.getRequestDispatcher("/goods/goodsSelectAll.jsp").forward(request, response);
		
	}

}
