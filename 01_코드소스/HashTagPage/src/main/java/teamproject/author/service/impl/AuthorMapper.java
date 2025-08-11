/**
 * 
 */
package teamproject.author.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.author.service.AuthorVO;
import teamproject.common.Criteria;

/**
 * @author user
 *
 */
@Mapper
public interface AuthorMapper {
	public List<?> selectAuthorList(Criteria criteria);   // 전체 조회 
	public int selectAuthorListTotCnt(Criteria criteria); // 총 개수 구하기
	public int insert(AuthorVO authorVO);                   // 부서 insert 
	public AuthorVO selectAuthor(String authorId);                  // 상세조회
	public int update(AuthorVO authorVO);                   // update 메소드
	public int delete(AuthorVO authorVO);                   // delete 메소드
}
