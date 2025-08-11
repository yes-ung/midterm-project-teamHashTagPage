package teamproject.boardComment.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.boardComment.service.BoardCommentService;
import teamproject.boardComment.service.BoardCommentVO;
import teamproject.common.Criteria;

@Service
public class BoardCommentServiceImpl implements BoardCommentService{
	
	@Autowired
	private BoardCommentMapper boardCommentMapper;
	
	
	
	

	
	
	@Override
	public int insertReply(BoardCommentVO boardCommentVO) {
		// TODO Auto-generated method stub
		return boardCommentMapper.insertReply(boardCommentVO);
	}

	@Override
	public List<?> selectBoardCommentListByPostId(String postId) {
		// TODO Auto-generated method stub
		return boardCommentMapper.selectBoardCommentListByPostId(postId);
	}

	@Override
	public List<?> selectBoardCommentList(Criteria criteria) {
		// TODO Auto-generated method stub
		return boardCommentMapper.selectBoardCommentList(criteria);
	}

	@Override
	public int selectBoardCommentListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return boardCommentMapper.selectBoardCommentListTotCnt(criteria);
	}

	@Override
	public BoardCommentVO selectBoardComment(String boardCommentId) {
		// TODO Auto-generated method stub
		return boardCommentMapper.selectBoardComment(boardCommentId);
	}

	@Override
	public int insert(BoardCommentVO boardCommentVO) {
		// TODO Auto-generated method stub
		return boardCommentMapper.insert(boardCommentVO);
	}

	@Override
	public int update(BoardCommentVO boardCommentVO) {
		// TODO Auto-generated method stub
		return boardCommentMapper.update(boardCommentVO);
	}

	@Override
	public int delete(String boardCommentId) {
		// TODO Auto-generated method stub
		return boardCommentMapper.delete(boardCommentId);
	}
	
}
