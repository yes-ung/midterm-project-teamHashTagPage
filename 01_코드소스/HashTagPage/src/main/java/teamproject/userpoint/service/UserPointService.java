/**
 * 
 */
package teamproject.userpoint.service;

import java.util.List;

import teamproject.common.Criteria;

/**
 * @author user
 *
 */
public interface UserPointService {
	 List<?> selectUserPointList(Criteria criteria);   // 전체 조회 
	 int selectUserPointListTotCnt(Criteria criteria); // 총 개수 구하기
	 int insert(UserPointVO userPointVO);                   // 부서 insert 
	 UserPointVO selectUserPoint(String userPointId);               // 상세조회
	 int update(UserPointVO userPointVO);                   // update 메소드
	 int delete(UserPointVO userPointVO);                   // delete 메소드
}
