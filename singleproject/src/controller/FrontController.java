package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
//@WebServlet(name = "front",urlPatterns = "*.do",initParams = {@WebInitParam(name="charset",value="UTF-8")})
@MultipartConfig(location = "c:/upload", maxRequestSize = 1024 * 1024 * 10)
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	String charset = null;
	HashMap<String,Controller> list = null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset"); //web.xml 에있는 param-name 이름 서블릿 초기화시 캐릭터 인코딩 실행
		list = new HashMap<String, Controller>();
		list.put("/humanInsert.do",new HumanInsertController());
		list.put("/humanMain.do",new HumanMainController());
		list.put("/humanLogin.do",new HumanLoginController());
		list.put("/auctionBoard.do",new AuctionBoardController());
		list.put("/auctionBoardList.do",new AuctionBoardListController());
		list.put("/biddingInsert.do",new BiddingInsertController());
		list.put("/auctionHistory.do",new AuctionHistoryController());
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(charset);
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath(); // /fontWeb/memberInsert.do
		String path = uri.substring(contextPath.length()); // /memberInsert.do
		Controller subController = list.get(path);
		subController.execute(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}
