/**
 * 
 */
package teamproject.author.service;

import java.util.List;

import teamproject.common.Criteria;

/**
 * @author user
 *
 */
public interface AuthorService {
	 List<?> selectAuthorList(Criteria criteria);   // 전체 조회 
	 int selectAuthorListTotCnt(Criteria criteria); // 총 개수 구하기
	 int insert(AuthorVO authorVO);                   // 부서 insert 
	 AuthorVO selectAuthor(String authorId);                  // 상세조회
	 int update(AuthorVO authorVO);                   // update 메소드
	 int delete(AuthorVO authorVO);                   // delete 메소드
}
