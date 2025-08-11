package teamproject.userQna.service;

import java.util.List;

import teamproject.common.Criteria;

public interface UserQnaService {
	 List<UserQnaVO> selectUserMyQnaList(String userId, Criteria criteria);  
	 int selectUserMyQnaListTotCnt(String userId);
	
	 List<?> selectUserQnaList(Criteria criteria);      // 전체 조회 
	 int selectUserQnaListTotCnt(Criteria criteria);    // 총 개수 구하기
	 int insert(UserQnaVO userQnaVO);                   // 부서 insert 
	 UserQnaVO selectUserQna(String userId);            // 상세조회
	 int update(UserQnaVO userQnaVO);                   // update 메소드
	 int delete(UserQnaVO userQnaVO);                   // delete 메소드
}
