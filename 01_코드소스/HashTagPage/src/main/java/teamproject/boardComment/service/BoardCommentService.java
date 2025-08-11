package teamproject.boardComment.service;

import java.util.List;

import teamproject.common.Criteria;

public interface BoardCommentService {
	List<?> selectBoardCommentListByPostId(String postId); //해당게시판 댓글조회 
	int insertReply(BoardCommentVO boardCommentVO);  //대댓글 추가하기
	
	
	List<?> selectBoardCommentList(Criteria criteria); // 전체조회 
	int selectBoardCommentListTotCnt(Criteria criteria); // 총 개수 구하기
	BoardCommentVO selectBoardComment(String boardCommentId);               // 상세조회
	int insert(BoardCommentVO boardCommentVO);                // 추가 
	int update(BoardCommentVO boardCommentVO);                // 수정 
	int delete(String boardCommentId);					//삭제
}
