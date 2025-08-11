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
    <link rel="stylesheet" href="/css/04mywritten.css" />
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
            <div class="mywritten-container">
                <div class="mywritten-sidebar-box">
                    <ul class="mywritten-sidebar">
                        <li><a href="<c:url value='/hashtagpage/mypageupdate.do' />" >내 정보</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypagecase.do' />" >보관함</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypagePurchase.do' />" >구매내역</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypageWritten.do' />" >내가 쓴 글</a></li>
                        <li><a href="<c:url value='/hashtagpage/mypageInquiry.do' />" >개인문의</a></li>
                    </ul>
                </div>
                <div class="mywritten-divider"></div> <!-- 선만 별도로 -->
                <div class="mywritten-content pl1">
                    <div class="mywritten-title">
                        <h1>마이페이지</h1>
                        <div class="mywritten-subtitle">
                            <h4>내가 쓴 글</h4>
                            <p></p>
                            <div class="mywritten-main">
                                <div class="mywritten-main-box">
                                    <div class="mywritten-table">
                                        <table>
                                            
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[자유게시판] 오늘은 날씨가 너무 더운데요? 진짜 적당히 더워야 하잖아요 맞자나 </a></th>
                                                            
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                                
                                                
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                       <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[작품추천] 액션 홍길동 이거 재밌음 ㅠㅠ</a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                                 
                                            </tbody>
                                        </table>
                                    </div>
                                       <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[자유게시판] 오늘은 날씨가 너무 더운데요? 진짜 적당히 더워야 하잖아요 맞자나</a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                               
                                            </tbody>
                                        </table>
                                    </div>
                                       <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[작품추천] 액션 홍길동 이거 재밌음 ㅠㅠ</a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                              
                                            </tbody>
                                        </table>
                                    </div>
                                       <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[댓글] ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                       <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[자유게시판] 오늘은 날씨가 너무 더운데요? 진짜 적당히 더워야 하잖아요 맞자나</a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                               
                                            </tbody>
                                        </table>
                                    </div>
                                       <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[작품추천] 액션 홍길동 이거 재밌음 ㅠㅠ </a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                               
                                            </tbody>
                                        </table>
                                    </div>
                                           <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[자유게시판] 오늘은 날씨가 너무 더운데요? 진짜 적당히 더워야 하잖아요 맞자나</a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                           <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[댓글] ㄷㄷㄷ;;; </a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                           <div class="mywritten-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                <th class="title-col"><a href="#">[댓글] 아무거나 일단 </a></th>
                                                </tr>   
                                                <tr>
                                                <td class="date-col">06-24</td>
                                                </tr>
                                               
                                            </tbody>
                                        </table>
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