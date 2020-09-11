package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HumanDAO;
import model.HumanVO;

public class HumanLoginController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HumanVO memberVO = new HumanVO();
		memberVO.setId(request.getParameter("id"));
		memberVO.setPw(request.getParameter("pw"));
		
		// 2. 서비스 처리(DB)
		HumanVO resultVO = HumanDAO.getInstance().selectOne(memberVO);  // memberVO 집어넣고 결과를 MemberVO로 받기
		
		
		// 3. 결과 저장
		String page = "";		// 이동할 페이지 이름 변수 선언
		if(resultVO == null) {  // id가 없는 경우
			request.setAttribute("errormsg", "해당 ID가 없습니다.");
			page = "/human/humanLogin.jsp";
			
		} else {
			if(memberVO.getPw().equals(resultVO.getPw())) {  // memberVO에 있는 pw와 resultVO의 pw를 비교해서 같으면 로그인성공
				request.getSession().setAttribute("login", resultVO);		// 세션으로 result객체를 보내는 것
				request.getSession().setAttribute("id", resultVO.getId());	// 세션으로 result객체를 보내는 것
				page = "/human/humanMain.jsp";
			} else {	// 패스워드 불일치
				request.setAttribute("errormsg", "패스워드 불일치");
				page = "login.jsp";
			}
		}
		
		// 4. 뷰페이지 이동(redirect, forward) 또는 뷰페이지 출력
		request.getRequestDispatcher(page).forward(request, response);

	}

}
