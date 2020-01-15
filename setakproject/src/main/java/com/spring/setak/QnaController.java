package com.spring.setak;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller public class QnaController 
{
	@Autowired private QnaService qnaService;
	
	@RequestMapping("qnaList.co") public String qnaList(HttpServletRequest request, Model model) throws Exception
	{
		ArrayList<QnaVO> qnalist = new ArrayList<QnaVO>();
		int page  = 1;
		int limit = 10;
		if(request.getParameter("page") != null)
		{
			page = Integer.parseInt(request.getParameter("page"));			
		}
		
		int startrow = (page-1)*10 + 1;
		int endrow = startrow + limit-1;
		
		int listcount  = qnaService.getListCount(); 		
		qnalist = qnaService.getQnaList(startrow, endrow);
		
		int maxpage = (int)((double)listcount/limit+0.95);
		int startpage=(((int) ((double)page/10+0.9))-1)*10+1;
		int endpage = startpage + 10-1;
		
		if(endpage > maxpage)
		{
			endpage = maxpage;
			
		}
		
		model.addAttribute("limit", limit);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("qnalist", qnalist);
		
		return "qna_list";
		
		
		
		
	}
	
	@RequestMapping("qnaWrite.co") public String writeForm(QnaVO vo, Model model)
	{
		model.addAttribute("qnadata", vo);
		
		return "qna_write";
	}

	@RequestMapping("qnaInsert.co") public String insertQna(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		QnaVO qnaVO = new QnaVO();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer  = response.getWriter();	
		
		
		int maxnum = qnaService.getMaxNum();
		System.out.println("글쓰기maxnum=" + maxnum);
				
		if(maxnum != 0) 
		{
			maxnum = maxnum+1;
		}
		else 
		{ 
			maxnum=1;
		}

		qnaVO.setQNA_NUM(maxnum);
		System.out.println("들어가는 글의 maxnum=" + maxnum);
		qnaVO.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		String a = qnaVO.getMEMBER_ID();
		System.out.println("MEMBER_ID=" +a );		
		qnaVO.setQNA_TYPE(request.getParameter("QNA_TYPE"));	
		qnaVO.setQNA_KIND(request.getParameter("QNA_KIND"));	
		qnaVO.setQNA_TITLE(request.getParameter("QNA_TITLE"));
		qnaVO.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));

		
		ModelAndView mav = new ModelAndView();
		MultipartFile mf = request.getFile("QNA_FILE"); //파일		
		System.out.println("너의 QNA_FILE은=" + mf);
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
					
		qnaVO.setQNA_FILE(mf.getOriginalFilename().concat("/"+storedFileName));	
		
		}
		else
		{
			qnaVO.setQNA_FILE(null);
			
		}
		
		qnaVO.setQNA_CHECK(request.getParameter("QNA_CHECK"));
		String b = qnaVO.getQNA_CHECK();
		System.out.println("getQNA_CHECK()=" + b);
		
		int res = qnaService.qnaInsert(qnaVO);
		
		if(res ==0 ) 
		{
			writer.write("<script> alert('입력실패');location.href='./qnaWrite.co'; </script>");
			return null;
		}
		writer.write("<script> alert('입력 성공');location.href='./qnaList.co'; </script>");
			//return "redirect:/sungjuklist.su";					
		return null;
			
	}	
	
	@RequestMapping("getDetail.co") public String getDetail(QnaVO qnavo, Model model) throws Exception 
	{
		QnaVO vo = qnaService.getDetail(qnavo);
		model.addAttribute("qnadata", vo);
		
		return "qna_view";
	}
	
	@RequestMapping("updateform.co") public String updateForm(QnaVO qnavo, Model model) throws Exception {
		QnaVO vo = qnaService.getDetail(qnavo);
		model.addAttribute("qnadata", vo);		
		return "qna_update";
	}
		
	@RequestMapping("qnaUpdate.co") public String updateQna(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer  = response.getWriter();		
		
		QnaVO vo = new QnaVO();
		int result= 0;		
		int num=Integer.parseInt(request.getParameter("QNA_NUM"));		
		vo.setQNA_NUM(num);
		vo.setQNA_TYPE(request.getParameter("QNA_TYPE"));
		vo.setQNA_KIND(request.getParameter("QNA_KIND"));
		vo.setQNA_TITLE(request.getParameter("QNA_TITLE"));
		vo.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
		System.out.println("기존에 DB에 저장되어있던 파일의 이름  ="+request.getParameter("exist_file"));
		
						
		ModelAndView mav = new ModelAndView();
		MultipartFile mf = request.getFile("QNA_FILE"); //파일		
		System.out.println("너의 QNA_FILE은=" + mf);
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
		vo.setQNA_FILE(mf.getOriginalFilename().concat("/"+storedFileName));	
		
		}
		else
		{
			vo.setQNA_FILE(request.getParameter("exist_file"));
			
		}

		vo.setQNA_CHECK(request.getParameter("QNA_CHECK"));		
		result = qnaService.qnaModify(vo);
		if(result== 0)
		{
			writer.write("<script>alert('수정 실패');location.href='./updateform.co';</script>");
			return null;				
		}
		else
		{				
			writer.write("<script> alert('수정 성공');location.href='./qnaList.co'; </script>");
			//return "redirect:/sungjuklist.su";						
		}
		System.out.println("수정 성공하고 리스트로 왓다 .");
		return null;
	}
	
	@RequestMapping("qnaDelete.co") public String deleteQna (QnaVO vo, HttpServletResponse response) throws Exception
	{
		int res = qnaService.qnaDelete(vo);		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();		
		if (res == 1 ) 
		writer.write("<script>alert('글을 삭제하셨습니다 '); location.href='./qnaList.co';</script>");
		return null;
	
	}

	@RequestMapping("fileDownload.co") public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception
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
