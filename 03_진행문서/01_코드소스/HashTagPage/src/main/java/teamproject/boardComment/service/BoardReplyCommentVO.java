package teamproject.boardComment.service;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class BoardReplyCommentVO {
	private String replyCommentId;
    private String replyboardCommentId; // 댓글 ID
    private String replyContent;
    private String replyCreatedAt;
    private String replyUserId;
//    연계용
    private String replyUserName;
}
