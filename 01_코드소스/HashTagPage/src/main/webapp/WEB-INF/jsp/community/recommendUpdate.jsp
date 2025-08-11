<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>board-recommend-update</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="/css/board-recommend-update.css" />
  </head>
  <body>
    <div class="page">
      <jsp:include page="/common/simple-header.jsp" />

      <main class="recommend-page mt4">
        <!-- 셀렉박스 카테고리 선택 시 해당 게시판으로 등록 -->
        <form
          action="/board/update.do"
          method="post"
          enctype="multipart/form-data"
        >
        <!-- 페이지 뒤로가기 -->
        <div class="backpage mb2">
            <button
              type="button"
              class="btn-rounded cancel"
              onclick="history.back();"
            >
              뒤로가기
            </button>
          </div>
          <!-- 선택된 작품 정보 표시 (수정 불가) -->
          <div class="selected-work-box mb2">
            <img
              src="/img/bookcard21.jpg"
              alt="썸네일"
              class="work-thumbnail"
            />
            <div class="work-info">
              <p class="work-title">축구 천재인 거 나만 모름</p>
              <p class="work-author">시작의바다</p>
            </div>
            <input type="hidden" name="workId" value="2" />
          </div>
          <!-- 수정할 글 번호 (숨겨진 필드) -->
          <input type="hidden" name="id" value="123" />
          <!-- 게시판 카테고리 탭 (수정 불가) -->
          <div class="write-category-select mb2">
            <label>게시판 종류:</label>
            <span class="category-display">작품 추천</span>
            <input type="hidden" name="category" value="recommend" />
          </div>

          <!-- 글쓰기 폼 -->
          <div class="write-form">
            <input
              type="text"
              name="title"
              value="기존 제목입니다"
              class="write-title"
            />
            <textarea name="content" rows="18" class="write-content">
기존 내용입니다...</textarea
            >
            <div class="file-upload">
              <label for="image-upload">이미지 첨부</label>
              <input type="file" id="image-upload" accept="image/*" />
            </div>
            <div class="write-buttons">
              <button type="submit" class="btn-rounded update">수정</button>
              <button type="button" class="btn-rounded delete" id="delete-btn">
                삭제
              </button>
            </div>
          </div>
        </form>
      </main>

      <jsp:include page="/common/footer.jsp" />
    </div>

    <!-- 페이지 삭제 -->
    <script>
      document.getElementById("delete-btn").addEventListener("click", () => {
        const confirmDelete = confirm("정말 이 글을 삭제하시겠습니까?");
        if (confirmDelete) {
          const postId = document.querySelector("input[name='id']").value;
          window.location.href = `/board/delete.do?id=${postId}`;
        }
      });
    </script>

  </body>
</html>
