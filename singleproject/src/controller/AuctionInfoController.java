package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.HumanDAO;
import model.HumanVO;

public class AuctionInfoController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		HumanVO memberVO = new HumanVO();
		String path = null;
		if(request.getParameter("update") != null) {
			path = "/human/humanMain.jsp";
			memberVO.setId(request.getParameter("id"));
			memberVO.setPw(request.getParameter("pw"));
			memberVO.setName(request.getParameter("name"));
			HumanDAO.getInstance().update(memberVO); 
		}else{
			path = "/auction/auctionInfo.jsp";
			memberVO.setId((String)session.getAttribute("id"));
			HumanVO resultVO = HumanDAO.getInstance().selectOne(memberVO); 
			request.setAttribute("info",resultVO );
			
		}
		
		
		// 2. 서비스 처리(DB)
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
