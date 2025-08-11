<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="/css/04community-write.css" />
</head>

<body>
  <div class="page">
    <jsp:include page="/common/header.jsp" />
    <main>
      <div class="write-container ml1">
        <!-- 게시글 제목 -->
        <div class="write-title-header">
          <div class="write-title-box">
            <div class="write-title">
              <div class="title">
                <h3>${board.boardPostTitle}</h3>
              </div>
            </div>
            <div class="title-info">
              <div class="date">
                <span>${board.boardPostCreatedAt}</span>
              </div>

              <div class="nick">
                [${board.userName}]
              </div>
              <div class="plus">
                👍${board.likeCount}
              </div>

              <div class="view">
                👁️${board.boardPostViews}
              </div>
            </div>
          </div>

          <!-- 게시판 목록보기 -->
          <div class="recommended-listback">
            <button id="listbackBtn" onclick="goBack()">뒤로가기</button>
          </div>
        </div>
        <!-- 게시글 본문 -->
        <div class="write-content">
			<h3>${series.seriesTitle}</h3>
		<div class="write-infobox">
          <div class="write-img">
            
            <img src="<c:out value='${series.thumbnailImgUrl}' />" class="cover_style" alt="책표지" />
          </div>
          <div class="write-img-body">

            <p><strong>작가명:</strong> ${series.authorId}</p>
            <p><strong>연재:</strong> 토요일</p>
            <p>조회 46,768 | 추천 4,167</p>
            <p>인생픽 공개전</p>
          </div>
        </div>
        </div>

        <!-- <div class="tags">
          <div class="span1">
            <span>#패러디</span>
            <span>#판타지</span>
            <span>#드라마</span>
            <span>#로맨스</span>
          </div>
          <div class="span2">
            <span>#라이프</span>
            <span>#성장</span>
            <span>#구원</span>
            <span>#행복</span>
          </div>
        </div> -->


       <div class="quote">
          ${board.boardPostContent}
       </div>   
          <div class="add" >
 			<div class="buttons">
 			 <button class="vote up">게시글 추천👍</button>
          <div class="updata-buttons">
           <button class="updata">수정</button>
           <button class="updata delete">삭제</button>
          </div>
         </div>    
       </div>
        
        
        
        
        
        
        <div class="comment-area">
     <!-- 댓글 입력창 -->
       <form action="/boardComment/add.do" method="post" id="addComment" name="addComment">         
           <input type="hidden" id="postId" name="postId" value="${postId}">
           <div class="comment-box comment-input">
               <input type="text"  placeholder="의견을 입력하세요" 
                 name="boardCommentContent" />
               <button type="submit" form="addComment">등록</button>
           </div>
       </form>

          <!-- 댓글 목록 -->
          <div class="user-comments mt4">
            <!-- 반복 -->
         <c:forEach var="data" items="${comment}">
            
            <div class="comments-repeat pb2">
              <div class="comment-header">
                <div class="user-nickname">
                  <p>${data.userName}</p>
                </div>
                <div class="vote-buttons">
                  <button class="vote up">👍 <span></span></button>
                  <button class="vote down">👎 <span></span></button>
                </div>
              </div>
              <div class="comment-body">
                <span class="comment-text">${data.boardCommentContent}</span>
                <div class="comment-btn">
                  <div class="commenteditor">
                    <button class="updata2  update-btn">수정</button>
                  </div>
                  
               <form action="/boardComment/delete.do" method="post" id="d${data.boardCommentId}" name="d${data.boardCommentId}" >
                    <input type="hidden" name="boardCommentId" value="${data.boardCommentId}">
                     <div class="commenteditor">
                       <button type="submit" form="d${data.boardCommentId}" class="delete">삭제</button>
                    </div>
               </form>                 
                </div>
              </div>

       <!-- 댓글수정 입력창  -->
        <form action="/boardComment/edit.do" method="post" id="u${data.boardCommentId}" name="u${data.boardCommentId}" >
          <input type="hidden" name="boardCommentId" value="${data.boardCommentId}">
          <input type="hidden" name="userId" value="${data.userId}">
          <div class="comment-update update-input ml1 mr1" style="display: none">
            <input type="text" placeholder="답글을 입력하세요" name="boardCommentContent" value="${data.boardCommentContent}" />
            <button type="submit" form="u${data.boardCommentId}" class="updata" >수정등록</button>
          </div>
        </form>

              <div class="comment-footer">
                <div class="input-timebox">
                  <span class="input-time">${data.boardCommentCreatedAt}</span>
                  <button class="reply-btn ml2">↳ 덧글</button>
                </div>
                <button class="report mr2">🚨</button>
              </div>

          <!-- 대댓글 입력창  -->
        <form action="/boardComment/addReply.do" method="post" id="${data.boardCommentId}" name="${data.boardCommentId}" enctype="multipart/form-data">
          <input type="hidden" name="postId" value="${postId}">
          <input type="hidden" name="boardCommentId" value="${data.boardCommentId}">
          <div class="comment-reply reply-input ml1 mr1" style="display: none">
            <input type="text" placeholder="답글을 입력하세요" name="boardCommentContent" />
            <button type="submit" form="${data.boardCommentId}">등록</button>
          </div>
        </form>
              <!-- 대댓글 출력  -->
              <div class="reply-list">
              <c:forEach var="data2" items="${data.replyComment}">
              <div class="replycomment">${data2.replyUserName} : ${data2.replyContent}</div>
              </c:forEach>
              </div>
            </div>
          </c:forEach>
            
            <!-- 더보기 버튼 -->
            <div class="comment-more-btn-wrapper">
              <button id="commentMoreBtn">더보기</button>
            </div>


          </div>



        </div>






      </div>

    </main>
    <jsp:include page="/common/footer.jsp" />
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const allComments = document.querySelectorAll(".comments-repeat");
      const moreBtn = document.getElementById("commentMoreBtn");

      let shownCount = 5;

      // 처음엔 5개만 보여주고 나머진 숨김
      allComments.forEach((comment, index) => {
        if (index >= shownCount) {
          comment.style.display = "none";
        }
      });

      // 더보기 버튼 클릭 시 다음 5개 표시
      moreBtn.addEventListener("click", () => {
        let nextCount = 0;
        for (let i = shownCount; i < allComments.length && nextCount < 5; i++) {
          // ✅ 핵심 수정: 원래 CSS에서 지정된 디스플레이 속성을 따르게 하기 위해 빈 값
          allComments[i].style.display = "";
          nextCount++;
        }
        shownCount += nextCount;

        if (shownCount >= allComments.length) {
          moreBtn.style.display = "none";
        }
      });
    });
  </script>

 <!-- 덧글 창 js-->
  <script>
        document.addEventListener("DOMContentLoaded", () => {
            const comments = document.querySelectorAll(".comments-repeat");

            comments.forEach((commentBox) => {
            	const updateBtn = commentBox.querySelector(".update-btn");
            	const updateInputBox = commentBox.querySelector(".comment-update");
                const input2 = updateInputBox.querySelector("input2");
                const submitBtn2 = updateInputBox.querySelector("button2");
                
            	
                const replyBtn = commentBox.querySelector(".reply-btn");                
                const replyInputBox = commentBox.querySelector(".comment-reply");
                const input = replyInputBox.querySelector("input");
                const submitBtn = replyInputBox.querySelector("button");
                const replyList = commentBox.querySelector(".reply-list");

                // 덧글 버튼 클릭 시 입력창 토글
                replyBtn.addEventListener("click", () => {
                    const isVisible = replyInputBox.style.display === "flex";
                    replyInputBox.style.display = isVisible ? "none" : "flex";
                });
                
                updateBtn.addEventListener("click", () => {
                    const isVisible2 = updateInputBox.style.display === "flex";
                    updateInputBox.style.display = isVisible2 ? "none" : "flex";
                });
                
                
                

                // 등록 버튼 클릭 시 대댓글 추가
               /*  submitBtn.addEventListener("click", () => {
                    const value = input.value.trim();
                    if (value !== "") {
                        const replyItem = document.createElement("div");
                        replyItem.classList.add("reply-item");
                        replyItem.innerHTML = `<div style="padding: 0.2rem 0.3rem; background: var(--bg-subtle); border-radius: 6px;">닉네임: \${value}</div>`;
                        replyList.appendChild(replyItem);
                        input.value = "";
                    }
                }); */
            });
        });
    </script>
  <!-- 뒤로 가기 추가-->
  <script>
  function goBack() {
	    history.back(); // 또는 history.go(-1);
	  }
  </script>
</body>

</html>
