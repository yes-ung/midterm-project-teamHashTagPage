package teamproject.userQna.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.common.Criteria;
import teamproject.userQna.service.UserQnaVO;

@Mapper
public interface UserQnaMapper {
	 List<UserQnaVO> selectUserMyQnaList(Map<String, Object> paramMap); 
	 int selectUserMyQnaListTotCnt(String userId);
	
	public List<?> selectUserQnaList(Criteria criteria);      // 전체 조회 
	public int selectUserQnaListTotCnt(Criteria criteria);    // 총 개수 구하기
	public int insert(UserQnaVO userQnaVO);                   // 부서 insert 
	public UserQnaVO selectUserQna(String userId);            // 상세조회
	public int update(UserQnaVO userQnaVO);                   // update 메소드
	public int delete(UserQnaVO userQnaVO);                   // delete 메소드
}
