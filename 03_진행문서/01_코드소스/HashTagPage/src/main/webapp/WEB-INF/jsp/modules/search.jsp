<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색 결과 | #PAGE</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/search.css">

</head>
<body>
	<div class="page">
		<!-- 세컨 헤더 -->
		<jsp:include page="/common/simple-header.jsp" />

		<main class="search-page">

			<!-- 검색 바 -->
			<%
			String searchParam = request.getParameter("search");
			if (searchParam == null || searchParam.trim().isEmpty()) {
				searchParam = "#을 눌러 검색하세요!";
			}
			%>
			<form id="searchForm" name="searchForm" method="get"
				action="<c:out value='/hashtagpage/search.do' />" class="form-sticky">
				<div class="search-header">
					<div class="tag-bar mb1">
						<button type="submit">
							<img src="/img/hashtagp.png" alt="썸네일">
						</button>
						<input type="text" id=search name=search
							placeholder="<%=searchParam%>" class="search-input ">
					</div>
			</form>


			<div class="search-bar">
				<div class="nowtag mb2">
					<p>🔥 #Page 인기 태그:</p>
					<button type="button" onclick="applySearchParam('헌터')"
						class="float-text">#헌터</button>
					<button type="button" onclick="applySearchParam('착각물')"
						class="float-text">#착각물</button>
					<button type="button" onclick="applySearchParam('망함')"
						class="float-text">#망함</button>
					<button type="button" onclick="applySearchParam('조별과제')"
						class="float-text">#조별과제</button>
					</a>
					<button type="button" onclick="applySearchParam('좀비')"
						class="float-text">#좀비</button>
				</div>
				<div class="search-tag">
					<div class="p-font">
						<p>👉 궁금한 태그를 눌러보세요!</p>
					</div>
					<div class="btn-text">
						<button class="btext" type="button"
							onclick="applySearchParam('hashTagPage')">#hashTagPage</button>
						<button class="btext" type="button"
							onclick="applySearchParam('엘롯기')">#엘롯기</button>
						<button class="btext" type="button"
							onclick="applySearchParam('먼치킨')">#먼치킨</button>
						<button class="btext" type="button"
							onclick="applySearchParam('마법은어떻게쓰나요')">#마법은어떻게쓰나요</button>
						<button class="btext" type="button"
							onclick="applySearchParam('현생챙겨')">#현생챙겨</button>
					</div>
				</div>
			</div>
	</div>

	<!-- 검색 결과 요약 -->
	<section class="search-summary">
		<p>
			<strong>“${search}”</strong>에 대한 검색결과 <span class="result-count">총
				${fn:length(result)}건</span>
		</p>
		<div class="search-tabs">
			<button class="active" onclick="showCategory('all')">
				전체<span>(${fn:length(result)}건)</span>
			</button>
			<button onclick="showCategory('novel')">
				웹소설<span>(${fn:length(webNovel)}건)</span>
			</button>
			<button onclick="showCategory('toon')">
				웹툰<span>(${fn:length(webToon)}건)</span>
			</button>
		</div>
		<!-- 정렬 버튼 -->
		<div class="array-btn">
			<select class="array-select">
				<option value="title">최신순</option>
				<!-- <option value="content">조회순</option> -->
				<option value="nickname">추천순</option>
			</select>
		</div>
	</section>

	<!-- 검색 결과 리스트 -->
	<section class="search-results">
		<ul class="result-list">
			<!-- 전체보기 -->
			<div id="resultContainer">
				<c:forEach var="data" items="${result}">
					<li class="result-card"><a
						href="<c:url value='/hashtagpage/webnovel/list.do'>
            <c:param name='seriesId' value="${data.seriesId}" /></c:url>">
							<img src="<c:out value='${data.thumbnailImgUrl}' />" alt="표지" />
							<div class="result-info">
								<p class="title highlight">${data.seriesTitle}</p>
								<p class="meta">${data.categoryId}
									· <span>${data.authorId}</span> · <span>${data.publisherId}</span>
								</p>
								<p class="desc">
									<c:out value="${fn:substring(data.seriesDescription, 0, 25)}" />
									...
								</p>
							</div>
					</a></li>
				</c:forEach>
			</div>
			<!-- 웹소설 -->
			<div id="webNovelContainer" style="display: none;">
				<c:forEach var="data" items="${webNovel}">
					<li class="result-card"><a
						href="<c:url value='/hashtagpage/webnovel/list.do'>
            <c:param name='seriesId' value="${data.seriesId}" /></c:url>">
							<img src="<c:out value='${data.thumbnailImgUrl}' />" alt="표지" />
							<div class="result-info">
								<p class="title highlight">${data.seriesTitle}</p>
								<p class="meta">${data.categoryId}
									· <span>${data.authorId}</span> · <span>${data.publisherId}</span>
								</p>
								<p class="desc">
									<c:out value="${fn:substring(data.seriesDescription, 0, 25)}" />
									...
								</p>
							</div>
					</a></li>
				</c:forEach>
			</div>
			<!-- 웹툰 -->
			<div id="webToonContainer" style="display: none;">
				<c:forEach var="data" items="${webToon}">
					<li class="result-card"><a
						href="<c:url value='/hashtagpage/webnovel/list.do'>
            <c:param name='seriesId' value="${data.seriesId}" /></c:url>">
							<img src="<c:out value='${data.thumbnailImgUrl}' />" alt="표지" />
							<div class="result-info">
								<p class="title highlight">${data.seriesTitle}</p>
								<p class="meta">${data.categoryId}
									· <span>${data.authorId}</span> · <span>${data.publisherId}</span>
								</p>
								<p class="desc">
									<c:out value="${fn:substring(data.seriesDescription, 0, 25)}" />
									...
								</p>
							</div>
					</a></li>
				</c:forEach>
			</div>

		</ul>
	</section>
	</main>
	<jsp:include page="/common/footer.jsp" />
	</div>

	<script>
  const tabButtons = document.querySelectorAll('.search-tabs button');

  tabButtons.forEach((btn) => {
    btn.addEventListener('click', function () {
      // 1. 모든 버튼에서 active 제거
      tabButtons.forEach((b) => b.classList.remove('active'));

      // 2. 클릭한 버튼에 active 추가
      this.classList.add('active');
    });
  });
</script>
	<script>
    function showCategory(type) {
        document.getElementById('resultContainer').style.display = 'none';
        document.getElementById('webNovelContainer').style.display = 'none';
        document.getElementById('webToonContainer').style.display = 'none';

        if (type === 'all') {
            document.getElementById('resultContainer').style.display = 'block';
        } else if (type === 'novel') {
            document.getElementById('webNovelContainer').style.display = 'block';
        } else if (type === 'toon') {
            document.getElementById('webToonContainer').style.display = 'block';
        }
    }
</script>
	<script>
function applySearchParam(value) {
    const url = new URL(window.location.href);

    // 기존 search 파라미터를 교체하거나 추가
    url.searchParams.set('search', value);

    // 새 URL로 이동
    window.location.href = url.toString();
}
</script>


</body>
</html>
