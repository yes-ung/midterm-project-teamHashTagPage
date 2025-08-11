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
    <link rel="stylesheet" href="/css/02mycase-coupon.css" />
<style type="text/css">
    a, a:visited, a:hover, a:active {
  color: inherit ;           /* 부모 요소의 색상 상속 */
  text-decoration: none;    /* 밑줄 제거 */
  cursor: pointer;          /* 마우스 포인터 */
  }   
    </style>

</head>

<body>
  <body>
    <div class="page">
      <jsp:include page="/common/header.jsp" />
      <main>
        <div class="couponlist-container">
          <div class="couponlist-sidebar-box">
            <ul class="couponlist-sidebar">
              <li><a href="<c:url value='/hashtagpage/mypageupdate.do' />" >내 정보</a></li>
              <li><a href="<c:url value='/hashtagpage/mypagecase.do' />" >보관함</a></li>
              <li><a href="<c:url value='/hashtagpage/mypagePurchase.do' />" >구매내역</a></li>
              <li><a href="<c:url value='/hashtagpage/mypageWritten.do' />" >내가 쓴 글</a></li>
              <li><a href="<c:url value='/hashtagpage/mypageInquiry.do' />" >개인문의</a></li>
            </ul>
          </div>
          <div class="couponlist-divider"></div>
          <!-- 선만 별도로 -->
          <div class="couponlist-content pl1">
            <div class="couponlist-title">
              <h1>보관함</h1>
              <div class="couponlist-subtitle">
                <div class="couponlist-subtitlebox">
                  <a href="<c:url value='/hashtagpage/mypagecase.do' />" ><h4>최근 본 작품</h4></a>
                  <a href="<c:url value='/hashtagpage/mypageCaseZzim.do' />" ><h4>찜 목록</h4></a>
                  <a href="<c:url value='/hashtagpage/mypageCoupon.do' />"><h4>쿠폰함</h4></a>
                </div>
                <p></p>
                <div class="couponlist-main">
                  <div class="couponlist-box">
                    <div class="coupon-container">
                      <div class="input-section">
                        <input
                          type="text"
                          placeholder="'-'없이 20자리를 입력하세요."
                        />
                        <button>등록</button>
                      </div>
                      <div class="coupon">
                        <div class="condition"><img src="/img/50percent.png" alt="할인">
                          <div class="details">
                            신규회원 첫 가입 50% 할인 쿠폰<br />2099년12월31일까지
                            <br/><a href="#">사용하러가기 &gt;</a>
                          </div>
                        </div>
                        
                      </div>

                      
                      </div>
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
</body>

</html>