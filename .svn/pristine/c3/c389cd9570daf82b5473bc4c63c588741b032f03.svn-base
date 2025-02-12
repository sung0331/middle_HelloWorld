package kr.or.ddit.controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import kr.or.ddit.service.manager.IManagerBoardService;
import kr.or.ddit.service.manager.IManagerCustomerService;
import kr.or.ddit.service.manager.IManagerProdService;
import kr.or.ddit.service.manager.ManagerBoardServiceImpl;
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerProdServiceImpl;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.ProdCategoryVo;
import kr.or.ddit.vo.ProductVo;
import kr.or.ddit.vo.ProdImageVo;

@WebServlet("/managerProductInsert.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)

public class ManagerProductInsertController extends HttpServlet {
	IManagerProdService prodService = ManagerProdServiceImpl.getInstance();
	String upload_dir = "upload_img_product";

//	private static final String DB_URL = "jdbc:oracle:thin:@112.220.114.131:1521:xe"; // DB URL
//	private static final String DB_USER = "team3_202407M"; // DB 사용자 이름
//	private static final String DB_PASSWORD = "java"; // DB 비밀번호

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 공지사항 추가 페이지");
		HttpSession session = req.getSession();
		session.setAttribute("mangerPageCode", "managerProductInsert");
		System.out.println(session.getAttribute("mangerPageCode"));
//		CustomerVo customerVo = (CustomerVo) session.getAttribute("user");
//		System.out.println(customerVo);
		List<ProdCategoryVo> cate = prodService.getCate();
		System.out.println(cate);

		req.setAttribute("cate", cate);
		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductVo product=new ProductVo();
		ProdImageVo img =new ProdImageVo();
		
		
		String name=req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		String comment=req.getParameter("comment");
		int type=Integer.parseInt(req.getParameter("type"));
	   
		product.setProd_name(name);
	    product.setProd_price(price);
	    product.setProd_comment(comment);
	    product.setProd_cate_no(type);
	    
	    System.out.println(product);
	    prodService.productInsert(product);
		
	    // Multipart parsing 전에 파라미터 조회해보기
	    System.out.println("Multipart parsing 전: " + req.getParameter("sender"));

	    String uploadPath = "D:/A_TeachingMaterial/04_MIDDLE/team3/workspace/HelloWorld2/src/main/webapp/" + upload_dir;
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }

	    // "attachFile" 부분만 처리
	    Part filePart = req.getPart("img"); // 특정 파트만 가져오기
	    if (filePart != null) {
	        System.out.println("header : " + filePart.getHeader("content-disposition"));
	        String fileName = getFileName(filePart);
	        if (fileName != null && !fileName.equals("")) {
	            filePart.write(uploadPath + "/" + fileName);
	            System.out.println("파일명 => " + fileName + " 저장 완료!");
	            String[] splitValues = fileName.split("\\.");
	            String[] uploadPaths = uploadPath.split("workspace");

	    	    img.setProd_img_name(fileName);
	    	    img.setProd_img_type(splitValues[1]);
	    	    img.setProd_img_link(upload_dir+"/"+fileName);
	    	    System.out.println(img);
	    	    //SELECT NVL(MAX(PROD_NO),0) FROM PRODUCT
	    	    prodService.productImgSet(img);

	        }
	    }
	    
	
	    
	    
	    


	    
		resp.sendRedirect(req.getContextPath() + "/managerProductInfo.do");

	}

	/**
	 * Part 정보통 파싱하여 파일 이름 추출하기
	 * 
	 * @param part 파일 이름 추출할 part 객체
	 * @return 파일명 : 파읾명이 존재하지 않으면(폼필드인 경우) null 리턴함
	 */
	private String getFileName(Part part) {
		/*
		 * Content-Disposition 헤더에 대하여
		 * 
		 * 파일업로드 사용되는 경우
		 * 
		 * Content-Disposition : form-data Content-Disposition : form-data; name="필드명"
		 * Content-Disposition : form-data; name="필드명"; filename="파일명" 더 궁금하면 헤더 바디 공부허기
		 */
		for (String content : part.getHeader("Content-Disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}