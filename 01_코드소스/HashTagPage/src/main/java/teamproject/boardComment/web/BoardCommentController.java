package teamproject.boardComment.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j2;
import teamproject.boardComment.service.BoardCommentService;
import teamproject.boardComment.service.BoardCommentVO;
import teamproject.common.Criteria;
import teamproject.users.service.UsersVO;

@Log4j2
@Controller
public class BoardCommentController {
	@Autowired
	private BoardCommentService boardCommentService;
	
	@GetMapping("/boardComment/boardComment.do")
	public String selectBoardCommentList(@ModelAttribute Criteria criteria,
			Model model) {
		log.info("테스트");
		PaginationInfo paginationInfo=new PaginationInfo();
		paginationInfo.setCurrentPageNo(criteria.getPageIndex());
		paginationInfo.setRecordCountPerPage(criteria.getPageUnit());
		criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());
		List<?> boardCommentList=boardCommentService.selectBoardCommentList(criteria);
		model.addAttribute("boardCommentList", boardCommentList);
		int totCnt=boardCommentService.selectBoardCommentListTotCnt(criteria);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);	
		log.info("테스트1");
		return "boardComment/boardComment_all";
	}
	@GetMapping("/boardComment/addition.do")
	public String createBoardCommentView() {
		return "boardComment/add_boardComment";
	}
	
	@PostMapping("/boardComment/add.do")
	public String insert(HttpSession session,@ModelAttribute BoardCommentVO boardCommentVO, HttpServletRequest request) {
		 UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");

	        if (usersVO == null) {
	            return "redirect:/hashtagpage/login.do";
	        }
	        String insertUserId = usersVO.getUserId();
	        boardCommentVO.setUserId(insertUserId);		
		    boardCommentService.insert(boardCommentVO);

	    // 요청의 Referer 헤더를 통해 이전 페이지를 확인하고, 해당 페이지로 리다이렉트
	    String referer = request.getHeader("Referer");
	    
	    // 만약 Referer가 null인 경우(예: 외부에서 직접 요청한 경우), 기본 페이지로 리다이렉트
	    if (referer == null || referer.isEmpty()) {
	        return "redirect:/hashtagpage/community/hottalk.do";  // 기본 페이지
	    }
	    
	    // 사용자가 있었던 페이지로 리다이렉트
	    return "redirect:" + referer;
	}
	@PostMapping("/boardComment/addReply.do")
	public String insert2(HttpSession session,@ModelAttribute BoardCommentVO boardCommentVO, HttpServletRequest request) {
		 UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");

	        if (usersVO == null) {
	            return "redirect:/hashtagpage/login.do";
	        }
	        String insertUserId = usersVO.getUserId();
	        boardCommentVO.setUserId(insertUserId);		
		    boardCommentService.insertReply(boardCommentVO);

	    // 요청의 Referer 헤더를 통해 이전 페이지를 확인하고, 해당 페이지로 리다이렉트
	    String referer = request.getHeader("Referer");
	    
	    // 만약 Referer가 null인 경우(예: 외부에서 직접 요청한 경우), 기본 페이지로 리다이렉트
	    if (referer == null || referer.isEmpty()) {
	        return "redirect:/hashtagpage/community/hottalk.do";  // 기본 페이지
	    }
	    
	    // 사용자가 있었던 페이지로 리다이렉트
	    return "redirect:" + referer;
	}


	@GetMapping("/boardComment/edition.do")
	public String updateBoardCommentView(Model model,
			@RequestParam String boardCommentId) {
		BoardCommentVO boardCommentVO=boardCommentService.selectBoardComment(boardCommentId);
		model.addAttribute("boardCommentVO", boardCommentVO);
		return "boardComment/update_boardComment";
	}
	@PostMapping("/boardComment/delete.do")
	public String delete(HttpSession session,HttpServletRequest request,
			@RequestParam(defaultValue = "") String boardCommentId) {
		boardCommentService.delete(boardCommentId);
		
	    // 요청의 Referer 헤더를 통해 이전 페이지를 확인하고, 해당 페이지로 리다이렉트
	    String referer = request.getHeader("Referer");
	    
	    // 만약 Referer가 null인 경우(예: 외부에서 직접 요청한 경우), 기본 페이지로 리다이렉트
	    if (referer == null || referer.isEmpty()) {
	        return "redirect:/hashtagpage/community/hottalk.do";  // 기본 페이지
	    }
	    
		return "redirect:" + referer;
	}
	@PostMapping("/boardComment/edit.do")
	public String update(HttpSession session,HttpServletRequest request,
			@ModelAttribute BoardCommentVO boardCommentVO) {
		
	    // 요청의 Referer 헤더를 통해 이전 페이지를 확인하고, 해당 페이지로 리다이렉트
	    String referer = request.getHeader("Referer");
	    
	    // 만약 Referer가 null인 경우(예: 외부에서 직접 요청한 경우), 기본 페이지로 리다이렉트
	    if (referer == null || referer.isEmpty()) {
	        return "redirect:/hashtagpage/community/hottalk.do";  // 기본 페이지
	    }	
	    
		 UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");

	        if (usersVO == null) {
	            return "redirect:/hashtagpage/login.do";
	        }
	        if (usersVO.getUserId().equals(boardCommentVO.getUserId())) {
	        	boardCommentService.update(boardCommentVO);
	        }	        				
		return "redirect:" + referer;
	}
}

