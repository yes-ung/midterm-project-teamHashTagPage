package teamproject.series.service;

import java.util.List;
import java.util.Map;

import teamproject.common.Criteria;

public interface SeriesService {
	List<SeriesVO> selectAllSeries(); // 전체조회 
	List<?> selectGenre10Series(String genre);      // 장르별 10개 불러오기
	List<?> selectGenre10SeriesNovel(String genre);      // 소설만 장르별 10개 불러오기	
	List<?> selectGenre10SeriesToon(String genre);      // 만화만 장르별 10개 불러오기	
	List<?> selectGenre10SeriesNovelNew(String genre);      // 소설만 장르별 10개 최근 추가한걸로 불러오기	
	List<?> selectGenre10SeriesToonNew(String genre);      // 만화만 장르별 10개 최근 추가한걸로 불러오기
	List<?> selectGenre10SeriesNovelRandom(String genre);      // 소설만 장르별 10개 랜덤하게 불러오기	
	List<?> selectGenre10SeriesToonRandom(String genre);      // 만화만 장르별 10개 랜덤하게 불러오기
	String selectPublisherIdBySeries(String seriesId); // 해당 시리즈의 출판사 관리번호 불러오기
	List<?> searchSeriesByPublisherId(String publisherId);      // 출판사ID로 검색	
	List<?> searchSeriesByAuthorId(String authorId);      // 작가ID로 검색
	List<?> searchSeriesByAll(String search); // 제목,작가,출판사 등 모든걸로 검색
	
	List<?> selectSeriesList(Criteria criteria); // 전체조회 
	List<?> selectTop10List(Criteria criteria); // top10 
	List<?> selectTrendList(Criteria criteria); // 급상승 트렌드 
	int selectSeriesListTotCnt(Criteria criteria);
	SeriesVO selectSeries(String seriesId);        // bookId로 책 한권에 대한 정보 받아오기 
	int insert(SeriesVO seriseVO);                // 추가 
	String update(SeriesVO seriseVO);                // 수정 
	int delete(SeriesVO seriseVO);					//삭제
}
