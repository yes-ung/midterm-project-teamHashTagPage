package teamproject.series.service;

import java.time.LocalDate;

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
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class SeriesVO extends Criteria {

	private String seriesId;             // 연재작 관리번호
	private String categoryId;            //형태(소설,만화)
	private String typeId;                //장르(로맨스,무협 등등)
	private String seriesOrder;          //내부 정렬용
	private String seriesTitle;          //연재작 제목
	private String seriesPrice;          //연재작 가격
	private String seriesDescription;    //연재작 간단소개
	private LocalDate seriesCreatedAt;  // 생성날짜
	private String thumbnailImgUrl;     //썸네일 호출용
	private String publisherId;          //출판사 관리번호
	private String authorId;             //작가 관리번호
	private String starPoint;            // 별점
	                                      
	private byte[] thumbnailImg;         //썸네일 이미지
	

	 // 업로드 받을 임시 MultipartFile (Setter 통해 byte[]로 변환 가능)
    private transient MultipartFile thumbnailFile;


	public SeriesVO(String seriesId,String categoryId, String typeId, String seriesTitle, String seriesPrice,
			String seriesDescription, String thumbnailImgUrl, String publisherId, String authorId, byte[] thumbnailImg
			) {
		super();
		this.seriesId = seriesId;
		this.categoryId = categoryId;
		this.typeId = typeId;
		this.seriesTitle = seriesTitle;
		this.seriesPrice = seriesPrice;
		this.seriesDescription = seriesDescription;
		this.thumbnailImgUrl = thumbnailImgUrl;
		this.publisherId = publisherId;
		this.authorId = authorId;
		this.thumbnailImg = thumbnailImg;
	} 

	
	
	
	
}
