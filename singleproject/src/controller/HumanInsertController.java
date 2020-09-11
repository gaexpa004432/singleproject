package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HumanDAO;
import model.HumanVO;

public class HumanInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HumanVO human = new HumanVO();
		human.setId(request.getParameter("id"));
		human.setPw(request.getParameter("pw"));
		human.setName(request.getParameter("name"));
		
		HumanDAO.getInstance().insert(human);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
