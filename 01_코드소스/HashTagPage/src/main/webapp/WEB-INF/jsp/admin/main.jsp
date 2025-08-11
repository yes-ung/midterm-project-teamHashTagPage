<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
   <title>Title</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!--    부트스트랩 css  -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <!--    개발자 css -->
   <link rel="stylesheet" href="/css/style.css">
<style type="text/css">
.pagina{
position: fixed;
bottom:1vh;
left: 35vw;
}
</style>

</head>
<body>
<jsp:include page="/common/header.jsp" />
 <a href="<c:url value='/admin/additionBook.do'/>"><button> 단행본 책 추가하러 가기 </button></a>
 <a href="<c:url value='/admin/additionSeries.do'/>"><button> **연재작 추가하러 가기** </button></a>
 <a href="<c:url value='/admin/additionEpisode.do'/>"><button> 연재작 에피소드 추가하러 가기 </button></a>  <br><br>
 <a href="<c:url value='/admin.do'/>"><button>단행본 DB</button></a>
 <a href="<c:url value='/adminSeries.do'/>"><button>**연재작 DB**</button></a>
 <a href="<c:url value='/adminEpi.do'/>"><button>에피소드 DB</button></a> <br><br>
<h1>DB안 내용물 미리보기</h1>  
   <form class="page mt3" id="listForm" name="listForm" method="get">
       <!-- 수정페이지 열기때문에 필요 -->
       <input type="hidden" id="bookId" name="bookId">
       <input type="hidden" id="episodeId" name="episodeId">
       <!-- 컨트롤러로 보낼 페이지번호 -->
       <input type="hidden" id="pageIndex" name="pageIndex" value="1">
       
      <div class="input-group mb3 mt3">
         <input type="text" 
                class="form-control"
                 id="searchKeyword"
                 name="searchKeyword"
                 value="${searchKeyword}"
            placeholder="검색어입력">
         <button class="btn btn-primary" 
                 type="button"
                 onclick="fn_egov_selectList()"
         >
           검색
         </button>
      </div>
      <!-- 카드 디자인: 반복문 -->
      <c:forEach var="data" items="${books}">
         <div class="col3">
            <div class="card">
               <img src="<c:out value='${data.thumbnailImgUrl}' />" class="card-img-top"
                  alt="이미지">
               <div class="card-body">
                  <h5 class="card-title"><c:out value='${data.bookTitle}' /></h5>
                  <p class="card-text"><c:out value='${data.bookDescription}' /></p>
                  <a href="#" class="btn btn-danger"
                  onclick="fn_delete('${data.bookId}')"
                  >삭제</a>
               </div>
            </div>
         </div>
      </c:forEach>
      
        <c:forEach var="data" items="${episodes}">
         <div class="col3">
            <div class="card">
               <img src="<c:out value='${data.thumbnailImgUrl}' />" class="card-img-top"
                  alt="이미지">
               <div class="card-body">
                  <h5 class="card-title"><c:out value='${data.episodeTitle}' /></h5>
                  <p class="card-text"><c:out value='연재작 관리번호: ${data.seriesId}' /></p>
                  <p class="card-text"><c:out value='에피소드 관리번호: ${data.episodeId}' /></p>
                  <a href="#" class="btn btn-danger"
                  onclick="fn_deleteEpi('${data.episodeId}')"
                  >삭제</a>
               </div>
            </div>
         </div>
      </c:forEach>
      
              <c:forEach var="data" items="${series}">
         <div class="col3">
            <div class="card">
               <img src="<c:out value='${data.thumbnailImgUrl}' />" class="card-img-top"
                  alt="이미지">
               <div class="card-body">
                  <h5 class="card-title"><c:out value='${data.seriesTitle}' /></h5>
                  <p class="card-text"><c:out value='연재작 관리번호: ${data.seriesId}' /></p>
                  <p class="card-text"><c:out value='출판사 관리번호: ${data.publisherId}' /></p>
                  <p class="card-text"><c:out value='저자 관리번호: ${data.authorId}' /></p>
                  <a href="#" class="btn btn-danger"
                  onclick="fn_deleteEpi('${data.seriesId}')"
                  >삭제</a>
               </div>
            </div>
         </div>
      </c:forEach>

      <!-- 여기: 페이지번호 -->
      <div class="pagina">
       <ul class="pagination" id="pagination"></ul>
      </div>
   </form>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 페이징 라이브러리 -->
<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>

<script type="text/javascript">
   /* 전체조회 */
   function fn_egov_selectList() {
      /* $("#pageIndex").val(1);    // 최초 화면에서는 페이지번호를 1페이지로 지정 */
      $("#listForm").attr("action",'<c:out value="/book/book.do" />')
               .submit();
   }
   
   function fn_delete(bookId) {
	   /* 전체조회 : method="get" -> "post" 변경해서 전달 */
	   $("#bookId").val(bookId);
  	 $("#listForm").attr("action",'<c:out value="/book/delete.do" />')
  	 .attr("method","post")
       .submit();
	}
   function fn_deleteEpi(episodeId) {
	   /* 전체조회 : method="get" -> "post" 변경해서 전달 */
	   $("#episodeId").val(episodeId);
  	 $("#listForm").attr("action",'<c:out value="/episode/delete.do" />')
  	 .attr("method","post")
       .submit();
	}
   
</script>
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

<jsp:include page="/common/footer.jsp" />

</body>
</html>
