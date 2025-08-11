<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 	부트스트랩 css  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- 	개발자 css -->
	<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
${boardPostList} <br>
${paginationInfo.totalPageCount} : 총페이지수 <br>
${paginationInfo.currentPageNo} : 현재페이지<br>
${paginationInfo.recordCountPerPage} : 보일개수<br>
<div class="page mt3">
	<form id="listForm" name="listForm" method="get">
		<!-- 수정페이지 열기때문에 필요 -->
	    <input type="hidden" id="postId" name="postId">
	    <!-- 컨트롤러로 보낼 페이지번호 -->
	    <input type="hidden" id="pageIndex" name="pageIndex">
	    
	    <!-- jsp -> 컨트롤러(검색어): input 태그의 name 속성을 이용 -->
		<div class="input-group mb3 mt3">
		  <input type="text" 
		         class="form-control" 
		         id="searchKeyword"
		         name="searchKeyword"
		         placeholder="게시글ID입력"
		  >
		  <button class="btn btn-primary" 
		          type="button" 
		          onclick="fn_egov_selectList()"
		  >
		          검색
		  </button>
		</div>
	    <div id="result"></div>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">postId</th>
		      <th scope="col">userId</th>
		      <th scope="col">categoryId</th>
		      <th scope="col">typeId</th>
		      <th scope="col">boardPostViews</th>
		      <th scope="col">boardPostTitle</th>
		      <th scope="col">boardPostContent</th>
		      <th scope="col">boardPostCreatedAt</th>
		      <th scope="col">boardPostUpdatedAt</th>
		      <th scope="col">boardPostIsDeleted</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<!-- 반복문 -->
		  	<c:forEach var="data" items="${boardPostList}">
		  		<tr>
			      <td>
			      <a href="javascript:fn_select('<c:out value="${data.postId}" />')">
			        <c:out value="${data.postId}"></c:out>
			      </a>
			      	
			      </td>
			      <td><c:out value="${data.userId}"></c:out></td>
			      <td><c:out value="${data.categoryId}"></c:out></td>
			      <td><c:out value="${data.typeId}"></c:out></td>
			      <td><c:out value="${data.boardPostViews}"></c:out></td>
			      <td><c:out value="${data.boardPostTitle}"></c:out></td>
			      <td><c:out value="${data.boardPostContent}"></c:out></td>
			      <td><c:out value="${data.boardPostCreatedAt}"></c:out></td>
			      <td><c:out value="${data.boardPostUpdatedAt}"></c:out></td>
			      <td><c:out value="${data.boardPostIsDeleted}"></c:out></td>
			    </tr>
		  	</c:forEach>

		  </tbody>
		</table>
		<!-- 여기: 페이지번호 -->
		<div class="flex-center">
			<ul class="pagination" id="pagination"></ul>
		</div>
		
	</form>

</div>
<!-- 꼬리말 -->
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 페이징 라이브러리 -->
<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>

<script type="text/javascript">
    /* 페이지번호 클릭시 전체조회 */
	function fn_egov_link_page(page) {
    	/* 현재페이지번호 저장 */
    	$("#pageIndex").val(page);
		$("#listForm").attr("action",'<c:out value="/boardPost/boardPost.do"/>')
					.submit();
	}
	/* 전체조회 */
	function fn_egov_selectList() {
		$("#pageIndex").val(1);    // 최초 화면에서는 페이지번호를 1페이지로 지정
		$("#listForm").attr("action",'<c:out value="/boardPost/boardPost.do"/>')
					.submit();
	}
	/* 수정페이지 열기 */
	function fn_select(postId) {
		$("#postId").val(postId);        // 부서번호(기본키)
		/* 수정페이지 URL:/dept/edition.do */
		$("#listForm").attr("action",'<c:out value="/boardPost/edition.do"/>')
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

</script>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>