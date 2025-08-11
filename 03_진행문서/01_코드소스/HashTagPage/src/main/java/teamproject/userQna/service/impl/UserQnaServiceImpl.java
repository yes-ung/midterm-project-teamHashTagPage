/**
 * 
 */
package teamproject.userQna.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.common.Criteria;
import teamproject.userQna.service.UserQnaService;
import teamproject.userQna.service.UserQnaVO;

/**
 * @author user
 *
 */
@Service
public class UserQnaServiceImpl implements UserQnaService{
	@Autowired
	private UserQnaMapper userQnaMapper;

//	전체 조회
	@Override
	public List<?> selectUserQnaList(Criteria criteria) {
		// TODO Auto-generated method stub
		return userQnaMapper.selectUserQnaList(criteria);
	}
//	총 개수 구하기
	@Override
	public int selectUserQnaListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return userQnaMapper.selectUserQnaListTotCnt(criteria);
	}
//	insert
	@Override
	public int insert(UserQnaVO userQnaVO) {
		// TODO Auto-generated method stub
		return userQnaMapper.insert(userQnaVO);
	}
//	상세조회
	@Override
	public UserQnaVO selectUserQna(String userId) {
		// TODO Auto-generated method stub
		return userQnaMapper.selectUserQna(userId);
	}
//	수정
	@Override
	public int update(UserQnaVO userQnaVO) {
		// TODO Auto-generated method stub
		return userQnaMapper.update(userQnaVO);
	}
//	삭제
	@Override
	public int delete(UserQnaVO userQnaVO) {
		// TODO Auto-generated method stub
		return userQnaMapper.delete(userQnaVO);
	}
	
//	개인문의 상세 조회
	@Override
	public List<UserQnaVO> selectUserMyQnaList(String userId,Criteria criteria) {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    paramMap.put("firstIndex", criteria.getFirstIndex());
	    paramMap.put("pageUnit", criteria.getPageUnit());

	    return userQnaMapper.selectUserMyQnaList(paramMap);
	}
	@Override
	public int selectUserMyQnaListTotCnt(String userId) {
	    return userQnaMapper.selectUserMyQnaListTotCnt(userId);
	}
	
	
}
