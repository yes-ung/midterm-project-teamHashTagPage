package teamproject.boardComment.service;

import java.util.List;

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
public class BoardCommentVO extends Criteria {
	private String boardCommentId;
	private String postId;
	private String boardCommentContent;
	private String boardCommentCreatedAt;
	private String boardCommentIsDeleted;
	private String userId;
//	연계용
	private String userName;
	private List<BoardReplyCommentVO> replyComment; 
}
   
