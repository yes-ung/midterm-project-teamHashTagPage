/**
 * 
 */
package teamproject.userpoint.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.common.Criteria;
import teamproject.userpoint.service.UserPointVO;

/**
 * @author user
 *
 */
@Mapper
public interface UserPointMapper {
	public List<?> selectUserPointList(Criteria criteria);   // 전체 조회 
	public int selectUserPointListTotCnt(Criteria criteria); // 총 개수 구하기
	public int insert(UserPointVO userPointVO);                   // 부서 insert 
	public UserPointVO selectUserPoint(String userPointId);                  // 상세조회
	public int update(UserPointVO userPointVO);                   // update 메소드
	public int delete(UserPointVO userPointVO);                   // delete 메소드
}
