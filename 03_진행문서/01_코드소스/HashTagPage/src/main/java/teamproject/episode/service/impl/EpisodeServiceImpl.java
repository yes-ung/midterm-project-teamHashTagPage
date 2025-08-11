package teamproject.episode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.util.UriComponentsBuilder;

import teamproject.common.Criteria;
import teamproject.episode.service.EpisodeService;
import teamproject.episode.service.EpisodeVO;

@Service
public class EpisodeServiceImpl implements EpisodeService {
	
	@Autowired
	private EpisodeMapper episodeMapper;
	
	
	
	
	
	@Override
	public List<EpisodeVO> selectAllEpisode() {
		// TODO Auto-generated method stub
		return episodeMapper.selectAllEpisode();
	}

	@Override
	public List<?> selectEpisodeBySeriesId(String seriesId) {
		// TODO Auto-generated method stub
		return episodeMapper.selectEpisodeBySeriesId(seriesId);
	}

	@Override
	public List<?> selectEpisodeList(Criteria criteria) {
		// TODO Auto-generated method stub
		return episodeMapper.selectEpisodeList(criteria);
	}

	@Override
	public EpisodeVO selectEpisode(String seriesId,String episodeId) {
		// TODO Auto-generated method stub
		return episodeMapper.selectEpisode(seriesId,episodeId);
	}

	@Override
	public int selectEpisodeListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return episodeMapper.selectEpisodeListTotCnt(criteria);
	}

	@Override
	public int insert(EpisodeVO episodeVO) {
		// TODO Auto-generated method stub
		String downloadURL = generateDownloadUrl(episodeVO.getSeriesId(),episodeVO.getEpisodeId());
		String contentURL = generateContentDownloadUrl(episodeVO.getSeriesId(),episodeVO.getEpisodeId());
		episodeVO.setViewImgUrl(contentURL);
		episodeVO.setThumbnailImgUrl(downloadURL);
		return episodeMapper.insert(episodeVO);
	}
	// ServletUriComponentsBuilder.fromCurrentContextPath()    // 스프링 기본주소 가져옴: http://localhost:8080
	 public String generateDownloadUrl(String seriesId,String episodeId) {

	        return UriComponentsBuilder
	        	    .fromPath("/episode/download.do")
	        	    .queryParam("seriesId", seriesId)
	        	    .queryParam("episodeId", episodeId)
	        	    .queryParam("type", "thumbnail")
	        	    .toUriString();

	   }
	 public String generateContentDownloadUrl(String seriesId,String episodeId) {

	        return UriComponentsBuilder
	        	    .fromPath("/episode/download.do")
	        	    .queryParam("seriesId", seriesId)
	        	    .queryParam("episodeId", episodeId)
	        	    .queryParam("type", "content")
	        	    .toUriString();          
  
	   }

	@Override
	public String update(EpisodeVO episodeVO) {
		// TODO Auto-generated method stub
		return episodeMapper.update(episodeVO);
	}

	@Override
	public int delete(EpisodeVO episodeVO) {
		// TODO Auto-generated method stub
		return episodeMapper.delete(episodeVO);
	}
	
}
