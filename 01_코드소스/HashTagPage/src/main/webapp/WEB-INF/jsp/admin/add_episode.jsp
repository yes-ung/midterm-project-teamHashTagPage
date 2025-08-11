<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!--    부트스트랩 css  -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <!--    개발자 css -->
   <link rel="stylesheet" href="/css/style.css">
<style type="text/css">
.longText input{
height: 500px;
}
</style>

</head>
<body>
<jsp:include page="/common/header.jsp"/>
<div class="page mt3">
<!-- 업로드 시 추가(첨부파일이라는 요청) : enctype="multipart/form-data"  -->
<!-- 스프링 업로드 파일 제한 : (기본값)1M -> 10M -->
   <form id="addForm"
         name="addForm"
         method="post"
         enctype="multipart/form-data"
         >
   <div class="mb3">
            <label for="episodeId" class="form-label">에피소드 회차(숫자만,중복안됨)</label>
            <input 
                   class="form-control"
                   id="episodeId"
                   name="episodeId"
                   placeholder="내용입력" />
        </div>
        <div class="mb3">
            <label for="seriesId" class="form-label">시리즈 번호(연재작품)</label>
            <input  
                  class="form-control"
                  id="seriesId"
                  name="seriesId"
                  placeholder="내용입력" />
        </div>
        <div class="mb3">
            <label for="episodeTitle" class="form-label">에피소드 제목(각화 소제목)</label>
            <input  
                  class="form-control"
                  id="episodeTitle"
                  name="episodeTitle"
                  placeholder="내용입력" />
        </div>
          <div class="mb3">
            <label for="episodePrice" class="form-label">에피소드 가격</label>
            <input 
                   class="form-control"
                   id="episodePrice"
                   name="episodePrice"
                   placeholder="내용입력" />
        </div>
      
        <div class="mb3  longText">
            <label for="viewText" class="form-label">책 내용(소설이거나 단행본일경우)</label>
            <input  
                  class="form-control"
                  id="viewText"
                  name="viewText"
                  placeholder="소설내용" />
        </div>
       
      <div class="input-group">
      <!-- type="file" : 파일대화상자가 화면에 보입니다. -->
       <label for="thumbnailFile" class="form-label">책 썸네일</label>
        <input type="file" 
               class="form-control"
                id="thumbnailFile"
                name="thumbnailFile" 
               >
        <label for="toonFile" class="form-label">책 내용(웹툰일경우)</label>
        <input type="file" 
               class="form-control"
                id="toonFile"
                name="toonFile" 
               >      
        <button class="btn btn-primary" 
                type="button"
                onclick="fn_save()"
                >저장</button>
      </div>
    </form>
</div>
<br><br><br>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script type="text/javascript">
   function fn_save() {
	   $("#addForm").attr("action",'<c:out value="/episode/add.do" />')
       .submit();
   }
</script>

<jsp:include page="/common/footer.jsp"/>
</body>
</html>
