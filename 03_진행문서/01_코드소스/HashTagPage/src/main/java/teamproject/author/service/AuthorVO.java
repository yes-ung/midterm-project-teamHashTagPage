/**
 * 
 */
package teamproject.author.service;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
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
public class AuthorVO extends Criteria{
	private String authorId;            // 기본키(자바 코딩)
	private String authorName;    // 작가이름
	private String authorBio;    // 첨부파일
	private LocalDate authorDebutDate;    // 작가생성날짜
	private byte[] authorthumbnailImg;  // 작가 썸네일 이미지파일
	public String authorThumbnailImgUrl; // 작가 썸네일 호출용
	private String snsLink1;            // 작가가 활동하는 SNS 링크
	private String snsLink2;            // 작가가 활동하는 SNS 링크
	private String authorEmail;         // 공개용 이메일 필수 X
	
	 private transient MultipartFile authorThumbnailFile;
}
