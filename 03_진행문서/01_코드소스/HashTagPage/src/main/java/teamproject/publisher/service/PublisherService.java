/**
 * 
 */
package teamproject.publisher.service;

import java.util.List;

import teamproject.common.Criteria;

/**
 * @author user
 *
 */
public interface PublisherService {
	 List<?> selectPublisherList(Criteria criteria);   		// 전체 조회 
	 int selectPublisherListTotCnt(Criteria criteria); 		// 총 개수 구하기
	 int insert(PublisherVO publisherVO);                   // 부서 insert 
	 PublisherVO selectPublisher(String publisherId);      // 상세조회
	 int delete(String publisherId);                   // delete 메소드
}
