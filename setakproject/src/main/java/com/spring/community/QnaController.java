package com.spring.community;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/qnaList.do") public String qnaList(HttpServletRequest request, Model model) throws Exception
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
	
	@RequestMapping(value = "/qnaWrite.do") public String writeForm(QnaVO vo, Model model, HttpSession session) throws Exception
	{	
		String loginId = (String) session.getAttribute("member_id");
		System.out.println("세션 아이디 잘 받아 왓냐 ="  + loginId);
		ArrayList<QnaVO> onlist = qnaService.onList(loginId);
		model.addAttribute("onList", onlist);		
		return "qna_write";
	}

	@RequestMapping(value = "/qnaInsert.do") public String insertQna(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		QnaVO qnaVO = new QnaVO();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer  = response.getWriter();	
		
		qnaVO.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		String a = qnaVO.getMEMBER_ID();
		System.out.println("MEMBER_ID=" +a );		
		qnaVO.setQNA_TYPE(request.getParameter("QNA_TYPE"));
		
		String chkOn =request.getParameter("ORDER_NUM");		
		if(!chkOn.equals("선택안함")){qnaVO.setORDER_NUM(Long.parseLong(request.getParameter("ORDER_NUM")));}
		else{ qnaVO.setORDER_NUM(0);}		
		qnaVO.setQNA_TITLE(request.getParameter("QNA_TITLE"));
		qnaVO.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
		qnaVO.setQNA_PASS(request.getParameter("QNA_PASS"));
		qnaVO.setQNA_SCR(request.getParameter("QNA_SCR"));
		
		if(request.getParameter("QNA_FILE").equals("")) {
			qnaVO.setQNA_FILE("등록한 파일이 없습니다._등록한 파일이 없습니다.");
		}else {
			qnaVO.setQNA_FILE(request.getParameter("QNA_FILE"));
		}
		
		qnaVO.setQNA_CHECK(request.getParameter("QNA_CHECK"));
		
		
		int res = qnaService.qnaInsert(qnaVO);
		
		if(res ==0 ) 
		{
			writer.write("<script> alert('글 작성을 실패하습니다.');location.href='./qnaWrite.do'; </script>");
			return null;
		}
		writer.write("<script>location.href='./qnaList.do'; </script>");
			//return "redirect:/sungjuklist.su";					
		return null;
			
	}	
	
	@RequestMapping(value = "/qnaDetail.do") public String getDetail(QnaVO qnavo, Model model) throws Exception 
	{
		QnaVO vo = qnaService.getDetail(qnavo);
		model.addAttribute("qnadata", vo);		
		return "qna_view";
	}
	
	@RequestMapping(value = "/qnaPass.do") public String qnaPass(QnaVO qnavo, Model model) throws Exception 
	{
		QnaVO vo = qnaService.getDetail(qnavo);
		model.addAttribute("qnadata", vo);		
		return "qna_pass";
	}
	@RequestMapping(value = "/qnaPass2.do") public String qnaPass2(QnaVO qnavo, Model model) throws Exception 
	{
		QnaVO vo = qnaService.getDetail(qnavo);
		model.addAttribute("qnadata", vo);		
		return "qna_pass2";
	}
	
	@RequestMapping(value = "/qnaPassChk.do") public String qnaPassChk(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer  = response.getWriter();	
		
		String writerId = request.getParameter("MEMBER_ID");
		String loginId= request.getParameter("loginId");
		String pass= request.getParameter("QNA_PASS");
		int num = Integer.parseInt(request.getParameter("QNA_NUM"));
		
		System.out.println("writerId 잘 넘어왔나? = " + writerId);
		System.out.println("pass 잘 넘어왔나? = " + pass);
		System.out.println("num 잘 넘어왔나? = " + num);
		System.out.println("loginId 잘 넘어왔나? = " + loginId);
		
		String res = qnaService.qnaPassChk(num);
			
		System.out.println("res 잘 넘어왔나? = " + res);	
		
		if(res.equals(pass))
		{
			if(loginId.equals(writerId)) 
			//if(loginId.equals(writerId)&&loginId.equals(어드민)) 
			{
				writer.write("<script> alert('비번일치');location.href='./qnaDetail.do?QNA_NUM="+num+"'; </script>");				
			}
			writer.write("<script> alert('작성자만 열람가능합니다.');location.href='qnaList.do'</script>");	
		 }else { 
			writer.write("<script> alert('비밀번호가 일치하지 않습니다.');location.href='./qnaPass.do?QNA_NUM="+num+"'; </script>"); 
		 }
		
		return null; 	
		
	}

	@RequestMapping(value = "/updateform.do") public String updateForm(HttpServletRequest request ,HttpServletResponse response ,HttpSession session, QnaVO qnavo, Model model) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer  = response.getWriter();	
		
		String loginId = (String) session.getAttribute("member_id");
		System.out.println("loginId="+loginId);		
		QnaVO vo = qnaService.getDetail(qnavo);
		String memberId=vo.getMEMBER_ID();
		System.out.println("memberId="+memberId);
		int qna_num= vo.getQNA_NUM();	
		System.out.println("qna_num="+qna_num);
		
		if(loginId==null) {
			writer.write("<script>alert('작성자만 게시글 수정이 가능합니다 .');location.href='./qnaDetail.do?QNA_NUM="+qna_num+"';</script>");
		}
		ArrayList<QnaVO> onlist = qnaService.onList(loginId);
		
		if(!loginId.equals(memberId))
		{
			writer.write("<script>alert('작성자만 게시글 수정이 가능합니다 .');location.href='./qnaDetail.do?QNA_NUM="+qna_num+"';</script>");
			/* ./qnaDetail.do?QNA_NUM=<%=bl.getQNA_NUM() %> */
			return null;				
		}
		
		model.addAttribute("onList", onlist);		
		model.addAttribute("qnadata", vo);		
		return "qna_update";
	}
		
	@RequestMapping(value = "/qnaUpdate.do") public String updateQna(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer  = response.getWriter();		
		
		QnaVO vo = new QnaVO();
		int result= 0;		
		int num=Integer.parseInt(request.getParameter("QNA_NUM"));		
		vo.setQNA_NUM(num);
		vo.setQNA_TYPE(request.getParameter("QNA_TYPE"));
		String chkOn =request.getParameter("ORDER_NUM");
		System.out.println("주문번호 잘 들어오냐?="+chkOn);
		if(!chkOn.equals("선택안함")) {vo.setORDER_NUM(Long.parseLong(request.getParameter("ORDER_NUM")));	}
		else { vo.setORDER_NUM(0); }
		vo.setQNA_TITLE(request.getParameter("QNA_TITLE"));
		System.out.println("QNA_TITLE="+request.getParameter("QNA_TITLE"));
		vo.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
		vo.setQNA_PASS(request.getParameter("QNA_PASS"));
		vo.setQNA_SCR(request.getParameter("QNA_SCR"));
		System.out.println("기존에 DB에 저장되어있던 파일의 이름  ="+request.getParameter("exist_file"));
		System.out.println("수정할 파일의 이름1  ="+request.getParameter("QNA_FILE"));
		
		if(request.getParameter("QNA_FILE").equals("")) {
			vo.setQNA_FILE(request.getParameter("exist_file"));
		}else {
		vo.setQNA_FILE(request.getParameter("QNA_FILE"));
		}
		
		vo.setQNA_CHECK(request.getParameter("QNA_CHECK"));
		
		System.out.println("수정할 파일의 이름  ="+request.getParameter("QNA_FILE"));
		
		
		
		result = qnaService.qnaModify(vo);
		if(result== 0)
		{
			writer.write("<script>alert('수정 실패');location.href='./updateform.do';</script>");
			return null;				
		}
		else
		{				
			writer.write("<script> alert('수정 성공');location.href='./qnaList.do'; </script>");
			//return "redirect:/sungjuklist.su";						
		}
		System.out.println("수정 성공하고 리스트로 왓다 .");
		return null;
	}
	
	@RequestMapping(value = "/qnaDelete.do") public String deleteQna (QnaVO vo, HttpServletResponse response, HttpServletRequest request) throws Exception
	{	
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();		
		
		String writerId = request.getParameter("MEMBER_ID");//글 작성자 
		String loginId= request.getParameter("loginId");
		String pass= request.getParameter("QNA_PASS");
		int num = Integer.parseInt(request.getParameter("QNA_NUM"));
		
		System.out.println("writerId 잘 넘어왔나? = " + writerId);
		System.out.println("pass 잘 넘어왔나? = " + pass);
		System.out.println("num 잘 넘어왔나? = " + num);
		System.out.println("loginId 잘 넘어왔나? = " + loginId);
		
		String pchk = qnaService.qnaPassChk(num);
		System.out.println("pchk 잘 넘어왔나? = " + pchk);
		
		if(pchk.equals(pass))
		{
			if(loginId.equals(writerId)) 
			{	
				qnaService.qnaDelete(vo);
				writer.write("<script> alert('게시글을 삭제하였습니다.');location.href='./qnaList.do'; </script>");				
			}
			writer.write("<script> alert('작성자만 삭제 가능합니다.');location.href='qnaList.do'</script>");	
		 }else { 
			writer.write("<script> alert('비밀번호가 일치하지 않습니다.');location.href='./qnaPass.do?QNA_NUM="+num+"'; </script>"); 
		 }
		
		return null; 	
	
	}

	@RequestMapping(value = "/fileDownload.do") public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception
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
