/**
 * 
 */
package teamproject.users.service.impl;

import java.time.LocalDate;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;
import teamproject.users.service.UsersService;
import teamproject.users.service.UsersVO;

/**
 * @author ohtae
 *
 */
@Log4j2
@Service
public class UsersServiceImpl extends EgovAbstractServiceImpl implements UsersService {
	@Autowired
	@Qualifier("naverMailSender")
	private JavaMailSender naverMailSender;

	@Autowired
	@Qualifier("googleMailSender")
	private JavaMailSender googleMailSender;

	@Autowired
	private UsersMapper usersMapper;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@PostConstruct
	public void checkMailSender() {
		if (naverMailSender != null && googleMailSender != null) {
			log.info("메일 전송기(Naver/Gmail) 빈 주입 성공");
		} else {
			log.warn("메일 전송기 빈 주입 실패");
		}
	}

//   로그인
	@Override
	public UsersVO authenticate(UsersVO loginVO) throws Exception {
		log.info("테스트 : " + loginVO);
		// 1) DB에 사용자가 있는지 확인: loginVO(id,암호)
		UsersVO usersVO = usersMapper.authenticate(loginVO);
//               2) 만약 회원이 없으면 -> 회원이 없습니다.(예외처리: 전자정부용)
//                => 전자정부: 1) EgovAbstractServiceImpl 상속
//                          2) 
		if (usersVO == null) {
			log.info("1");
			return null;
		}
//               3) 회원이 있으면 암호체크 -> 암호틀림(예외처리)
		if (usersVO != null) {
			log.info("2");
//               사용법: BCrypt.checkpw(화면유저암호, DB유저암호); // 같으면 true, 아니면 false
			boolean isMatchedPassword = BCrypt.checkpw(loginVO.getUserPw(), usersVO.getUserPw());
			if (isMatchedPassword == false)
				return null;
		}
//               4) 모두 통과하면 마지막에 memberVO 리턴 
		return usersVO;
	}

//   회원가입
	@Override
	public void register(UsersVO usersVO) throws Exception {
		log.info("테스트: " + usersVO);
//      1) DB에 회원이 있는지 확인을 먼저 한다:
		UsersVO cmemberVO = usersMapper.authenticate(usersVO);
		log.info("테스트2");
//         2) 있으면(예외처리한다)
		if (cmemberVO != null)
			throw processException("errors.register");
//         3) 입력된 암호를 => 해싱암호화 처리한다.
//       사용법: BCrypt.hashpw(암호,옵션);
		log.info("테스트3");
		String hashedPassword = BCrypt.hashpw(usersVO.getUserPw(), BCrypt.gensalt());
		log.info("테스트4");
//         4) 암호를 memberVO 에 저장한다(setter)
		usersVO.setUserPw(hashedPassword);
//         5) DB 저장
		log.info("테스트5");
		usersMapper.register(usersVO);

	}

//   아이디 찾기
	@Override
	public String findIdByNameAndEmail(String userName, String userEmail) {
		return usersMapper.findIdByNameAndEmail(userName, userEmail);
	}

// 비밀번호 재설정 및 이메일 전송
	@Override
	public boolean resetPasswordAndSendEmail(String userId, String userEmail) {
		// 1. 아이디 & 이메일로 사용자 조회
		UsersVO user = usersMapper.selectByIdAndEmail(userId, userEmail);

		if (user == null) {
			return false; // 사용자 없음
		}

		// 2. 임시 비밀번호 생성
		String tempPassword = UUID.randomUUID().toString().substring(0, 8);

		// 3. 비밀번호 암호화 후 DB 업데이트
		String encodedPassword = passwordEncoder.encode(tempPassword);
		user.setUserPw(encodedPassword);
		usersMapper.updatePassword(userId, encodedPassword);

		// 4. 이메일 내용 구성
		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(userEmail);
		message.setSubject("[비밀번호 재설정 안내]");
		message.setText("임시 비밀번호는: " + tempPassword + "\n로그인 후 반드시 변경해주세요.");

		// 5. 어떤 메일 발송기를 사용할지 선택 (이메일 도메인 기준)
		JavaMailSender mailSenderToUse;

		// 메일 발송기 선택 후 from 설정도 동적으로
		if (userEmail.endsWith("@naver.com")) {
			mailSenderToUse = naverMailSender;
			message.setFrom("otk4239@naver.com");
		} else if (userEmail.endsWith("@gmail.com")) {
			mailSenderToUse = googleMailSender;
			message.setFrom("ohtae4239@gmail.com");
		} else {
			return false;
		}

		try {
			mailSenderToUse.send(message);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

//   카카오 로그인
	@Override
	public UsersVO findOrCreateKakaoUser(String userEmail, String userName) {
		UsersVO user = usersMapper.findByEmail(userEmail);

		if (user != null) {
			return user;
		}

		// 신규 회원 생성
		UsersVO newUser = new UsersVO();
		newUser.setUserId("kakao_" + UUID.randomUUID().toString().substring(0, 8));
		newUser.setUserEmail(userEmail);
		newUser.setUserName(userName);
		newUser.setUserPw(UUID.randomUUID().toString()); // 비번은 더미값
		newUser.setJoinDate(LocalDate.now().toString());
		newUser.setUserIsDeleted("N");
		newUser.setUserRole("U");
		newUser.setLoginType("kakao");

		usersMapper.insertUser(newUser);
		return newUser;
	}

// 구글 로그인
	@Override
    public UsersVO findOrCreateGoogleUser(String userEmail, String userName) {
        UsersVO user = usersMapper.findByEmail(userEmail);

        if (user != null) {
            return user;
        }

        UsersVO newUser = new UsersVO();
        newUser.setUserId("google_" + UUID.randomUUID().toString().substring(0, 8));
        newUser.setUserEmail(userEmail);
        newUser.setUserName(userName);
        newUser.setUserPw(UUID.randomUUID().toString()); // 더미 비밀번호
        newUser.setJoinDate(LocalDate.now().toString());
        newUser.setUserIsDeleted("N");
        newUser.setUserRole("U");
        newUser.setLoginType("google");

        usersMapper.insertUser(newUser);
        return newUser;
    }
	@Override
    public UsersVO selectUserByEmail(String userEmail) {
        return usersMapper.findByEmail(userEmail);
    }

    @Override
    public void insertUser(UsersVO user) {
        usersMapper.insertUser(user);
    }
    @Override
    public UsersVO getUserById(String userId) {
        return usersMapper.getUserById(userId);
    }
    @Override
    public void updatePassword(UsersVO usersVO) throws Exception {
        usersMapper.updatePassword(usersVO);
    }
//    회원탈퇴
    @Override
    public void deactivateUser(String userId) {
        usersMapper.deactivateUser(userId);
    }
//    아이디 중복체크
    @Override
    public boolean isUserIdAvailable(String userId) {
        return usersMapper.countUserId(userId) == 0;
    }
//    닉네임 변경
    public void updateNickname(UsersVO user) {
        usersMapper.updateNickname(user);
    }
//    핸드폰 등록
    @Override
    public boolean updateUserPhone(UsersVO user) {
        return usersMapper.updateUserPhone(user) > 0;
    }
    
    
}
