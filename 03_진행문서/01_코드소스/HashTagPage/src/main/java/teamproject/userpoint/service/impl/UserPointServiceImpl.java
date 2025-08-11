/**
 * 
 */
package teamproject.userpoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.common.Criteria;
import teamproject.userpoint.service.UserPointService;
import teamproject.userpoint.service.UserPointVO;

/**
 * @author user
 *
 */
@Service
public class UserPointServiceImpl implements UserPointService{
//	Mapper 가져오기
	@Autowired
	private UserPointMapper userPointMapper;

//	전체 조회
	@Override
	public List<?> selectUserPointList(Criteria criteria) {
		// TODO Auto-generated method stub
		return userPointMapper.selectUserPointList(criteria);
	}

//	총 개수 구하기
	@Override
	public int selectUserPointListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return userPointMapper.selectUserPointListTotCnt(criteria);
	}

//	부서 insert
	@Override
	public int insert(UserPointVO userPointVO) {
		// TODO Auto-generated method stub
		return userPointMapper.insert(userPointVO);
	}

//	상세조회
	@Override
	public UserPointVO selectUserPoint(String userPointId) {
		// TODO Auto-generated method stub
		return userPointMapper.selectUserPoint(userPointId);
	}

//	수정
	@Override
	public int update(UserPointVO userPointVO) {
		// TODO Auto-generated method stub
		return userPointMapper.update(userPointVO);
	}

//	삭제
	@Override
	public int delete(UserPointVO userPointVO) {
		// TODO Auto-generated method stub
		return userPointMapper.delete(userPointVO);
	}
}
