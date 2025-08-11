package teamproject.episode.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import teamproject.ImageCache;
import teamproject.book.service.BookVO;
import teamproject.common.Criteria;
import teamproject.episode.service.EpisodeService;
import teamproject.episode.service.EpisodeVO;

@Controller
public class EpisodeController {
	
	@Autowired
	private EpisodeService episodeService;
	
	@Autowired
	private ImageCache imageCache;
	
	@GetMapping("/adminEpi.do")
	public String selectEpisodeList(@ModelAttribute Criteria criteria,
			Model model) {
		PaginationInfo paginationInfo=new PaginationInfo();
		paginationInfo.setCurrentPageNo(criteria.getPageIndex());
		paginationInfo.setRecordCountPerPage(criteria.getPageUnit());
		criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());
		List<?> episodes=episodeService.selectEpisodeList(criteria);
		model.addAttribute("episodes", episodes);
		int totCnt=episodeService.selectEpisodeListTotCnt(criteria);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);		
		return "admin/main";
	}
	@GetMapping("/admin/additionEpisode.do")
	public String createEpisodeView() {
		return "admin/add_episode";
	}
	
	@PostMapping("/episode/add.do")
	public String insert(@ModelAttribute EpisodeVO episodeVO,
			@RequestParam(required = false) MultipartFile thumbnailFile,
			 @RequestParam(required = false) MultipartFile toonFile) throws Exception {
//		예외 처리
		byte[] thumbnailData = (thumbnailFile != null && !thumbnailFile.isEmpty())
		        ? thumbnailFile.getBytes() : null;

		   byte[] toonData = (toonFile != null && !toonFile.isEmpty())
		        ? toonFile.getBytes() : null;
		   
		   EpisodeVO insertepisodeVO=new EpisodeVO(episodeVO.getEpisodeId(),episodeVO.getSeriesId(),episodeVO.getEpisodeTitle(),episodeVO.getEpisodePrice(),toonData,thumbnailData,episodeVO.getViewText());
		episodeService.insert(insertepisodeVO);
		return "redirect:/adminEpi.do";
		
	}
	@GetMapping("/episode/download.do")
	@ResponseBody
	public ResponseEntity<byte[]> fileDownload(@RequestParam(defaultValue = "") String episodeId,
			@RequestParam(defaultValue = "") String seriesId,
			@RequestParam(defaultValue = "thumbnail") String type) {
		EpisodeVO episodeVO=episodeService.selectEpisode(seriesId,episodeId);
		
		byte[] imageData;
	    String fileName;
	    
	    if ("content".equalsIgnoreCase(type)) {
	        imageData = imageCache.getContent("Series"+seriesId+"Episode"+episodeId); // 새로 추가된 이미지
	        fileName = episodeVO.getEpisodeId() + "_content.jpg";
	    } else {
	        imageData = imageCache.getThumbnail("Series"+seriesId+"Episode"+episodeId); // 기존 썸네일
	        fileName = episodeVO.getEpisodeId() + "_thumbnail.jpg";
	    }
		
		HttpHeaders headers=new HttpHeaders();
		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<>(imageData, headers, HttpStatus.OK); 
	}
	@PostMapping("/episode/delete.do")
	public String delete(@ModelAttribute EpisodeVO episodeVO) {
		episodeService.delete(episodeVO);
		return "redirect:/adminEpi.do";
	}
	@PostMapping("/episode/edit.do")
	public String update(@ModelAttribute EpisodeVO episodeVO) {
		episodeService.update(episodeVO);
		return "redirect:/adminEpi.do";
	}
}