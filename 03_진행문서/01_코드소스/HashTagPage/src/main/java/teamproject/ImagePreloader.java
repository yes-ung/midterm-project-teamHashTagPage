package teamproject;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import teamproject.book.service.BookService;
import teamproject.book.service.BookVO;
import teamproject.episode.service.EpisodeService;
import teamproject.episode.service.EpisodeVO;
import teamproject.series.service.SeriesService;
import teamproject.series.service.SeriesVO;

@Component
public class ImagePreloader{
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private SeriesService seriesService;
	
	@Autowired
	private EpisodeService episodeService;
	
	@Autowired
	private ImageCache imageCache;
	

	// 10분마다 실행 (fixedDelay: 이전 작업이 끝난 후 10분 대기)
    @Scheduled(fixedDelay = 10 * 60 * 1000)
	@PostConstruct
    public void loadAllImages() {
        List<BookVO> allBooks = bookService.selectAllBooks(); // 전체 책 조회 메서드 필요
        for (BookVO book : allBooks) {
            if (book.getThumbnailImg() != null) {
            	imageCache.putThumbnail(book.getBookId(), book.getThumbnailImg());
            }
            if (book.getToonImg() != null) {
            	imageCache.putContent(book.getBookId(), book.getToonImg());
            }
        }
        List<SeriesVO> allSeries = seriesService.selectAllSeries(); // 전체 책 조회 메서드 필요
        for (SeriesVO book : allSeries) {
            if (book.getThumbnailImg() != null) {
            	imageCache.putThumbnail("Series"+book.getSeriesId(), book.getThumbnailImg());
            }          
        }  
        List<EpisodeVO> allEpisode = episodeService.selectAllEpisode(); // 전체 책 조회 메서드 필요
        for (EpisodeVO book : allEpisode) {
            if (book.getThumbnailImg() != null) {
            	imageCache.putThumbnail("Series"+book.getSeriesId()+"Episode"+book.getEpisodeId(), book.getThumbnailImg());
            }
            if (book.getViewImg() != null) {
            	imageCache.putContent("Series"+book.getSeriesId()+"Episode"+book.getEpisodeId(), book.getViewImg());
            }
        }
        System.out.println("이미지 캐시 완료: " + allBooks.size() + "단행본, " + allSeries.size() + "시리즈, "+ allEpisode.size() + "에피소드, ");        
    
    }
	
	
}