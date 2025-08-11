/**
 * 
 */
package teamproject.users.service;

/**
 * @author ohtae
 *
 */
public interface UsersService {
	UsersVO authenticate(UsersVO loginVO) throws Exception; // 로그인

	void register(UsersVO usersVO) throws Exception; // 회원가입

	String findIdByNameAndEmail(String userName, String userEmail);

	boolean resetPasswordAndSendEmail(String userId, String userEmail);

//	카카오 로그인
	public UsersVO findOrCreateKakaoUser(String userEmail, String userName);

//	구글 로그인
	UsersVO findOrCreateGoogleUser(String userEmail, String userName);

	UsersVO selectUserByEmail(String userEmail); // 필요 시 사용

	void insertUser(UsersVO user); // 공통 insert
//	    비번 인증

	UsersVO getUserById(String userId);

//	    변경할 비번 확인 및 수정
	void updatePassword(UsersVO usersVO) throws Exception;

//	    회원탈퇴
	public void deactivateUser(String userId);

	// 아이디 중복 체크용 메서드 추가
	boolean isUserIdAvailable(String userId);
//	닉네임 변경
	public void updateNickname(UsersVO user);
//	핸드폰 등록
	boolean updateUserPhone(UsersVO user);

}
