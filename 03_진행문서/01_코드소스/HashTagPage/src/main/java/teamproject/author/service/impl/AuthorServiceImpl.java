/**
 * 
 */
package teamproject.author.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.author.service.AuthorService;
import teamproject.author.service.AuthorVO;
import teamproject.common.Criteria;

/**
 * @author user
 *
 */
@Service
public class AuthorServiceImpl implements AuthorService {
	
	@Autowired
	private AuthorMapper authorMapper;
//	전체조회
	@Override
	public List<?> selectAuthorList(Criteria criteria) {
		// TODO Auto-generated method stub
		return authorMapper.selectAuthorList(criteria);
	}
//	총 개수 구하기
	@Override
	public int selectAuthorListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return authorMapper.selectAuthorListTotCnt(criteria);
	}
//  insert
	@Override
	public int insert(AuthorVO authorVO) {
		// TODO Auto-generated method stub
		return authorMapper.insert(authorVO);
	}
//	상세조회
	@Override
	public AuthorVO selectAuthor(String authorId) {
		// TODO Auto-generated method stub
		return authorMapper.selectAuthor(authorId);
	}
//	수정
	@Override
	public int update(AuthorVO authorVO) {
		// TODO Auto-generated method stub
		return authorMapper.update(authorVO);
	}
//	삭제
	@Override
	public int delete(AuthorVO authorVO) {
		// TODO Auto-generated method stub
		return authorMapper.delete(authorVO);
	}

}
