<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page="/common/header.jsp"/>
<div class="page mt3">
	<form id="addForm" name="addForm" method="post">
		<!-- 여기: 보안토큰 -->
		<input type="hidden" name="csrf" value="${sessionScope.CSRF_TOKEN}">
 		<div class="mb3">
            <label for="boardCommentId" class="form-label">boardCommentId</label>
            <input  
            		class="form-control"
            		id="boardCommentId"
            		name="boardCommentId"
            		placeholder="boardCommentId" />
        </div> 
        <div class="mb3">
            <label for="postId" class="form-label">postId</label>
            <input  
            		class="form-control"
            		id="postId"
            		name="postId"
            		placeholder="postId" />
        </div>
        <div class="mb3">
            <label for="boardCommentContent" class="form-label">boardCommentContent</label>
            <input 
                   class="form-control"
                   id="boardCommentContent"
            	   name="boardCommentContent"
                   placeholder="boardCommentContent" />
        </div>
<!--  		<div class="mb3">
            <label for="boardCommentCreatedAt" class="form-label">boardCommentCreatedAt</label>
            <input  
            		class="form-control"
            		id="boardCommentCreatedAt"
            		name="boardCommentCreatedAt"
            		placeholder="boardCommentCreatedAt" />
        </div>  		 -->
        <div class="mb3">
            <label for="boardCommentIsDeleted" class="form-label">boardCommentIsDeleted</label>
            <input  
            		class="form-control"
            		id="boardCommentIsDeleted"
            		name="boardCommentIsDeleted"
            		placeholder="boardCommentIsDeleted" />
        </div>  		<div class="mb3">
            <label for="userId" class="form-label">userId</label>
            <input  
            		class="form-control"
            		id="userId"
            		name="userId"
            		placeholder="userId" />
        </div>  		
        <div class="mb3">
            <button class="btn btn-primary"
            		onclick="fn_save()"
              >저장</button>
        </div>
    </form>
</div>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 유효성체크 플러그인 -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.21.0/dist/jquery.validate.min.js"></script>
<script src="/js/boardComment/boardComment-validation-config.js"></script>

<script type="text/javascript">
	function fn_save() {
		/* 저장 함수: 저장 URL(/dept/add.do) */
		$("#addForm").attr("action",'<c:out value="/boardComment/add.do"/>')
		.submit();		
	}
</script>

<jsp:include page="/common/footer.jsp"/>
</body>
</html>
