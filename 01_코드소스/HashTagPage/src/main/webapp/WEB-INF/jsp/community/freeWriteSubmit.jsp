<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>board-freewrite-submit</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="/css/board-freewrite-submit.css" />
  </head>
  <body>
    <div class="page">
      <jsp:include page="/common/simple-header.jsp" />

      <main class="freewrite-page mt4">
        <!-- 셀렉박스 카테고리 선택 시 해당 게시판으로 등록 -->
        <form action="/boardPost/addfree.do" method="post" id="addForm" name="addForm" enctype="multipart/form-data">
        <!-- 게시판 카테고리 탭 -->
        <div class="write-category-select mb2">
          <label for="categoryId">게시판 종류:</label>
          <select name="categoryId" id="categoryId">
            <option value="자유게시판" selected>자유게시판</option>
            <option value="작품추천">작품 추천</option>
          </select>
        </div>

        <!-- 글쓰기 폼 -->
        <div class="write-form">
          <input
            type="text"
            id="boardPostTitle"
            name="boardPostTitle"
            placeholder="제목을 입력하세요"
            class="write-title"
          />
          <textarea
            placeholder="내용을 입력하세요"
            id="boardPostContent"
            name="boardPostContent"
            rows="18"
            class="write-content"
          ></textarea>
          <div class="file-upload">
            <label for="image-upload">이미지 첨부</label>
            <input type="file" id="image-upload" accept="image/*" />
          </div>
          <div class="write-buttons">
            <button type="submit" class="btn-rounded submit">등록</button>
            <button type="reset" class="btn-rounded cancel" onclick="history.back();">취소</button>
          </div>
        </div>
      </form>
      </main>

      <jsp:include page="/common/footer.jsp" />
    </div>

    <script>
      // 페이지 이동 로직
      const categorySelect = document.getElementById("categoryId");
      let previousValue = categorySelect.value; // 처음 값 저장

      categorySelect.addEventListener("focus", function () {
        previousValue = this.value;
      });

      categorySelect.addEventListener("change", function () {
        const selected = this.value;

        if (selected === "작품추천") {
          const confirmMove = confirm(
            "추천 게시판으로 이동할까요? 작성 중인 내용은 저장되지 않습니다."
          );
          if (confirmMove) {
            window.location.href = "/hashtagpage/community/recommendSubmit.do";
          } else {
            // ❗ 사용자가 취소했을 경우 이전 값으로 되돌림!
            this.value = previousValue;
          }
        }
      });
    </script>
    
  </body>
</html>
