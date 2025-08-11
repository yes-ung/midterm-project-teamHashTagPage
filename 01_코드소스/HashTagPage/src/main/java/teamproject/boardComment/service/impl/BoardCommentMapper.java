package teamproject.boardComment.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.boardComment.service.BoardCommentVO;
import teamproject.boardComment.service.BoardReplyCommentVO;
import teamproject.common.Criteria;

@Mapper
public interface BoardCommentMapper {
	public List<BoardCommentVO> selectBoardCommentListByPostId(String postId);
	public int insertReply(BoardCommentVO boardCommentVO);  //대댓글 추가하기
	
	
	
	
	public List<?> selectBoardCommentList(Criteria criteria); // 전체조회 
	public int selectBoardCommentListTotCnt(Criteria criteria); // 총 개수 구하기
	public BoardCommentVO selectBoardComment(String boardCommentId);               // 상세조회
	public int insert(BoardCommentVO boardCommentVO);                // 추가 
	public int update(BoardCommentVO boardCommentVO);                // 수정 
	public int delete(String boardCommentId);					//삭제
}
