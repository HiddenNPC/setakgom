package com.spring.community;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller public class NoticeController 
{
	@Autowired private NoticeService noticeService;
	
	@RequestMapping("noticeList.do") public String noticeList(HttpServletRequest request, Model model) throws Exception
	{
		ArrayList<NoticeVO> noticelist = new ArrayList<NoticeVO>();
		int page = 1;
		int limit = 10;
		if (request.getParameter("page") != null)
		{
			page = Integer.parseInt(request.getParameter("page"));			
		}
		int startrow= (page-1)*10+1;
		int endrow=startrow +limit-1;

		int listcount = noticeService.getListCount();
		
		noticelist = noticeService.getNoticeList(startrow, endrow);
		
		int maxpage = (int)((double)listcount/limit+0.95);
		int startpage = (((int) ((double)page/10 + 0.9)) -1) * 10 + 1;
		int endpage = startpage+10-1;
		
		
		
		if(endpage > maxpage )
		{
			endpage = maxpage;			
		}
		
		model.addAttribute("limit", limit);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("noticelist", noticelist);
		
		return "notice_list";

	}
	
	@RequestMapping("noticeWrite.do") public String writeForm(NoticeVO noticevo, Model model) throws Exception
	{
		model.addAttribute("noticevo", noticevo);
		return "notice_write";
		
	}
	
	@RequestMapping("noticeInsert.do") public String insertNotice(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception 
	{				
		NoticeVO noticevo = new NoticeVO();
		noticevo.setNOTICE_TITLE(request.getParameter("NOTICE_TITLE"));
		noticevo.setNOTICE_CONTENT(request.getParameter("NOTICE_CONTENT"));					
		int res = noticeService.noticeInsert(noticevo);		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (res !=0 ) {
			writer.write("<script>alert('공지사항 작성 성공!!');location.href='./noticeList.st';</script>");
		}
		else {
			writer.write("<script>alert('공지사항 작성 실패..');location.href='./noticeWrite.st';</script>");
		}
		
		return null;
	}
	
	@RequestMapping("getDetail.do") public String getDetail( NoticeVO noticevo, Model model) throws Exception
	{
		NoticeVO vo = noticeService.getDetail(noticevo);
		model.addAttribute("noticedata", vo);
		System.out.println("글 보기 정상작동");	
		System.out.println("noticedata =" + vo);	
		return "notice_view";
	}

	@RequestMapping("/updateForm.do") public String updateForm(NoticeVO noticevo, Model model) throws Exception {
		NoticeVO vo = noticeService.getDetail(noticevo);
		model.addAttribute("noticedata", vo);
		
		return "notice_modify";
	}

	@RequestMapping ("noticeModify.do") public String noticeModify (NoticeVO noticevo, HttpServletResponse response, HttpServletRequest request) throws Exception
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		int res = noticeService.noticeModify(noticevo);		
		
		
		if (res == 1 ) {
			writer.write("<script>alert('게시글 수정 성공!!'); location.href='./noticeList.st';</script>");
		}
		
		else {
			writer.write("<script>alert('게시글 수정 실패..'); location.href='history.go(-1)'</script>");
		}				
		return null;				
	}
	
	@RequestMapping("/deleteForm.do") public String deleteForm(NoticeVO noticevo, Model model) throws Exception 
	{
		NoticeVO vo = noticeService.getDetail(noticevo);
		model.addAttribute("noticedata", vo);		
		return "notice_delete";
	}

	@RequestMapping("/noticeDelete.do") public String noticeDelete(NoticeVO noticevo, HttpServletResponse response) throws Exception 
	{
		int res = noticeService.noticeDelete(noticevo);		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (res == 1 ) {
			writer.write("<script>alert('게시글 삭제 성공!!'); location.href='./noticeList.st';</script>");
		}
		
		else {
			writer.write("<script>alert('게시글 삭제 실패..'); location.href='deleteForm.st'</script>");
		}
		
		
		return null;
	}




}
