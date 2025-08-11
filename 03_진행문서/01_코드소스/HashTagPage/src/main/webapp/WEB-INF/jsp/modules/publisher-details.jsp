<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>publisherPage</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="/css/publisher-details.css" />

  </head>
  <body>
    <div class="page">
      <!-- 헤더 -->
      <jsp:include page="/common/simple-header.jsp" />

      <main class="publisher-page">
        <!-- 출판사 프로필 -->
        <section class="publisher mt2">
          <div class="publisher-cover">
            <div class="publisher-image">
              <img src="<c:out value='${Publisher.publisherLogoImgUrl}' />" alt="회사로고"
              onerror="this.onerror=null; this.src='/img/profile_img.jpg';" />
            </div>
            <div class="publisher-name"><span>${Publisher.publisherName}</span></div>
          </div>
          <div class="publisher-note mt1">
            <h3>출판사 sns</h3>
            <p>
              공식홈페이지 : <a
                href="${Publisher.publisherUrl}"
                target="_blank"
                rel="noopener noreferrer">
               ${Publisher.publisherUrl}</a>
            </p>
            <p>e-mail : ${Publisher.contactEmail}</p>
          </div>
        </section>

        <!-- 작품 리스트 -->
        <div class="publisher-work">
          <section class="publisherwork-list">
            <h3 class="list-title">출판 작품</h3>
            <!-- 요기 목록 -->
            <ul class="work-list">
              <!-- 반복 -->
             <c:forEach var="data" items="${series}" >
              <li class="work-item mb1">
                <a href="<c:url value='/hashtagpage/webnovel/list.do'>
            <c:param name='seriesId' value="${data.seriesId}" /></c:url>" class="work-link" >
                  <div class="card">
                    <img src="<c:out value='${data.thumbnailImgUrl}' />" alt="표지" />
                      <div class="info-container">
                        <p>${data.seriesTitle}</p>
                        <div class="flex-row">
                          <p>${data.authorId}</p>
                        <div class="my-wishlist" data-liked="false">🤍</div>
                      </div>
                    </div>
                  </div>
                </a>               
              </li>
            </c:forEach>

            </ul>
          </section>
        </div>
      </main>

      <!-- 푸터 -->
      <jsp:include page="/common/footer.jsp" />
    </div>


    <!-- 찜목록 하트 토글 -->
    <script>
      document.addEventListener("DOMContentLoaded", () => {
        const wishlistButtons = document.querySelectorAll(".my-wishlist");

        wishlistButtons.forEach((btn) => {
          btn.addEventListener("click", (e) => {
            e.stopPropagation(); // 부모 요소 클릭 방지
            e.preventDefault(); // a태그의 이동막기

            const liked = btn.classList.toggle("liked");
            btn.textContent = liked ? "❤️" : "🤍";
          });
        });
      });
    </script>
  </body>
</html>
