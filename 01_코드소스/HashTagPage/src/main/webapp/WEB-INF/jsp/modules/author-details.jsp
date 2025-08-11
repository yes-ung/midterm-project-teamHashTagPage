<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>authorPage</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="css/author-details.css" />
  </head>
  <body>
    <div class="page">
      <!-- 헤더 -->
      <jsp:include page="/common/simple-header.jsp" />

      <main class="author-page">
        <!-- 작가 프로필 -->
        <section class="author mt2">
          <div class="author-cover">
            <div class="author-image">
              <img src="${author.authorThumbnailImgUrl}" alt="작가표지"
              onerror="this.onerror=null; this.src='/img/profile_img.jpg';" />
            </div>
            <div class="author-name"><span>${author.authorName}</span></div>
          </div>
          <div class="author-profile">
            <div class="author-history">
              <p>${author.authorBio}</p>             
            </div>
            <div class="author-note">
              <h4>작가 sns</h4>            
               <p> 인스타 : <a href="https://instagram.com/${author.snsLink1}"
                target="_blank" rel="noopener noreferrer">${author.snsLink1}</a></p>
              <p>e-mail : ${author.authorEmail}</p>
            </div>
          </div>
        </section>

        <!-- 작품 리스트 -->
        <div class="author-work">
          <section class="authorwork-list">
            <h3 class="list-title">작가 작품</h3>
              <!-- 요기 목록 -->
            <ul class="work-list">
            
            <c:forEach var="data" items="${series}" >
            <li class="work-item mb1">
            <a href="<c:url value='/hashtagpage/webnovel/list.do'>
            <c:param name='seriesId' value="${data.seriesId}" /></c:url>" class="work-link" >    
                  <div class="thumb">
                    <<img src="<c:out value='${data.thumbnailImgUrl}' />" alt="책표지" />
                   </div>
                  <div class="work-info">
                    <div class="work-title">${data.seriesTitle}</div>
                    <div class="work-publisher">${data.publisherId}</div>
                    <div class="work-sub">
                     <c:out value="${fn:substring(data.seriesDescription, 0, 30)}..." />
                    </div>
                  </div>
                </a>
                <div class="my-wishlist" data-liked="false">🤍</div>
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
          btn.addEventListener("click", () => {
            const liked = btn.classList.toggle("liked");
            btn.textContent = liked ? "❤️" : "🤍";
          });
        });
      });
    </script>
  </body>
</html>
