<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Main Header</title>
     <link rel="stylesheet" href="/css/main-header.css" />
  </head>
  <body>
    <div class="page">
      <header class="main-header">
        <div class="header-container ml2 mr2 pt2 pb3">
          <div class="logo">
            <a href="/"><img src="/img/pagelogo1.png" alt="로고" /></a>
          </div>
          <div class="auth-area" data-auth="guest">
                  <!-- {/* TODO: 로그인 시작 */} -->
        <!-- memberVO 가 세션에 없으면 메뉴을 보이고, 있으면 안보임 -->
        <c:if test="${sessionScope.usersVO == null}">       	
	    <a href="<c:url value='/hashtagpage/signup.do'/>" class="a-rounded signup"> 회원가입 </a>
	    <a href="<c:url value='/hashtagpage/login.do'/>" class="a-rounded login"> 로그인 </a>
        </c:if>
         <!-- {/* 로그아웃 시작 */} -->
        <!-- memberVO 가 세션에 있으면 메뉴을 보이고, 없으면 안보임 -->
        <c:if test="${sessionScope.usersVO != null}">
	     <a href="<c:url value='/logout.do'/>" class="a-rounded logout"> 로그아웃</a>
	     <a href="<c:url value='/hashtagpage/cart.do'/>" class="a-rounded cart">장바구니</a>
         <a href="<c:url value='/hashtagpage/mypage.do'/>" class="a-rounded mypage">내정보</a>
	    </c:if>
        <!-- {/* 로그아웃 끝 */} -->
          </div>
        </div>

        <nav class="nav-bar mb1">
                   <!-- 검색창 -->
          <form id="searchForm"
                name="searchForm"
                method="get" action="<c:out value='/hashtagpage/search.do' />">
          <div class="search-bar">
            <button type="submit" class="btn-search"><img src="/img/hashtagp.png" alt="썸네일" /></button>
            <input type="text" id=search name=search placeholder="작품명 / 작가명" />
            </div>
          </form>

          <div class="menu-nav">
            <ul class="main-menu">
              <li>
              <c:url var="webtoonUrl" value="/hashtagpage/webtoon.do" />
                <button class="menu-link active" data-type="webtoon" onclick="location.href='${webtoonUrl}'">
                  웹툰
                </button>
              </li>
              <li>
              <c:url var="webnovelUrl" value="/hashtagpage/webnovel.do" />             
                <button class="menu-link" data-type="webnovel" onclick="location.href='${webnovelUrl}'">
                웹소설</button>
              </li>
              <li>
              <c:url var="communityUrl" value="/hashtagpage/community/freeWrite.do" />
                <button class="menu-link" data-type="community" onclick="location.href='${communityUrl}'">
                  커뮤니티
                </button>
              </li>
            </ul>
            <div class="submenu-box" id="submenu-box">
              <!-- JS로 동적 삽입 -->
            </div>
          </div>
        </nav>
      </header>
    </div>
<%
  String status = request.getParameter("status");
  if (status == null) status = "user";
%>
<script type="text/javascript">

function click01() {
	
}

  initHeaderInteractions("<%= status %>");

function initHeaderInteractions(status) {
	  const authArea = document.querySelector(".auth-area");
	  const submenuBox = document.getElementById("submenu-box");
	  const menuLinks = document.querySelectorAll(".menu-link");

	  const menuData = {
			  webtoon: [
			    { name: "판타지/SF", url: "/hashtagpage/webtoon.do?genre=판타지,SF" },
			    { name: "로맨스", url: "/hashtagpage/webtoon.do?genre=로맨스" },
			    { name: "무협/액션", url: "/hashtagpage/webtoon.do?genre=무협,액션" },
			    
			    { name: "공포/추리", url: "/hashtagpage/webtoon.do?genre=공포,추리" },
			    
			    { name: "퓨전", url: "/hashtagpage/webtoon.do?genre=퓨전" },
			    { name: "BL/GL", url: "/hashtagpage/webtoon.do?genre=BL,GL" }
			  ],
			  webnovel: [
			    { name: "판타지/SF", url: "/hashtagpage/webnovel.do?genre=판타지,SF" },
			    { name: "로맨스", url: "/hashtagpage/webnovel.do?genre=로맨스" },
			    { name: "로맨스판타지", url: "/hashtagpage/webnovel.do?genre=로판" },
			    { name: "무협", url: "/hashtagpage/webnovel.do?genre=무협" },
			    { name: "공포/추리", url: "/hashtagpage/webnovel.do?genre=공포,추리" },
			    { name: "BL/GL", url: "/hashtagpage/webnovel.do?genre=BL,GL" }
			  ],
			  community: [
			    { name: "자유게시판", url: "/hashtagpage/community/freeWrite.do" },
			    { name: "뜨거운논쟁", url: "/hashtagpage/community/hottalk.do" },
			    { name: "작품추천", url: "/hashtagpage/community/recommend.do" }
			  ]
			};
	  
	  
	  function renderAuthMenu() {
		    if (!authArea) return;	
		  }

	  function renderSubmenu(type) {
	    if (!submenuBox) return;
	    submenuBox.innerHTML = "";
	    menuData[type].forEach(item => {
	      const link = document.createElement("a");
	      link.href = item.url; //  링크 경로
	      link.textContent = item.name; //  보이는 이름
	      submenuBox.appendChild(link);
	    });
	  }

	  renderAuthMenu();
	  
	// 1. 현재 경로 가져오기
	  const path = location.pathname;

	  // 2. 어떤 menuLink가 현재 경로에 해당하는지 확인
	  let matchedType = ""; // 기본값

	  menuLinks.forEach(link => {
	    const type = link.dataset.type;
	    if (path.includes(type)) {
	      matchedType = type;
	      link.classList.add("active");
	    } else {
	      link.classList.remove("active");
	    }
	  });

	  // 3. 해당 서브메뉴 렌더링
	  renderSubmenu(matchedType);


	}

</script>
   
  </body>
</html>

