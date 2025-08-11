<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>#page 웹툰</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="/css/home.css" />
    <!-- Swiper CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    
  </head>
  <body>
  <jsp:include page="/common/header.jsp" />
    <div class="page">
      
      <main>
        <div class="main-box mt4 mb4">
      <c:if test="${empty genre}">
        
           <!-- 상단 이벤트 슬라이드 -->
          <section class="top-banner">
            <div class="swiper topSwiper">
              <div class="swiper-wrapper">
                <!-- 여기 -->
                <div class="swiper-slide">
                  <img src="/img/eventbanner5.jpg" alt="이벤트1" />
                </div>
                <div class="swiper-slide">
                  <img src="/img/eventbanner4.jpg" alt="이벤트2" />
                </div>
                <div class="swiper-slide">
                  <img src="/img/eventbanner2.jpg" alt="이벤트3" />
                </div>
                <div class="swiper-slide">
                  <img src="/img/eventbanner1.jpg" alt="이벤트4" />
                </div>
                <div class="swiper-slide">
                  <img src="/img/eventbanner3.jpg" alt="이벤트5" />
                </div>
                 <div class="swiper-slide">
                  <img src="/img/eventBennerR.png" alt="이벤트6" />
                </div>                                            
               <!-- 페이지네이션/버튼 -->
              </div>                          
              <div class="swiper-pagination"></div>
            </div>
          </section>
   
       </c:if>               

          <!-- 지금 무료 : 카드형 콘텐츠 슬라이드 -->
          <section class="card-slider mb2">
            <h2 class="section-title mb2">🔥 지금 무료인 ${genre} 웹툰!</h2>
            <div class="swiper cardSwiper">
              <div class="swiper-wrapper ml1 pt3 pb3">
                <!-- 원하는 만큼 반복 -->
             <c:forEach var="data" items="${series1}" >
               <div class="swiper-slide"> 
     <a href="<c:url value='/hashtagpage/webtoon/list.do'><c:param name='seriesId' value="${data.seriesId}" /></c:url>" >
       <div class="card">
                    <img src="<c:out value='${data.thumbnailImgUrl}' />" alt="웹툰" />
                    <div class="badge-container">
                     <!--  <span class="badge ponly"></span>
                      <span class="badge up"></span>
                      <span class="badge free"></span> -->
                    </div>
                    <p class="title">${data.seriesTitle}</p>
                    <p class="author">${data.authorId}</p>
                  </div>
                  </a>
                </div>                                                                                       
                </c:forEach>
                
                </div>                              
              <div class="swiper-button-prev"></div>
              <div class="swiper-button-next"></div>
            </div>
          </section>

         <!-- 7/4일 추가 키워드 서치 -->
          <section class="hot-keywords mt2 mb2">
            <h2>🔥웹툰 인기 키워드</h2>
            <div class="tag-list mt2">
              <a href="/hashtagpage/search.do?search=빙의">#빙의</a>
              <a href="/hashtagpage/search.do?search=계약결혼">#계약결혼</a>
              <a href="/hashtagpage/search.do?search=학원물">#학원물</a>
              <a href="/hashtagpage/search.do?search=빌런물">#빌런물</a>
              <a href="/hashtagpage/search.do?search=현판">#현판</a>
              <a href="/hashtagpage/search.do?search=아이돌">#아이돌</a>
              <a href="/hashtagpage/search.do?search=배우">#배우</a>
              <a href="/hashtagpage/search.do?search=회귀">#회귀</a>
              <a href="/hashtagpage/search.do?search=계략캐">#계략캐</a>
              <a href="/hashtagpage/search.do?search=캐미">#캐미</a>
              <a href="/hashtagpage/search.do?search=좀비">#좀비</a>
              <a href="/hashtagpage/search.do?search=아포칼립스">#아포칼립스</a>
            </div>
          </section>

          <!-- 웹툰 베스트 : 순위 슬라이드 -->
          <section class="novel-ranking mb2">
            <h2 class="ml2">${genre} 베스트 웹툰</h2>
            <div class="swiper novel-swiper mt2">
              <div class="swiper-wrapper">
                <!-- swiper-slide 계속 반복 -->
