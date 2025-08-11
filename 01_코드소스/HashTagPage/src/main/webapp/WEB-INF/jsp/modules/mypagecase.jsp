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
    <link rel="stylesheet" href="/css/02mycase.css" />    
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
            <div class="mycase-container">
                <div class="mycase-sidebar-box">
                    <ul class="mycase-sidebar">
                        <li><a href="<c:url value='/hashtagpage/mypageupdate.do' />" >내 정보</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypagecase.do' />" >보관함</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypagePurchase.do' />" >구매내역</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypageWritten.do' />" >내가 쓴 글</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypageInquiry.do' />" >개인문의</a></li>

                    </ul>
                </div>
                <div class="mycase-divider"></div> <!-- 선만 별도로 -->
                <div class="mycase-content pl1">
                    <div class="mycase-title">
                        <h1>보관함</h1>
                        <div class="mycase-subtitle">
                        <div class="mycase-subtitlebox">
                                <a href="<c:url value='/hashtagpage/mypagecase.do' />" ><h4>최근 본 작품</h4></a>
                                <a href="<c:url value='/hashtagpage/mypageCaseZzim.do' />" ><h4>찜 목록</h4></a>
                                <a href="<c:url value='/hashtagpage/mypageCoupon.do' />"><h4>쿠폰함</h4></a>
                            </div>                                              
                            <p></p>
                            <div class="mycase-main">
                                <div class="mycase-main-box">
                                    <div class="mycase-main-body">
                                        <div class="recent-card">
                                            <a href="#"><img src="/img/img4.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="recent-card">
                                            <a href="#"><img src="/img/img3.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img2.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img1.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img4.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img3.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img2.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img1.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img4.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img3.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img2.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
                                                </div>
                                            </div>
                                        </div><div class="recent-card">
                                            <a href="#"><img src="/img/img1.jpg" alt="빈이미지" /></a>
                                            <div class="star-rating">
                                                <div class="star-info">
                                                    <h5>액션 길동이</h5>
                                                    <h5>길동/진이</h5>
                                                <span class="star">&#9733;</span>
                                                <span class="score">(4.8)</span>
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

</html>