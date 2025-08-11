<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 	부트스트랩 css  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- 	개발자 css -->
	<link rel="stylesheet" href="/css/style.css">
    
</head>
<body>
${boardPostVO}
<jsp:include page="/common/header.jsp"/>
<div class="page mt3">
    <form id="addForm" name="addForm" method="post">
		<!-- 여기: 보안토큰 -->
		<input type="hidden" name="csrf" value="${sessionScope.CSRF_TOKEN}">
 		<input type="hidden" name="postId" value="<c:out value='${boardPostVO.postId}' />">      
        <div class="mb3">
            <label for="userId" class="form-label">userId</label>
            <input 
                   class="form-control"
                   id="userId"
            	   name="userId"
            	   value="<c:out value='${boardPostVO.userId}' />"
                   placeholder="userId" />
        </div>        <div class="mb3">
            <label for="categoryId" class="form-label">categoryId</label>
            <input 
                   class="form-control"
                   id="categoryId"
            	   name="categoryId"
            	   value="<c:out value='${boardPostVO.categoryId}' />"
                   placeholder="categoryId" />
        </div>        <div class="mb3">
            <label for="typeId" class="form-label">typeId</label>
            <input 
                   class="form-control"
                   id="typeId"
            	   name="typeId"
            	   value="<c:out value='${boardPostVO.typeId}' />"
                   placeholder="typeId" />
        </div>        <div class="mb3">
            <label for="boardPostViews" class="form-label">boardPostViews</label>
            <input 
                   class="form-control"
                   id="boardPostViews"
            	   name="boardPostViews"
            	   value="<c:out value='${boardPostVO.boardPostViews}' />"
                   placeholder="boardPostViews" />
        </div>        <div class="mb3">
            <label for="boardPostTitle" class="form-label">boardPostTitle</label>
            <input 
                   class="form-control"
                   id="boardPostTitle"
            	   name="boardPostTitle"
            	   value="<c:out value='${boardPostVO.boardPostTitle}' />"
                   placeholder="boardPostTitle" />
        </div>
        <div class="mb3">
            <label for="boardPostContent" class="form-label">boardPostContent</label>
            <input 
                   class="form-control"
                   id="boardPostContent"
            	   name="boardPostContent"
            	   value="<c:out value='${boardPostVO.boardPostContent}' />"
                   placeholder="boardPostContent" />
        </div>
<%--          <div class="mb3">
            <label for="boardPostCreatedAt" class="form-label">boardPostCreatedAt</label>
            <input 
                   class="form-control"
                   id="boardPostCreatedAt"
            	   name="boardPostCreatedAt"
            	   value="<c:out value='${boardPostVO.boardPostCreatedAt}' />"              
                   placeholder="boardPostCreatedAt" />
        </div>
        <div class="mb3">
            <label for="boardPostUpdatedAt" class="form-label">boardPostUpdatedAt</label>
            <input 
                   class="form-control"
                   id="boardPostUpdatedAt"
            	   name="boardPostUpdatedAt"
            	   value="<c:out value='${boardPostVO.boardPostUpdatedAt}' />"              
                   placeholder="boardPostUpdatedAt" /> 
        </div>        --%>
        <div class="mb3">
            <label for="boardPostIsDeleted" class="form-label">boardPostIsDeleted</label>
            <input 
                   class="form-control"
                   id="boardPostIsDeleted"
            	   name="boardPostIsDeleted"
            	   value="<c:out value='${boardPostVO.boardPostIsDeleted}' />"              
                   placeholder="boardPostIsDeleted" />
        </div>        
        <div class="mb3">
            <button class="btn btn-warning"
            		type="button"
            		onclick="fn_save()"
            >수정</button>
                        
            <button class="btn btn-danger"
            		type="button"
            		onclick="fn_delete()"
            >삭제</button>
        </div>
    </form>
</div>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 유효성체크 플러그인 -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.21.0/dist/jquery.validate.min.js"></script>
<script src="/js/boardPost/boardPost-validation-config.js"></script>

<script type="text/javascript">
	function fn_save() {
		/* 저장 함수: 저장 URL(/dept/edit.do) */
		$("#addForm").attr("action",'<c:out value="/boardPost/edit.do"/>')
		.submit();		
	}
	/* 삭제: /dept/delete.do */
	function fn_delete() {
		$("#addForm").attr("action",'<c:out value="/boardPost/delete.do"/>')
		.submit();
	}
</script>

<jsp:include page="/common/footer.jsp"/>
</body>
</html>