<c:forEach var="data" items="${series2}" varStatus="status">
  <c:if test="${status.index % 2 == 0}">
    <div class="swiper-slide">
      <!-- 첫 번째 책 -->
     <a href="<c:url value='/hashtagpage/webtoon/list.do'><c:param name='seriesId' value="${series2[status.index].seriesId}" /></c:url>" >
      <div class="rank-card mb2">
        <div class="rank-cardinner">
          <img src="<c:out value='${series2[status.index].thumbnailImgUrl}' />" alt="웹툰썸네일"  />
          <span class="rank-num">${status.index + 1}</span>
        </div>
        <div class="info ml3">
          <p class="title">${series2[status.index].seriesTitle}</p>
          <p class="author">${series2[status.index].authorId}</p>
          <p class="rating">⭐ ${series2[status.index].starPoint}</p>
        </div>
      </div>
     </a>
      <!-- 두 번째 책 (있을 경우만) -->     
      <c:if test="${status.index + 1 < fn:length(series2)}">
      <a href="<c:url value='/hashtagpage/webtoon/list.do'><c:param name='seriesId' value="${series2[status.index + 1].seriesId}" /></c:url>" >
        <div class="rank-card mb2">
          <div class="rank-cardinner">
            <img src="<c:out value='${series2[status.index + 1].thumbnailImgUrl}' />" alt="웹툰썸네일"  />
            <span class="rank-num">${status.index + 2}</span>
          </div>
          <div class="info ml3">
            <p class="title">${series2[status.index + 1].seriesTitle}</p>
            <p class="author">${series2[status.index + 1].authorId}</p>
            <p class="rating">⭐ ${series2[status.index + 1].starPoint}</p>
          </div>
        </div>
       </a>
      </c:if>
    </div> <!-- swiper-slide 끝 -->
  </c:if>
</c:forEach>
     


              </div>
              <!-- 슬라이드 화살표 -->
              <div class="swiper-button-prev"></div>
              <div class="swiper-button-next"></div>
            </div>
          </section>

          <!-- PAGE 추천 : 카드 슬라이더 -->
          <section class="card-slider mb2">
            <h2 class="section-title mb2">⭐ 페이지 추천 ${genre}</h2>
            <div class="swiper cardSwiper">
              <div class="swiper-wrapper ml1 pt3 pb3">
                <!-- 원하는 만큼 반복 -->
             <c:forEach var="data" items="${series3}" >
               <div class="swiper-slide"> 
     <a href="<c:url value='/hashtagpage/webtoon/list.do'><c:param name='seriesId' value="${data.seriesId}" /></c:url>" >
       <div class="card">
                    <img src="<c:out value='${data.thumbnailImgUrl}' />" alt="웹툰" />
                    <div class="badge-container">
                     <!--  <span class="badge ponly"></span>
                      <span class="badge up"></span>
                      <span class="badge free"></span> -->
                    </div>
                    <p class="title">${data.seriesTitle}</p>
                    <p class="author">${data.authorId}</p>
                  </div>
                  </a>
                </div>                                                                                       
                </c:forEach>
 
               
              </div>
              <div class="swiper-button-prev"></div>
              <div class="swiper-button-next"></div>
            </div>
          </section>

          <!-- 최신 업뎃 : 카드 슬라이더 -->
          <section class="card-slider mb2">
            <h2 class="section-title mb2">${genre} 최신 업데이트</h2>
            <div class="swiper cardSwiper">
              <div class="swiper-wrapper ml1 pt3 pb3">
                <!-- 원하는 만큼 반복 -->
                
            <c:forEach var="data" items="${series4}" >
               <div class="swiper-slide"> 
     <a href="<c:url value='/hashtagpage/webtoon/list.do'><c:param name='seriesId' value="${data.seriesId}" /></c:url>" >
       <div class="card">
                    <img src="<c:out value='${data.thumbnailImgUrl}' />" alt="웹툰" />
                    <div class="badge-container">
                     <!--  <span class="badge ponly"></span>
                      <span class="badge up"></span>
                      <span class="badge free"></span> -->
                    </div>
                    <p class="title">${data.seriesTitle}</p>
                    <p class="author">${data.authorId}</p>
                  </div>
                  </a>
                </div>                                                                                       
                </c:forEach>                
                
              </div>
              <div class="swiper-button-prev"></div>
              <div class="swiper-button-next"></div>
            </div>
          </section>
        </div>
      </main>
    </div>
<jsp:include page="/common/footer.jsp" />
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script>
      const topSwiper = new Swiper(".topSwiper", {
        loop: true,
        pagination: {
          el: ".swiper-pagination",
        },
        autoplay: {
          delay: 3000,
        },
      });

      const cardSwiper = new Swiper(".cardSwiper", {
        slidesPerView: 2.2,
        spaceBetween: 10,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        breakpoints: {
          768: {
            slidesPerView: 4,
            spaceBetween: 20,
          },
          1024: {
            slidesPerView: 5,
            spaceBetween: 30,
          },
        },
      });

      const swiper = new Swiper(".novel-swiper", {
        slidesPerView: "auto", // 이거 중요!
        spaceBetween: 20,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
  </body>
</html>
