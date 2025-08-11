/**
 * 
 */
package teamproject.publisher.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import teamproject.common.Criteria;
import teamproject.publisher.service.PublisherService;
import teamproject.publisher.service.PublisherVO;

/**
 * @author user
 *
 */
@Service
public class PublisherServiceImpl implements PublisherService{
	@Autowired
	PublisherMapper publisherMapper;
//	전체조회
	@Override
	public List<?> selectPublisherList(Criteria criteria) {
		// TODO Auto-generated method stub
		return publisherMapper.selectPublisherList(criteria);
	}
//	총 개수 구하기
	@Override
	public int selectPublisherListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return publisherMapper.selectPublisherListTotCnt(criteria);
	}
//	추가하기
	@Override
	public int insert(PublisherVO publisherVO) {
		// TODO 1) UUID 만들기(기본키): 자바에서 중복안되게 만들어주는 글자(랜덤)
				String newPublisherId=UUID.randomUUID().toString();
//				        2) 다운로드URL 만들기(개발자 알아서)
				String downloadURL=generateDownloadUrl(newPublisherId);
//				        3) FileDbVO 에 위의 UUID, URL 저장(setter)
				publisherVO.setPublisherId(newPublisherId);
				publisherVO.setPublisherLogoImgUrl(downloadURL);
//				        4) DB insert(fileDbVO)
				return publisherMapper.insert(publisherVO);
	}
//	다운로드 URL을 만들어주는 메소드
//	URL: 웹브라우저주소창 또는 img 태그 -> 해당하는 컨트롤러 메소드가 이미지를 전송해 줌
	public String generateDownloadUrl(String publisherId) {
//		인터넷주소 체계        : http://localhost:8080/경로(path)?쿼리스트링
//		기본주소(ContextPath): http://localhost:8080
//		URL 만드는 클래스      : ServletUriComponentsBuilder
        return ServletUriComponentsBuilder      
          .fromCurrentContextPath()     // 기본주소 : http://localhost:8080
          .path("/fileDb/download.do")  // 경로    : /fileDb/download.do
          .query("publisherId="+publisherId)          // 쿼리스트링: ?uuid=uuid값
          .toUriString();               // 위에꺼조합:
        // http://localhost:8080/fileDb/download.do?uuid=uuid값
	}
// 상세조회
	@Override
	public PublisherVO selectPublisher(String publisherId) {
		// TODO Auto-generated method stub
		return publisherMapper.selectPublisher(publisherId);
	}
//	삭제하기
	@Override
	public int delete(String publisherId) {
		// TODO Auto-generated method stub
		return publisherMapper.delete(publisherId);
	}
	
}
