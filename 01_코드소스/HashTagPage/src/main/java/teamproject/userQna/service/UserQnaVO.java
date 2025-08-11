/**
 * 
 */
package teamproject.userQna.service;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import teamproject.common.Criteria;

/**
 * @author user
 *
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class UserQnaVO extends Criteria{
	private String userQnaId;       // 개인문의 식별번호
	private String userId;			// 회원 아이디
	private String userQnaTitle;	//개인문의 제목
	private String userQnaContent;	//개인문의 내용
	private String adminAnswer;		//관리자 답변
	private String adminId;			//관리자 아이디
	private String userQnaAt;		//회원 개인문의 쓴 날짜
	private String adminAnswerAt;	//관리자 답변 쓴 날짜
}
