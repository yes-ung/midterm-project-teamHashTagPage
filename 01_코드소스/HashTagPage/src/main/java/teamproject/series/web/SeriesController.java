package teamproject.series.web;

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

import lombok.extern.log4j.Log4j2;
import teamproject.ImageCache;
import teamproject.common.Criteria;
import teamproject.series.service.SeriesService;
import teamproject.series.service.SeriesVO;

@Log4j2
@Controller
public class SeriesController {

	@Autowired
	private SeriesService seriesService;
	
	@Autowired
	private ImageCache imageCache;
	
	@GetMapping("/adminSeries.do")
	public String selectSeriesList(@ModelAttribute Criteria criteria,
			Model model) {
//		criteria.setPageUnit(10);
		PaginationInfo paginationInfo=new PaginationInfo();
		paginationInfo.setCurrentPageNo(criteria.getPageIndex());
		paginationInfo.setRecordCountPerPage(criteria.getPageUnit());
		criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());
		List<?> series = seriesService.selectSeriesList(criteria);
		model.addAttribute("series",series);
		
		int totCnt=seriesService.selectSeriesListTotCnt(criteria);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);		
		return "admin/main";
	}
	@GetMapping("/admin/additionSeries.do")
	public String createBookView() {
		return "admin/add_series";
	}
	@PostMapping("/series/add.do")
	public String insert(@ModelAttribute SeriesVO seriesVO,
			@RequestParam(required = false) MultipartFile toonFile,
			 @RequestParam(required = false) MultipartFile thumbnailFile) throws Exception {
//		예외 처리
		byte[] thumbnailData = (thumbnailFile != null && !thumbnailFile.isEmpty())
		        ? thumbnailFile.getBytes() : null;

		   byte[] toonData = (toonFile != null && !toonFile.isEmpty())
		        ? toonFile.getBytes() : null;
		SeriesVO insertSeriesVO = new SeriesVO(seriesVO.getSeriesId(),seriesVO.getCategoryId(),seriesVO.getTypeId(),seriesVO.getSeriesTitle(),seriesVO.getSeriesPrice(),seriesVO.getSeriesDescription(),seriesVO.getThumbnailImgUrl(),seriesVO.getPublisherId(),seriesVO.getAuthorId(),thumbnailData);
		seriesService.insert(insertSeriesVO);
		return "redirect:/admin.do";
	}
	
	
	
	
	@GetMapping("/series/download.do")
	@ResponseBody
	public ResponseEntity<byte[]> fileDownload(@RequestParam(defaultValue = "") String seriesId,
	        @RequestParam(defaultValue = "thumbnail") String type) {
		SeriesVO seriesVO = seriesService.selectSeries(seriesId);
		
//		오류검사
		if (seriesVO == null) {
	        log.warn("존재하지 않는 책: " + seriesId);
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
		
		byte[] imageData;
	    String fileName;
	    
	    if ("content".equalsIgnoreCase(type)) {
	        imageData = imageCache.getContent("Series"+seriesId); // 내용 이미지
	        fileName = seriesVO.getSeriesId() + "_content.jpg";
	    } else {
	        imageData = imageCache.getThumbnail("Series"+seriesId); // 기존 썸네일
	        fileName = seriesVO.getSeriesId() + "_thumbnail.jpg";
	    }
		
//	    오류검사
	    if (imageData == null) {
	        log.warn("캐시에 이미지 없음: " + seriesId + " (" + type + ")");
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
	    
		HttpHeaders headers=new HttpHeaders();
		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<>(imageData, headers, HttpStatus.OK); 
	}
	
	
	
	@PostMapping("/series/delete.do")
	public String delete(@ModelAttribute SeriesVO seriesVO) {
		seriesService.delete(seriesVO);
		return "redirect:/admin.do";
	}
	@PostMapping("/series/edit.do")
	public String update(@ModelAttribute SeriesVO seriesVO) {
		seriesService.update(seriesVO);
		return "redirect:/admin.do";
	}
}
