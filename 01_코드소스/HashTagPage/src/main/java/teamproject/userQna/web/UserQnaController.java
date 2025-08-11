/**
 * 
 */
package teamproject.userQna.web;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j2;
import teamproject.common.Criteria;
import teamproject.userQna.service.UserQnaService;
import teamproject.userQna.service.UserQnaVO;
import teamproject.users.service.UsersVO;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class UserQnaController {
//	서비스 가져오기
	@Autowired
	private UserQnaService userQnaService;
	
//	전체조회
	@GetMapping("/userQna.do")
	public String selectUserQnaList(@ModelAttribute Criteria criteria,
						Model model) {
//		1) 등차자동계산 클래스: PaginationInfo
//		   - 필요정보: (1) 현재페이지번호(pageIndex),(2) 보일 개수(pageUnit): 3
		PaginationInfo paginationInfo=new PaginationInfo();
		paginationInfo.setCurrentPageNo(criteria.getPageIndex());
		paginationInfo.setRecordCountPerPage(criteria.getPageUnit());
//		등차를 자동 계산: firstRecordIndex 필드에 있음
		criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());
		
//		전체조회 서비스 메소드 실행
		List<?> userQnas=userQnaService.selectUserQnaList(criteria);
		log.info("테스트 : "+userQnas);
		model.addAttribute("userQnas", userQnas);
		
//		페이지 번호 그리기: 페이지 플러그인(전체테이블 행 개수 필요함)
		int totCnt=userQnaService.selectUserQnaListTotCnt(criteria);
		paginationInfo.setTotalRecordCount(totCnt);
		log.info("테스트2 : "+totCnt);
//		페이지 모든 정보: paginationInfo
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "modules/mypageInquiry";
	}	
//	개인문의 조회
	@GetMapping("/userMyQna.do")
	public String selectUserMyQnaList(@ModelAttribute Criteria criteria,
						Model model,HttpServletRequest request) {
		 HttpSession session = request.getSession(false);
	        UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");

	        if (usersVO == null) {
	            return "redirect:/hashtagpage/login.do";
	        }

	        String userId = usersVO.getUserId();

	        PaginationInfo paginationInfo = new PaginationInfo();
	        paginationInfo.setCurrentPageNo(criteria.getPageIndex());
	        paginationInfo.setRecordCountPerPage(criteria.getPageUnit());
	        criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());

	        List<UserQnaVO> userMyQnas = userQnaService.selectUserMyQnaList(userId, criteria);
	        model.addAttribute("userMyQnas", userMyQnas);

	        int totCnt = userQnaService.selectUserMyQnaListTotCnt(userId);
	        paginationInfo.setTotalRecordCount(totCnt);
	        model.addAttribute("paginationInfo", paginationInfo);

	        return "modules/mypageInquiry";
	}	
	
//	insert : 전송 버튼 클릭시
	@PostMapping("/userQnasubmit.do")
	public String insert(@ModelAttribute UserQnaVO userQnaVO, HttpSession session) {
		UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");

        if (usersVO == null) {
            return "redirect:/hashtagpage/login.do";
        }

        String userId = usersVO.getUserId();

        String newUuid = UUID.randomUUID().toString();
        userQnaVO.setUserQnaId(newUuid);
        userQnaVO.setUserId(userId);

        log.info("개인문의 등록 요청: {}", userQnaVO);

        userQnaService.insert(userQnaVO);

        return "redirect:/userMyQna.do";
	}
}
