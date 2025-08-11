/**
 * 
 */
package teamproject.userpoint.service;

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
public class UserPointVO extends Criteria {
	private String userPointId; //포인트 기록번호 기본키
	private String userId;// 사용자 Id 외래키
	private String paymentId;// 결제 번호
	private String totalPoint; //실시간 보유 포인트
	private String pointChange; //변동포인트
	private String pointType;//적립/차감/환불 등
	private String pointDescription; //간단한 이유
	private String pointCreatedAt;//포인트 변경 시각
	
}
