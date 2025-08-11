package teamproject.episode.service;

import java.util.List;

import teamproject.common.Criteria;

public interface EpisodeService {
	List<EpisodeVO> selectAllEpisode(); // 전체조회
	List<?> selectEpisodeBySeriesId(String seriesId);// 해당작품에 해당하는 회차 다 가져오기
	
	List<?> selectEpisodeList(Criteria criteria);//전체조회
	int selectEpisodeListTotCnt(Criteria criteria); // 총 개수 구하기
	EpisodeVO selectEpisode(String seriesId,String episodeId);//상세조회
	int insert(EpisodeVO episodeVO);//insert
	String update(EpisodeVO episodeVO);//update메소드
	int delete(EpisodeVO episodeVO);//DELETE메소드
}
