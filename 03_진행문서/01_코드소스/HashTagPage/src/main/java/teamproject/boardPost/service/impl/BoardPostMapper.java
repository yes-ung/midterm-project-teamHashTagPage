package teamproject.boardPost.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.boardPost.service.BoardPostVO;
import teamproject.common.Criteria;

@Mapper
public interface BoardPostMapper {
	public int updateViews(String postId);   // DB 조회수 증가	
	public List<?> selectBoardPostListRecom(Criteria criteria); // 작품추천 조회 
	public int selectBoardPostListRecomTotCnt(Criteria criteria); // 자유게시판 총 개수 구하기
		
	public List<?> selectBoardPostList(Criteria criteria); // 자유게시판 조회 
	public int selectBoardPostListTotCnt(Criteria criteria); // 자유게시판 총 개수 구하기
	public BoardPostVO selectBoardPost(String postId);               // 상세조회
	public int insertFree(BoardPostVO boardPostVO);                // 자유 게시판 추가 
	public int insertRecom(BoardPostVO boardPostVO);               // 작품추천 추가 
	public int update(BoardPostVO boardPostVO);                // 수정 
	public int delete(String postId);					//삭제
}
