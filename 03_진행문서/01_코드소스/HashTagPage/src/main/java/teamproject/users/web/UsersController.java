/**
 * 
 */
package teamproject.users.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import org.apache.http.HttpResponse; // 이걸 사용하세요.

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j2;

import teamproject.users.service.UsersService;
import teamproject.users.service.UsersVO;

/**
 * @author ohtae
 *
 */
@Log4j2
@Controller
public class UsersController {
	// 데이터 베이스 조회하려고 만듬
	@Autowired
	private UsersService usersService;
	@Autowired
	private PasswordEncoder passwordEncoder;

//      로그인 처리
	@PostMapping("/loginProcess.do")
	public String login(HttpSession session, @ModelAttribute UsersVO loginVO, Model model, HttpServletResponse response)
			throws Exception {

//         1) DB에 입력된 유저가 있는지 확인:  서비스의 로그인 메소드 실행
		UsersVO usersVO = usersService.authenticate(loginVO);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

//         로그인할때 일치하지 않으면 에러 메세지 뜨게하기
		if (usersVO == null) {

			out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='/hashtagpage/login.do';</script>");
			out.flush();
			return null; // 뷰 리졸버 사용 안 함
		}
		// 1-2) 탈퇴한 회원일 때
		if ("Y".equals(usersVO.getUserIsDeleted())) {
			out.println("<script>alert('회원 탈퇴한 계정입니다.'); location.href='/hashtagpage/login.do';</script>");
			out.flush();
			return null;
		}

//         2) 세션을 만든다.: 유저저장(세션: 정보를 입시로 저장하는 공간: 보통 서버컴퓨터(스프링)에 저장됨)
//         사용법 : 세션.setAttribute("키", 값)
		session.setAttribute("usersVO", usersVO);
		session.setAttribute("userId", usersVO.getUserId());
//            (DB는 영구적)vs (세션은 임시저장, 컴퓨터 재시작시 사라짐, 웹브라우저를 꺼도 사라짐)
//         2-2) 보안코딩 : CSRF(사이트 위조) 공격 방어: 인증 토큰(세션)
//         session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());
//         3) 통과: 이동할 페이지 강제이동
		return "redirect:/";// 홈으로 강제이동

	}

//      로그아웃 처리
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		String loginType = (String) session.getAttribute("loginType");
		if ("kakao".equals(loginType)) {
			String accessToken = (String) session.getAttribute("access_token");
			if (accessToken != null) {
				try {
					// 카카오 로그아웃 API 호출
					kakaoLogout(accessToken);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else if ("google".equals(loginType)) {
			String googleAccessToken = (String) session.getAttribute("google_access_token");
			if (googleAccessToken != null) {
				try {
					// 구글 로그아웃 API 호출 (필요하면)
					googleLogout(googleAccessToken);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

//         세션 전체 삭제
		session.invalidate(); // 세션에 들어있는것을 무효화한다는 뜻
		return "redirect:/hashtagpage/login.do";
	}

	// 카카오 로그아웃 API 호출 메서드
	private void kakaoLogout(String accessToken) throws Exception {
		String reqUrl = "https://kapi.kakao.com/v1/user/logout";

		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(reqUrl);
		post.setHeader("Authorization", "Bearer " + accessToken);

		HttpResponse response = client.execute(post);
		String responseBody = EntityUtils.toString(response.getEntity());

		System.out.println("카카오 로그아웃 응답: " + responseBody);
	}

	// 구글 로그아웃 API 호출 메서드 (선택적)
	private void googleLogout(String accessToken) throws Exception {
		String reqUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken;

		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(reqUrl);

		HttpResponse response = client.execute(get);
		System.out.println("구글 로그아웃 응답 코드: " + response.getStatusLine().getStatusCode());
	}

	// 회원가입 처리
	@PostMapping("/register/addition.do")
	public String register(Model model, @ModelAttribute UsersVO usersVO) throws Exception {
//        서비스의 회원가입 메소드 실행
		log.info("테스트" + usersVO);
		usersService.register(usersVO);
//        성공메세지 JSP 전달
		model.addAttribute("msg", "회원 가입을 성공했습니다.");

		return "/modules/login";
	}

//     내 정보창에서  비밀번호 인증하기
	@PostMapping("/checkPassword.do")
	@ResponseBody
	public Map<String, Boolean> checkPassword(@RequestBody Map<String, String> payload, HttpSession session) {
		String inputPassword = payload.get("password");

		UsersVO loggedInUser = (UsersVO) session.getAttribute("usersVO"); // 세션 키명 확인
		if (loggedInUser == null) {
			// 로그인 안 된 상태 처리 (필요하면)
			return Map.of("valid", false);
		}

		String userId = loggedInUser.getUserId();
		UsersVO realUser = usersService.getUserById(userId);

		boolean isMatch = passwordEncoder.matches(inputPassword, realUser.getUserPw());

		return Map.of("valid", isMatch);
	}

//    비번 변경 재확인 및 변경
	@PostMapping("/updatePassword.do")
	@ResponseBody
	public Map<String, Object> updatePassword(@RequestBody Map<String, String> payload, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		try {
			String currentPassword = payload.get("currentPassword"); // 자바스크립트 key: currentPassword
			String newPassword = payload.get("newPassword");
			String confirmPassword = payload.get("confirmPassword");

			UsersVO loggedInUser = (UsersVO) session.getAttribute("usersVO");
			if (loggedInUser == null) {
				result.put("success", false);
				result.put("message", "로그인 정보가 없습니다.");
				return result;
			}

			UsersVO realUser = usersService.getUserById(loggedInUser.getUserId());
			String currentEncodedPassword = realUser.getUserPw();

			// 현재 비밀번호 일치 여부 확인
			if (!passwordEncoder.matches(currentPassword, currentEncodedPassword)) {
				result.put("success", false);
				result.put("message", "현재 비밀번호가 일치하지 않습니다.");
				return result;
			}

			// 새 비밀번호와 현재 비밀번호가 같은지 확인
			if (passwordEncoder.matches(newPassword, currentEncodedPassword)) {
				result.put("success", false);
				result.put("message", "현재 비밀번호와 동일합니다.");
				return result;
			}

			// 새 비밀번호와 확인 비밀번호가 일치하는지 확인
			if (!newPassword.equals(confirmPassword)) {
				result.put("success", false);
				result.put("message", "변경할 비밀번호가 일치하지 않습니다.");
				return result;
			}

			// 새 비밀번호 암호화 및 DB 업데이트
			String encodedPassword = passwordEncoder.encode(newPassword);
			loggedInUser.setUserPw(encodedPassword);
			usersService.updatePassword(loggedInUser);

			// 세션에 최신 정보 업데이트
			session.setAttribute("usersVO", loggedInUser);

			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("message", "비밀번호 변경 중 오류가 발생했습니다.");
		}
		return result;
	}
//	아이디 중복체크
	 @GetMapping("/checkId.do")
	    @ResponseBody
	    public Map<String, Boolean> checkUserId(@RequestParam("userId") String userId) {
	        boolean isAvailable = usersService.isUserIdAvailable(userId);
	        return Map.of("available", isAvailable);
	    }
//	 닉네임 변경
	// 닉네임 변경
	 @PostMapping("/updateNickname.do")
	 @ResponseBody
	 public Map<String, Object> updateNickname(@RequestBody Map<String, String> payload, HttpSession session) {
	     Map<String, Object> result = new HashMap<>();

	     try {
	         // 1. 세션에서 로그인된 사용자 정보 가져오기
	         UsersVO loginUser = (UsersVO) session.getAttribute("usersVO");
	         if (loginUser == null) {
	             result.put("success", false);
	             result.put("message", "로그인 정보가 없습니다.");
	             return result;
	         }

	         // 2. 변경할 닉네임 꺼내기
	         String newNickname = payload.get("nickname");

	         // 3. 닉네임 업데이트할 객체 생성
	         UsersVO updateUser = new UsersVO();
	         updateUser.setUserId(loginUser.getUserId());
	         updateUser.setUserName(newNickname);

	         // 4. DB 업데이트
	         usersService.updateNickname(updateUser);

	         // 5. 세션 값도 최신화
	         loginUser.setUserName(newNickname);
	         session.setAttribute("usersVO", loginUser);

	         result.put("success", true);
	     } catch (Exception e) {
	         e.printStackTrace();
	         result.put("success", false);
	         result.put("message", "닉네임 변경 중 오류가 발생했습니다.");
	     }

	     return result;
	 }

	 

//		회원탈퇴
	@PostMapping("/user/delete.do")
	public String deleteUser(HttpSession session, RedirectAttributes redirectAttributes) {
		// 세션에서 로그인 사용자 키를 정확히 맞춰주세요
		UsersVO loginUser = (UsersVO) session.getAttribute("usersVO");
		if (loginUser != null) {
			usersService.deactivateUser(loginUser.getUserId());
			session.invalidate(); // 세션 초기화 - 로그아웃 처리
			redirectAttributes.addFlashAttribute("message", "정상적으로 탈퇴 처리되었습니다.");
		}
		// 탈퇴 후 홈 또는 로그인 페이지로 리다이렉트 (원하는 페이지로 수정 가능)
		return "redirect:/hashtagpage/login.do";
	}
//	핸드폰 등록
	@PostMapping("/updatePhone.do")
	@ResponseBody
	public Map<String, Object> updatePhone(@RequestBody Map<String, String> payload, HttpSession session) {
	    Map<String, Object> result = new HashMap<>();

	    String newPhone = payload.get("phone");
	    UsersVO loginUser = (UsersVO) session.getAttribute("usersVO");

	    if (loginUser == null) {
	        result.put("success", false);
	        result.put("message", "로그인이 필요합니다.");
	        return result;
	    }

	    loginUser.setUserPhone(newPhone);
	    boolean updateSuccess = usersService.updateUserPhone(loginUser);

	    if (updateSuccess) {
	        session.setAttribute("usersVO", loginUser); // 세션 갱신
	        result.put("success", true);
	    } else {
	        result.put("success", false);
	        result.put("message", "전화번호 업데이트 실패");
	    }

	    return result;
	}


}