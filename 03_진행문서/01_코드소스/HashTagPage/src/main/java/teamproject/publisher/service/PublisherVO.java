/**
 * 
 */
package teamproject.publisher.service;



import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import teamproject.common.Criteria;

/**
 * @author user
 *
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class PublisherVO extends Criteria {
	private String publisherId;	// 출판사 번호(기본키)
	private String publisherName;//출판사 공식명칭
	private String publisherEscription;//짧은 설명
	private byte[] publisherLogoImg;    // 출판사 로고 이미지
	private String publisherLogoImgUrl; // 출판사 로고 호출용
	private MultipartFile publisherFileData;//썸네일용 이미지 
	private String publisherUrl;//공식 홈페이지 주소 외부 링크
	private String contactEmail;
	private String publisherCreatedAt;
	
}
