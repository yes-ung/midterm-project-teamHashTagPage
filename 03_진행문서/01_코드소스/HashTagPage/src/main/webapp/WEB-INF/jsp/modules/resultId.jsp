<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/resultId.css" />

</head>
<body>
    <div class="resultid-body">
      <a href="/"
        ><div class="resultid-logo">
          <img src="/img/샵page.png" alt="page" /></div
      ></a>
      <div class="resultid-container">
        <div id="div_email" class="box_inn selected">
          <div class="box_inn_sub">
            <h1>아이디 찾기</h1>
            <p class="dsc">고객님의 정보와 일치하는 아이디입니다.</p>
            <div class="findid-result">DB에서 회원정보 ID 보여주는 곳</div>
            <div class="btn-container">
              <a href="<c:url value='/hashtagpage/login.do' />" >
 <button type="nxtBtn">로그인하기</button></a>

              <a href="<c:url value='/hashtagpage/findPassword.do' />" >
<button type="nxtBtn">비밀번호 찾기</button></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
