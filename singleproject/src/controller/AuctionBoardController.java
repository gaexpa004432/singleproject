package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import common.FileRenamePolicy;
import model.AuctionDAO;
import model.AuctionVO;
public class AuctionBoardController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuctionVO auction = new AuctionVO();
		auction.setName(request.getParameter("content"));
		auction.setStartprice(Integer.parseInt(request.getParameter("startprice")));
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		int day = Integer.parseInt(request.getParameter("day")) +Integer.parseInt(request.getParameter("time"));
		System.out.println(day);
		auction.setLimit(day);
		auction.setId((String)session.getAttribute("id"));
		
		
		Part part = request.getPart("filename");
		String filename = getFileName(part);
		String path = request.getServletContext().getRealPath("/images");
		System.out.println(path);
		//중복체크
		File renamefile = FileRenamePolicy.rename(new File(path,filename));
		part.write(path + "/" + renamefile.getName());
		auction.setPicture(renamefile.getName());
		
		
		
		AuctionDAO.getInstance().insert(auction);
		response.sendRedirect("auctionBoardList.do");
	}
	
	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
