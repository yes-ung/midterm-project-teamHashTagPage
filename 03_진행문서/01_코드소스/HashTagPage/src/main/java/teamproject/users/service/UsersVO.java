/**
 * 
 */
package teamproject.users.service;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import teamproject.common.Criteria;

/**
 * @author ohtae
 *
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class UsersVO  extends Criteria{
	private String userId;				//회원 아이디
	private String userEmail;			//회원 이메일
	private String userPw;				//회원 비번
	private String userName;			//회원 이름
	private String joinDate;			//회원 가입날짜
	private String userIsDeleted;		//회원 탈되 여부(Y/N)
	private String userDeletedAt;		//회원 탈퇴 날짜
	private String userRole;			//관리자와 일반유저를 구분하는 값
	private String userPhone;  			//폰 번호
	
	
	private String loginType; // "normal", "kakao"
	
}
