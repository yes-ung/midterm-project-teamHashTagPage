package teamproject.series.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.common.Criteria;
import teamproject.series.service.SeriesVO;

@Mapper
public interface SeriesMapper {
	 public List<SeriesVO> selectAllSeries(); // 전체조회
	 public List<?> selectGenre10Series(Map<String, Object> paramMap);      // 소설,만화 모두에서 장르별 10개 불러오기
	 public List<?> selectGenre10SeriesNovel(Map<String, Object> paramMap);      // 소설만 장르별 10개 불러오기	
	 public List<?> selectGenre10SeriesToon(Map<String, Object> paramMap);      // 만화만 장르별 10개 불러오기
	 public List<?> selectGenre10SeriesNovelNew(Map<String, Object> paramMap);      // 소설만 장르별 10개 최근 추가한걸로 불러오기	
	 public List<?> selectGenre10SeriesToonNew(Map<String, Object> paramMap);      // 만화만 장르별 10개 최근 추가한걸로 불러오기
	 public List<?> selectGenre10SeriesNovelRandom(Map<String, Object> paramMap);      // 소설만 장르별 10개 최근 추가한걸로 불러오기	
	 public List<?> selectGenre10SeriesToonRandom(Map<String, Object> paramMap);      // 만화만 장르별 10개 최근 추가한걸로 불러오기
	 public String selectPublisherIdBySeries(String seriesId); // 해당 시리즈의 출판사 관리번호 불러오기
	 public List<?> searchSeriesByPublisherId(String publisherId);      // 출판사ID로 검색	
	 public List<?> searchSeriesByAuthorId(String authorId);      // 작가ID로 검색
	 public List<?> searchSeriesByAll(String search); // 제목,작가,출판사 등 모든걸로 검색
	 
	 public List<?> selectSeriesList(Criteria criteria); // 전체조회 
	 public List<?> selectTop10List(Criteria criteria); // top10 
	 public List<?> selectTrendList(Criteria criteria); // 급상승 트렌드 
	 public int selectSeriesListTotCnt(Criteria criteria);
	 public SeriesVO selectSeries(String seriesId);        // bookId로 책 한권에 대한 정보 받아오기 
	 public int insert(SeriesVO seriseVO);                // 추가 
	 public String update(SeriesVO seriseVO);                // 수정 
	 public int delete(SeriesVO seriseVO);					//삭제
}    
