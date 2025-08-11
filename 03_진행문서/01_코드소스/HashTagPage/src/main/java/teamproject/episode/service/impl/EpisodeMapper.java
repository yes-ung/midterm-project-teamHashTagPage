package teamproject.episode.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.common.Criteria;
import teamproject.episode.service.EpisodeVO;
import teamproject.series.service.SeriesVO;

@Mapper
public interface EpisodeMapper {
	public List<EpisodeVO> selectAllEpisode(); // 전체조회
	public List<?> selectEpisodeBySeriesId(String seriesId);// 해당작품에 해당하는 회차 다 가져오기
	
	
	public List<?> selectEpisodeList(Criteria criteria);//검색조회
	public int selectEpisodeListTotCnt(Criteria criteria); // 총 개수 구하기
	public EpisodeVO selectEpisode(@Param("seriesId") String seriesId,
		    @Param("episodeId") String episodeId);//상세조회
	public int insert(EpisodeVO episodeVO);//insert
	public String update(EpisodeVO episodeVO);//update메소드
	public int delete(EpisodeVO episodeVO);//DELETE메소드
}