<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/webnovelDetail.css">

</head>
<body>
<div class="page">
<jsp:include page="/common/header.jsp" />
    <div class="viewer-body">
  <div class="viewer">
    <div class="header">
      <div class="title" id="chapterTitle">웹소설</div>
      <div class="selector">
        <select id="chapterSelect" onchange="selectChapter(this.value)"></select>
      </div>
        <div class="back">
          <button class="back-button" onclick="history.back()">← 뒤로가기</button>
            </div>
    </div>

    <div class="content" id="novelContent">
    <c:if test="${empty episode}">
    회차 정보가 없습니다.
    </c:if>
    </div>
    <div class="page-info" id="pageInfo">페이지 1 / 1</div>

    <div class="nav">
      <button id="prevBtn" onclick="prevPage()">← 이전</button>
      <button id="nextBtn" onclick="nextPage()">다음 →</button>
    </div>
  </div>
  </div>
<jsp:include page="/common/footer.jsp" />
</div>


   <script>
    const CHARS_PER_PAGE = 800;

    // ✅ 1. 회차와 내용 직접 입력
    const chapters = [
    	 <c:forEach var="data" items="${episodelist}" >
    	 {
    	        id: ${data.episodeId},
    	        title: "${data.episodeId}화 - ${data.episodeTitle}",
    	        content: `${data.viewText}`
    	      },
    	 </c:forEach>
     
      
    ];

    let currentChapterIndex = 0;
    let currentPage = 0;
    let pages = [];

    const titleEl = document.getElementById("chapterTitle");
    const contentEl = document.getElementById("novelContent");
    const pageInfoEl = document.getElementById("pageInfo");
    const selectEl = document.getElementById("chapterSelect");
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");

    function paginate(text, limit) {
      const result = [];
      let i = 0;
      while (i < text.length) {
        result.push(text.slice(i, i + limit));
        i += limit;
      }
      return result;
    }

    function populateChapterSelect() {
      selectEl.innerHTML = '';
      chapters.forEach((ch, i) => {
        const opt = document.createElement('option');
        opt.value = i;
        opt.textContent = ch.title;
        selectEl.appendChild(opt);
      });
    }

    function loadChapter(index, goToLastPage = false) {
      const chapter = chapters[index];
      if (!chapter) return;
      pages = paginate(chapter.content, CHARS_PER_PAGE);
      currentPage = goToLastPage ? pages.length - 1 : 0;
      currentChapterIndex = index;
      render(chapter.title);
    }

    function render(title) {
      contentEl.classList.add("fade-out");
      setTimeout(() => {
        titleEl.textContent = title;
        contentEl.innerHTML = pages[currentPage].replace(/\n/g, "<br>");
        pageInfoEl.textContent = `페이지 \${currentPage + 1} / \${pages.length}`;
        selectEl.value = currentChapterIndex;
        updateButtons();
        contentEl.classList.remove("fade-out");
        window.scrollTo(0, 0);
      }, 200);
    }

    function updateButtons() {
      prevBtn.textContent = (currentPage === 0 && currentChapterIndex > 0) ? "← 이전 화" : "← 이전 페이지";
      nextBtn.textContent = (currentPage === pages.length - 1 && currentChapterIndex < chapters.length - 1) ? "다음 화 →" : "다음 페이지 →";

      prevBtn.disabled = currentPage === 0 && currentChapterIndex === 0;
      nextBtn.disabled = currentPage === pages.length - 1 && currentChapterIndex === chapters.length - 1;
    }

    function nextPage() {
      if (currentPage < pages.length - 1) {
        currentPage++;
        render(chapters[currentChapterIndex].title);
      } else if (currentChapterIndex < chapters.length - 1) {
        loadChapter(currentChapterIndex + 1);
      }
    }

    function prevPage() {
      if (currentPage > 0) {
        currentPage--;
        render(chapters[currentChapterIndex].title);
      } else if (currentChapterIndex > 0) {
        loadChapter(currentChapterIndex - 1, true);
      }
    }

    function selectChapter(index) {
      loadChapter(parseInt(index));
    }

    // 초기 실행
    populateChapterSelect();
    loadChapter(${episode.episodeId}-1);
  </script>
</body>
</html>