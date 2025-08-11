package teamproject.boardPost.service;

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
public class BoardPostVO extends Criteria{
	private String postId;//게시글 ID
	private String userId;
	private String categoryId;
	private String typeId;
	private int boardPostViews;//조회수
	private String boardPostTitle;//제목
	private String boardPostContent;//내용
	private String boardPostCreatedAt;//게시글 작성일
	private String boardPostUpdatedAt;//수정일
	private String boardPostIsDeleted = "N";//기본값 : N 삭제시 : Y
	private String seriesId; // 관련 시리즈

	
	// 연계용
	private int commentCount; // ← 댓글 수
	private int likeCount; // ← 좋아요 수
	private String userName; //작성자 닉네임
	private String thumbnailImgUrl;//시리즈 썸네일 호출용
	
   
	
	
	public BoardPostVO(String postId, int boardPostViews, String boardPostTitle) {
		super();
		this.postId = postId;
		this.boardPostViews = boardPostViews;
		this.boardPostTitle = boardPostTitle;
	}
	
	
}
