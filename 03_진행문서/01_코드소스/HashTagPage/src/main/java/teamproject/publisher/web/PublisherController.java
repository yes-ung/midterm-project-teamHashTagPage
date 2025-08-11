/**
 * 
 */
package teamproject.publisher.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j2;
import teamproject.publisher.service.PublisherService;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class PublisherController {
//	서비스 가져오기
	@Autowired
	private PublisherService publisherService;
}
