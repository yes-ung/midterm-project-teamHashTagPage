/**
 * 
 */
package teamproject.users.service.impl;



import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.users.service.UsersService;
import teamproject.users.service.UsersVO;

/**
 * @author ohtae
 *
 */
@Mapper
public interface UsersMapper {
	public UsersVO authenticate(UsersVO loginVO); //로그인
	public void register(UsersVO usersVO); // 회원가입
//	비번 찾기
	String findIdByNameAndEmail(@Param("userName") String userName, @Param("userEmail") String userEmail);
	UsersVO selectByIdAndEmail(@Param("userId") String userId, @Param("userEmail") String userEmail);
	void updatePassword(@Param("userId") String userId, @Param("userPw") String encodedPw);
	
	UsersVO findByEmail(String userEmail);
    void insertUser(UsersVO user);
    
    UsersVO getUserById(String userId);
 // 비밀번호만 확인할 용도(선택적)
    String getPasswordByUserId(@Param("userId") String userId);
//  변경 할 비번 재확인 및 수정
    void updatePassword(UsersVO usersVO) throws Exception;
//    회원 탈퇴
    public void deactivateUser(String userId);
//    아이디 중복체크
    int countUserId(String userId);
//	닉네임 변경
    void updateNickname(UsersVO user);
//   헨드폰 등록
    int updateUserPhone(UsersVO user);


    



}
