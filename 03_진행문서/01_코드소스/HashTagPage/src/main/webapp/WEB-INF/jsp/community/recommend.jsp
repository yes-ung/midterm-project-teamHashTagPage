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
    <link rel="stylesheet" href="/css/03community-recommended.css" />
</head>

<body>
  <div class="page">
    <jsp:include page="/common/header.jsp" />
    <form id="listForm" method="get">
        <!-- 컨트롤러로 보낼 페이지번호 -->
	    <input type="hidden" id="pageIndex" name="pageIndex" value="1">
	    <input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchKeyword}">
	    <input type="hidden" id="searchType" name="searchType" value="${searchType}">
	    </form>
    <main>
      <!-- 본문 사이드 메뉴 -->
      <div class="community-container">
        <aside class="recommended-side mt2">
          <div class="recommended-title">
            <h1>작품 추천</h1>
          </div>
          <div class="recommended-logo">
            <a href="#"><img src="/img/tagchsize.png" alt="로고"></a>
          </div>
        </aside>
        <!-- 선만 별도로 -->
        <div class="recommended-divider"></div>


        <section class="recommended-content">
          <div class="recommended-subject">
            <div class="recommended-subjectbox">
              <div class="recommended-subject-body">
                                                    
                     <form id="searchForm" name="searchForm"
                           method="get" action="<c:out value='/hashtagpage/community/recommend.do' />">
                     
                       <!-- 게시판 리스트 -->
                       <ul class="recommended-list">
                     
                         <!-- 검색/글쓰기 버튼 -->
                         <%
                           String searchParam = request.getParameter("searchKeyword");
                           if (searchParam == null || searchParam.trim().isEmpty()) {
                               searchParam = "검색어입력";
                           }
                         %>
                     
                         <div class="recommended-btn">
                           <div class="recommended-search">
                             <input type="text" id="searchKeyword" name="searchKeyword" placeholder="<%= searchParam %>">
                     
                             <!-- 검색 조건 -->
                                 
                             <% String searchType = request.getParameter("searchType");
                              if (searchType == null) searchType = "title"; // 기본값 %>
                            
                            <select class="search-select" name="searchType">
                              <option value="title" <%= "title".equals(searchType) ? "selected" : "" %>>제목</option>
                              <option value="content" <%= "content".equals(searchType) ? "selected" : "" %>>내용</option>
                              <option value="nickname" <%= "nickname".equals(searchType) ? "selected" : "" %>>닉네임</option>
                            </select>
                           </div>
                                                             
                     </form>
                  
                    <div class="written-btn">
                      <a href="<c:url value='/hashtagpage/community/recommendSubmit.do' />" class="abutton">글쓰기</a>
                                            <!-- <button type="button">글쓰기</button> -->
                    </div>
                  </div>

                  <!-- 정렬 버튼 -->
                  <div class="array-btn">
                    <select class="array-select">
                      <option value="title">최신순</option>
                      <option value="content">조회순</option>
                      <option value="nickname">추천순</option>
                    </select>
                  </div>

                  <div class="post-box">
       
       
       <c:if test="${empty boardPostList}">
 	    <li>게시글이 없습니다.</li>
 	    </c:if>
       <c:forEach var="data" items="${boardPostList}">
                <a href="<c:url value='/hashtagpage/community/recommendDetail.do'><c:param name='postId' value="${data.postId}" /></c:url>" class="ulatext" >
                   <li class="post-row">
                      <div class="recommended-list-img">                                      
                        <img src="<c:out value='${data.thumbnailImgUrl}' />" alt="리스트이미지" />
                      </div>

                      <div class="recommended-text-box">
                        <!-- 제목 + 댓글 -->
                       <div class="top-row">
                           <div class="list-title"><c:out value="${data.boardPostTitle}"/></div>
                           <div class="list-comment">💬[${data.commentCount}]</div>
                       </div>
                       <div class="list-nick"><c:out value="${data.userName}"/></div>
                       <!-- 날짜 + 조회수 + 좋아요 -->
                       <div class="bottom-row">
                           <div class="list-date"><c:out value="${data.boardPostCreatedAt}"/></div>
                           <div class="list-view">👁️<c:out value="${data.boardPostViews}"/></div>
                           <div class="list-like">👍<c:out value="${data.likeCount}"/></div>
                       </div>
                      </div>
                    </li>
                 </a>
        </c:forEach>
                  
                  
                  
                  
                   
                  </div>

                </ul>
              </div>
            </div>



          </div>
            <!-- 여기: 페이지번호 -->
           <div class="pagina  pagination">
           <ul class="pagination" id="pagination"></ul>
           </div>
         
      </div>
      </section>
  </div>
  </div>
  </main>
  <jsp:include page="/common/footer.jsp" />
  </div>
     <!-- jquery -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <!-- 페이징 라이브러리 -->
		<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script type="text/javascript">
/* 페이징 처리 */
    $('#pagination').twbsPagination({
        totalPages: "${paginationInfo.totalPageCount}",
        startPage:parseInt("${paginationInfo.currentPageNo}"),
        visiblePages: "${paginationInfo.recordCountPerPage}",
        initiateStartPageClick: false,
        onPageClick: function (event, page) {
            /* 재조회 함수 실행 */
            fn_egov_link_page(page);
        }
    });
    /* 페이지번호 클릭시 전체조회 */
    function fn_egov_link_page(pageNo) {
         /* 현재페이지번호 저장 */
         $("#pageIndex").val(pageNo);
       $("#listForm").attr("action",window.location.pathname)
                .submit();
    }  

</script>
</body>

</html>
