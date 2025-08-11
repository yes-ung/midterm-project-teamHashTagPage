package teamproject.episode.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import teamproject.common.Criteria;

@Getter
@Setter
@AllArgsConstructor //모든필드 생성자
@NoArgsConstructor  //모두없는 생성자
@ToString
@EqualsAndHashCode(callSuper = false)
public class EpisodeVO extends Criteria{
	public String episodeId;//에피소드 식별번호 영문 숫자 혼합 사용
	public String seriesId;//시리즈 식별번호 영문 숫자 혼합 사용
	public String episodeOrder;//UNIQUE(series_id, episode_order) DB 내부 정렬 / 재배치용
	public String episodeTitle;//에피소드 제목 생략 가능, 특별한 경우만 기재
	public String episodePrice;//에피소드 가격
	public String updatedAt;//업로드 일자
	public String viewImgUrl;//웹툰 내용 호출용
	public byte[] viewImg;  //웹툰 내용 
	public String thumbnailImgUrl; // 에피소드 썸네일 호출용
	public byte[] thumbnailImg;  // 에피소드 썸네일
	public String viewText; // 소설 내용
	 // 업로드 받을 임시 MultipartFile (Setter 통해 byte[]로 변환 가능)
    private transient MultipartFile thumbnailFile;
    private transient MultipartFile toonFile;

	public EpisodeVO(String episodeId, String episodeTitle, byte[] thumbnailImg) {
		super();
		this.episodeId = episodeId;
		this.episodeTitle = episodeTitle;
		this.thumbnailImg = thumbnailImg;
	}

	public EpisodeVO(String episodeId, String seriesId, String episodeTitle, String episodePrice, byte[] viewImg,
			byte[] thumbnailImg, String viewText) {
		super();
		this.episodeId = episodeId;
		this.seriesId = seriesId;
		this.episodeTitle = episodeTitle;
		this.episodePrice = episodePrice;
		this.viewImg = viewImg;
		this.thumbnailImg = thumbnailImg;
		this.viewText = viewText;
	}
	
	
	
}
