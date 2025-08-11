<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="/css/01mypageupdate.css" />
     <style type="text/css">
    a, a:visited, a:hover, a:active {
  color: inherit ;           /* 부모 요소의 색상 상속 */
  text-decoration: none;    /* 밑줄 제거 */
  cursor: pointer;          /* 마우스 포인터 */
  }   
    </style>
</head>

<body>
  <div class="page">
    <jsp:include page="/common/header.jsp" />
    <main>
      <div class="mypage-container">
        <div class="mypage-sidebar-box">
          <ul class="mypage-sidebar">
            <li><a href="<c:url value='/hashtagpage/mypageupdate.do' />" >내 정보</a></li>
            <li><a href="<c:url value='/hashtagpage/mypagecase.do' />" >보관함</a></li>
            <li><a href="<c:url value='/hashtagpage/mypagePurchase.do' />" >구매내역</a></li>
            <li><a href="<c:url value='/hashtagpage/mypageWritten.do' />" >내가 쓴 글</a></li>
            <li><a href="<c:url value='/hashtagpage/mypageInquiry.do' />" >개인문의</a></li>
          </ul>
        </div>
        <div class="mypage-divider"></div> <!-- 선만 별도로 -->
        <div class="mypage-content pl1">
          <div class="mypage-title">
            <h1>마이페이지</h1>
            <div class="mypage-subtitle">
              <h4>내 정보</h4>
              <p></p>
              <div class="mypage-main">
                <div class="mypage-main-box">
                  <div class="profile">
                    <div class="profile-img">
                      <div class="myprofile-img">
                        <img src="/img/profile_img.jpg" alt="빈이미지" />
                      </div>
                      <div class="profile-img-button">

                        <button>수정</button>
                      </div>
                    </div>
                  </div>
                  <div class="mypage-update">

                    <div class="update-box">
                      <span class="mr5"> 아이디 </span>
                      <span class="ml5"><c:out value="${users.userId}"/></span>
                      <p></p>
                    </div>
                    
                    <div class="update-box">
                      <span class="mr5"> 이메일 </span>
                      <span class="ml5"><c:out value="${users.userEmail}"/></span>
                      <p></p>
                    </div>

                    <div class="update-box">
                      <span class="mr5">닉네임</span>
                      <input class="ml5" type="text" placeholder="8자리 이하" value="${users.userName}" />
                      <button class="ml1">변경하기</button>
                    </div>

                    <div class="update-box">
                      <span class="mr1">현재 비밀번호 </span><input type="password"  />
                    </div>

                    <div class="update-box">
                      <span class="mr1"> 변경 비밀번호 </span>
                      <input type="password" placeholder="변경 할 비밀번호" />
                    </div>

                    <div class="update-box">
                      <span class="mr1">변경 비밀번호</span>
                      <input type="password" placeholder="재확인" />
                      <button class="ml1">변경하기</button>
                    </div>

                    <div class="update-box">
                      <span class="mr5"> 핸드폰 </span>
                      <input class="ml5" type="name" placeholder="010-XXXX-XXXX" value="${users.userPhone}"/>
                    </div>

                  </div>

                  <div class="bye">
                    <h5><a href="#">회원탈퇴</a></h5>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>

    </main>
    <jsp:include page="/common/footer.jsp" />
  </div>
 
</body>

</html>