package teamproject.boardPost.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.boardPost.service.BoardPostService;
import teamproject.boardPost.service.BoardPostVO;
import teamproject.common.Criteria;

@Service
public class BoardPostServiceImpl implements BoardPostService{
	@Autowired
	private BoardPostMapper boardPostMapper;
	
	
	
	
	
	
	
	
	
	
	@Override
	public int selectBoardPostListRecomTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return boardPostMapper.selectBoardPostListRecomTotCnt(criteria);
	}

	@Override
	public List<?> selectBoardPostListRecom(Criteria criteria) {
		// TODO Auto-generated method stub
		return boardPostMapper.selectBoardPostListRecom(criteria);
	}

	@Override
	public int insertFree(BoardPostVO boardPostVO) {
		// TODO Auto-generated method stub
		return boardPostMapper.insertFree(boardPostVO);
	}

	@Override
	public int insertRecom(BoardPostVO boardPostVO) {
		// TODO Auto-generated method stub
		return boardPostMapper.insertRecom(boardPostVO);
	}

	@Override
	public int updateViews(String postId) {
		// TODO Auto-generated method stub
		return boardPostMapper.updateViews(postId);
	}

	@Override
	public List<?> selectBoardPostList(Criteria criteria) {
		// TODO Auto-generated method stub
		return boardPostMapper.selectBoardPostList(criteria);
	}

	@Override
	public int selectBoardPostListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return boardPostMapper.selectBoardPostListTotCnt(criteria);
	}

	@Override
	public BoardPostVO selectBoardPost(String postId) {
		// TODO Auto-generated method stub
		return boardPostMapper.selectBoardPost(postId);
	}

	
	@Override
	public int update(BoardPostVO boardPostVO) {
		// TODO Auto-generated method stub
		return boardPostMapper.update(boardPostVO);
	}

	@Override
	public int delete(String postId) {
		// TODO Auto-generated method stub
		return boardPostMapper.delete(postId);
	}
	
}
