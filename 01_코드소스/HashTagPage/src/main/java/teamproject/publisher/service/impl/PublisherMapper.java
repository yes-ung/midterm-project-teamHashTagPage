/**
 * 
 */
package teamproject.publisher.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import teamproject.common.Criteria;
import teamproject.publisher.service.PublisherVO;



/**
 * @author user
 *
 */
@Mapper
public interface PublisherMapper {
	public List<?> selectPublisherList(Criteria criteria);   // 전체 조회 
	public int selectPublisherListTotCnt(Criteria criteria); // 총 개수 구하기
	public int insert(PublisherVO publisherVO);                   // 부서 insert 
	public PublisherVO selectPublisher(String publisherId);                  // 상세조회
	public int delete(String publisherId);                   // delete 메소드
}
