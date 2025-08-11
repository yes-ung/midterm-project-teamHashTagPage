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
    <link rel="stylesheet" href="/css/05myPurchase.css" />
    <style type="text/css">
    a, a:visited, a:hover, a:active {
  color: inherit ;           /* 부모 요소의 색상 상속 */
  text-decoration: none;    /* 밑줄 제거 */
  cursor: pointer;   /* 마우스 포인터 */
  }
  .title-col {
  color: white;
  }
  .pagination .active {color: white;}
     </style>
</head>

<body>
    <div class="page">
        <jsp:include page="/common/header.jsp" />
        <main>
            <div class="myPurchase-container">
                <div class="myPurchase-sidebar-box">
                    <ul class="myPurchase-sidebar">
                       <li><a href="<c:url value='/hashtagpage/mypageupdate.do' />" >내 정보</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypagecase.do' />" >보관함</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypagePurchase.do' />" >구매내역</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypageWritten.do' />" >내가 쓴 글</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypageInquiry.do' />" >개인문의</a></li>
                    </ul>
                </div>
                <div class="myPurchase-divider"></div> <!-- 선만 별도로 -->
                <div class="myPurchase-content pl1">
                    <div class="myPurchase-title">
                        <h1>마이페이지</h1>
                        <div class="myPurchase-subtitle">
                            <h4>구매 내역</h4>
                            <p></p>
                            <div class="myPurchase-main">
                                <div class="myPurchase-main-box">
                                    <div class="myPurchase-table">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="title-col"><a href="#">충전내역</a></th>
                                                    <th class="title-col"><a href="#">사용내역</a></th>
                                                </tr>
                                            </thead>
                                        </table>

                                    </div>

                                    <!-- 구매내역 본문 -->
                                    <div class="cash-list">

                                        <!-- 충전내역 내용 -->
                                        <div class="Charging-history-box">
                                            <ul class="Charging-history">
                                                <li> 15,000 충전 </li>
                                                <li> 25.08.16 </li>
                                            </ul>
                                            <ul class="Charging-history">
                                                <li> 15,000 충전 </li>
                                                <li> 25.07.12 </li>
                                            </ul>
                                            <ul class="Charging-history">
                                                <li> 15,000 충전 </li>
                                                <li> 25.06.04 </li>
                                            </ul>
                                            <ul class="Charging-history">
                                                <li> 15,000 충전 </li>
                                                <li> 25.05.11 </li>
                                            </ul>
                                            <ul class="Charging-history">
                                                <li> 15,000 충전 </li>
                                                <li> 25.04.01 </li>
                                            </ul>
                                        </div>
                                        <!-- 사용내역 내용 -->
                                        <div class="Usage-history-box">
                                            <ul class="Usage-history">
                                                <li>500CASH 사용 - 액션홍길동4화</li>
                                                <li>25.07.04</li>
                                            </ul>
                                            <ul class="Usage-history">
                                                <li>500CASH 사용 - 액션홍길동4화</li>
                                                <li>25.07.04</li>
                                            </ul>
                                            <ul class="Usage-history">
                                                <li>500CASH 사용 - 액션홍길동4화</li>
                                                <li>25.07.04</li>
                                            </ul>
                                            <ul class="Usage-history">
                                                <li>500CASH 사용 - 액션홍길동4화</li>
                                                <li>25.07.04</li>
                                            </ul>
                                            <ul class="Usage-history">
                                                <li>500CASH 사용 - 액션홍길동4화</li>
                                                <li>25.07.04</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 여기: 페이지번호 -->
                        <div class="pagination">
                            <ul>
                                <li><a href="#">&laquo;</a></li>
                                <!-- 이전 -->
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">&raquo;</a></li>
                                <!-- 다음 -->
                            </ul>
                        </div>
                    </div>
                </div>
        </main>
        <jsp:include page="/common/footer.jsp" />
    </div>

</body>

</html>