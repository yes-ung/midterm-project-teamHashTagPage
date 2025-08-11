package teamproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j2;
import teamproject.users.service.UsersService;
import teamproject.users.web.UsersController;

@Log4j2
@Controller
@RequestMapping("/user")
public class FindIdPw {
	
	@Autowired
    private UsersService usersService;
//  아이디 불러오기
    @PostMapping("/findId.do")
    @ResponseBody
    public String findId(@RequestParam String userName, @RequestParam String userEmail) {
        String userId = usersService.findIdByNameAndEmail(userName, userEmail);
     // 로그로 확인
        System.out.println("찾은 아이디: " + userId);
        return userId != null ? userId : "";
    }
//   비밀번호 찾기
    @PostMapping(value = "/findPw.do", produces = "text/plain; charset=UTF-8")
    @ResponseBody
    public String findPw(@RequestParam("userId") String userId,
                         @RequestParam("userEmail") String userEmail) {
  	  log.info("비번찾기");
        boolean result = usersService.resetPasswordAndSendEmail(userId, userEmail);
        if (result) {
            return "임시 비밀번호가 이메일로 전송되었습니다.";
            
        } else {
            return "아이디 또는 이메일이 일치하지 않습니다.";
        }
        
    }

}
