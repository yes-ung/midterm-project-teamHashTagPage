<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>simple-header</title>
    <link rel="stylesheet" href="/css/simple-header.css" />    
  </head>
  <body>
   
     <!-- 헤더 -->
    <header class="simple-header mt5 pl2 pr2">
      <div class="search-logo">
        <a href="<c:url value='/hashtagpage.do'/>"><img src="/img/pagelogo1.png" alt="로고" /></a>
      </div>

      <div class="auth-area">
                        <!-- {/* TODO: 로그인 시작 */} -->
        <!-- memberVO 가 세션에 없으면 메뉴을 보이고, 있으면 안보임 -->
        <c:if test="${sessionScope.usersVO == null}">       	
	    <a href="<c:url value='/hashtagpage/signup.do'/>" class="a-rounded-al signup"> 회원가입 </a>
	    <a href="<c:url value='/hashtagpage/login.do'/>" class="a-rounded-al login"> 로그인 </a>
        </c:if>
         <!-- {/* 로그아웃 시작 */} -->
        <!-- memberVO 가 세션에 있으면 메뉴을 보이고, 없으면 안보임 -->
        <c:if test="${sessionScope.usersVO != null}">
	     <a href="<c:url value='/hashtagpage/cart.do'/>" class="a-rounded-al cart">장바구니</a>
         <a href="<c:url value='/hashtagpage/mypage.do'/>" class="a-rounded-al wishlist">내정보</a>
         <a href="<c:url value='/logout.do'/>" class="a-rounded-al logout"> 로그아웃</a>
	    </c:if>
        <!-- {/* 로그아웃 끝 */} -->
      
      
          
      </div>
    </header>

  </body>
</html>