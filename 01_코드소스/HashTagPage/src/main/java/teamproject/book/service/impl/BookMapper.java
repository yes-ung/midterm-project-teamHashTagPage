package teamproject.book.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.book.service.BookVO;
import teamproject.common.Criteria;

@Mapper
public interface BookMapper {
	public List<BookVO> selectAllBooks(); // 전체조회 
	public List<?> selectBookList(Criteria criteria); // 검색조회 
	public List<?> selectTop10List(Criteria criteria); // top10 
	public List<?> selectTrendList(Criteria criteria); // 급상승 트렌드 
	public int selectBookListTotCnt(Criteria criteria); // 총 개수 구하기
	public BookVO selectBook(String bookId);           // bookId로 책 한권에 대한 정보 받아오기
	public int insert(BookVO bookVO);                // 추가 
	public String update(BookVO bookVO);                // 수정 
	public int delete(BookVO bookVO);					//삭제
}
