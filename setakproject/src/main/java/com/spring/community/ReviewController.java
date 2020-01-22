package com.spring.community;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller public class ReviewController 
{
	@Autowired private ReviewService reviewService;
	
	@RequestMapping ("review.do") public String review(Model model, ReviewVO vo, HttpServletRequest request ) throws Exception
	{	
		//model.addAttribute("Review_num");		 
		return "review_list";			
	}
	
	@RequestMapping (value="reviewList.do", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST} ) 
	@ResponseBody public ArrayList<ReviewVO> reviewList() throws Exception
	{
		ArrayList<ReviewVO> list = reviewService.reviewList();
		return list;		
	}
	
	@PostMapping("reviewInsert.do") public String reviewInsert(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		ReviewVO vo = new ReviewVO();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer  = response.getWriter();	
		
		
		int maxnum = reviewService.getMaxNum();
		System.out.println("리뷰 maxnum=" + maxnum);
				
		if(maxnum != 0) 
		{
			maxnum = maxnum+1;
		}
		else 
		{ 
			maxnum=1;
		}

		vo.setReview_num(maxnum); 
		System.out.println("리뷰 갯수 (=maxnum)=" + maxnum);
		vo.setMember_id("nanana");
		//String a = vo.getMember_id();
		//System.out.println("Member_id=" +a );		
		vo.setReview_kind(request.getParameter("Review_kind"));	
		System.out.println("분류 = " + vo.getReview_kind());
		vo.setReview_star(Double.parseDouble( request.getParameter("Review_star")));
		System.out.println("별점 떳냐? =" +vo.getReview_star());
		vo.setReview_content(request.getParameter("Review_content"));
		System.out.println("내용 = " + vo.getReview_content());
		vo.setReview_like(request.getParameter("Review_like"));
		System.out.println("좋아요 = " + vo.getReview_like());		
		
		ModelAndView mav = new ModelAndView();
		MultipartFile mf = request.getFile("Review_photo");//파일		
		System.out.println("너의 review_photo은=" + mf);
		String uploadPath="C:\\Project138\\upload\\";			
		if(mf.getSize() != 0)//용량
		{	
		String originalFileExtention = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtention;								
		mf.transferTo(new File(uploadPath+storedFileName));//파일 전송				
		//뷰에 출력한 데이터 모델에 저장 
		mav.setViewName("download");
		mav.addObject("paramName", mf.getName());
		mav.addObject("fileName", mf.getOriginalFilename());
		mav.addObject("fileSize", mf.getSize());
		mav.addObject("storedFileName",storedFileName);	
		String downlink = "fileDownload?of="+URLEncoder.encode(storedFileName,"UTF-8")+"&of2=" + URLEncoder.encode(mf.getOriginalFilename(), "UTF-8");
		mav.addObject("downlink", downlink);
		
		System.out.println("paramName=" + mf.getName());
		System.out.println("fileName=" + mf.getOriginalFilename());
		System.out.println("fileSize=" + mf.getSize());
		System.out.println("storedFileName=" + storedFileName);
					
		vo.setReview_photo(mf.getOriginalFilename().concat("/"+storedFileName));	
		
		}
		else
		{
			vo.setReview_photo(null);			
		}			
				
		int res = reviewService.reviewInsert(vo);
		
		if(res ==0 ) 
		{
			writer.write("<script> alert('입력실패');location.href='./review.do'; </script>");
			return null;
		}
		writer.write("<script> alert('입력 성공');location.href='./review.do'; </script>");
			//return "redirect:/sungjuklist.su";					
		return null;
			
	}
	
	@PostMapping("fileDownload.do") public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		response.setCharacterEncoding("UTF-8");
		String of = request.getParameter("of"); //서버에 업로드된 변경된 실제 파일명
		String of2 = request.getParameter("of2"); // 오리지날 파일명 
		//두 이름 모두 전달해줌 
		/*
		 웹사이트 루트디렉토리의 실제 디스트상의 경로 알아내기 
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		String fullPath = uploadPath+"/"+of;
		*/
		
		String uploadPath="C:\\Project138\\upload\\";		
		//직접 경로 지정
		String fullPath = uploadPath + of;
		File downloadFile = new File (fullPath);
		
		//파일 다운로드 컨텐츠 타입을 위한 application/download 설정 
		response.setContentType("application/download; charset=UTF-8");
		
		//파일사이즈 지정
		response.setContentLength((int)downloadFile.length()); //파일의 길이 -> 파일의 크기
		
		//다운로드 창을 띄우기 위한 헤더 조작 
		response.setHeader("Content-Disposition", "attachment; filename=" + new String(of2.getBytes(),"ISO8859_1"));
		response.setHeader("Content-Transfer-Encoding", "binary"); //전송 시,  엔코딩 방식,형식 ( binary: 이진수)
		
		/*
		Content-disposition 속성 
		1) Content-disposition: attachment 브라우저 인식 파일확장자를 포함하여 모든 확장자의 파일들에 대해 , 다운로드시 무조건 "파일 다운로드" 대화 상자 가 뜨도록 
		하는 헤더 속성
		2)Content-disposition: inline 브라우져 인식 파일확장자를 가진 파일들에 대해서는 웹브라우져 상에서 바로 파일을 열고 , 
		그외의 파일들에 대해서는 "파일 다운로드" 대화 상자가 
		뜨도록 하는 헤더 속성이다 .		
		*/
		
		FileInputStream fin = new FileInputStream(downloadFile);//실제 파일명을 담아 
		ServletOutputStream sout = response.getOutputStream(); //출력할 객체 (서버에서 클라이언트로 )
		
		byte[] buf = new byte[1024];
		int size = -1;
		while ((size = fin.read(buf, 0, buf.length)) != -1 ) //읽다가 끝에 도달하면 -1과 마주한다 .-1을 만나면 빠져나오기 
		{
			sout.write(buf, 0, size); //버퍼크기반큼 읽어와서 0번쨰 위치부터 쭉~
	
		}
		fin.close();
		sout.close();

	}
	
	
}
