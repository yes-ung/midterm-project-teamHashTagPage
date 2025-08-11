<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/06myinquiry.css" />
<style type="text/css">
a, a:visited, a:hover, a:active {
	color: inherit; /* 부모 요소의 색상 상속 */
	text-decoration: none; /* 밑줄 제거 */
	cursor: pointer; /* 마우스 포인터 */
}
</style>

</head>

<body>
	<div class="page">
		<jsp:include page="/common/header.jsp" />
		<main>
			<div class="myinquiry-container">
				<div class="myinquiry-sidebar-box">
					<ul class="myinquiry-sidebar">
						<li><a href="<c:url value='/hashtagpage/mypageupdate.do' />">내
								정보</a></li>
						<li><a href="<c:url value='/hashtagpage/mypagecase.do' />">보관함</a></li>
						<li><a
							href="<c:url value='/hashtagpage/mypagePurchase.do' />">구매내역</a></li>
						<li><a href="<c:url value='/hashtagpage/mypageWritten.do' />">내가
								쓴 글</a></li>
						<li><a href="<c:url value='/userMyQna.do' />">개인문의</a></li>
					</ul>
				</div>
				<div class="myinquiry-divider"></div>
				<!-- 선만 별도로 -->
				<div class="myinquiry-content pl1">
					<div class="myinquiry-title">
						<h1>마이페이지</h1>
						<div class="myinquiry-subtitle">
							<h4>개인문의 하기</h4>

							<p></p>
							<div class="myinquiry-main">

								<div class="myinquiry-main-box">
									<div class="myinquiry-main-body">
										<form id="addForm" name="addForm" action="/userQnasubmit.do"
											method="post" class="myinquiry-form">
											<input type="text" class="user-qna-title" id="userQnaTitle"
												name="userQnaTitle" placeholder="제목">

											<textarea placeholder="500자 이내 입력 바랍니다." id="userQnaContent"
												name="userQnaContent"></textarea>


											<button type="submit" class="submit">전송</button>


										</form>
										<p>개인 문의함</p>
										<c:forEach var="qna" items="${userMyQnas}">
											<div class="myinquirysend-table">
												<table>
													<tbody>
														<tr class="qna-title-row" style="cursor: pointer;">
															<td class="title-col"><a>[문의]
																	${qna.userQnaTitle}</a></td>
														</tr>
														<tr class="qna-content-row" style="display: none;">
															<td class="content-col">${qna.userQnaContent}</td>
														</tr>
														<tr>
															<td class="date-col">${qna.userQnaAt}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</c:forEach>
										<!-- 여기: 페이지번호 -->
										<div class="flex-center">
											<ul class="pagination" id="pagination">
												<c:forEach begin="1" end="${paginationInfo.totalPageCount}"
													var="i">
													<li
														class="${i == paginationInfo.currentPageNo ? 'active' : ''}">
														<a href="?pageIndex=${i}">${i}</a>
													</li>
												</c:forEach>
											</ul>
										</div>


									</div>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- 페이징 전용 form (보이지 않게) -->
			<form id="listForm" method="get">
				<input type="hidden" id="pageIndex" name="pageIndex" value="1" />
				<!-- 나머지 검색 조건들 포함 -->
			</form>

		</main>
		<jsp:include page="/common/footer.jsp" />
	</div>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 부트스트랩 js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<!-- 페이징 라이브러리 -->
	<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>


<!-- 문의 내용 클릭시 내용 나옴 -->
<script>
$(document).ready(function() {
  $('.qna-title-row').on('click', function() {
    // 같은 테이블 내 다음에 나오는 .qna-content-row를 토글
    $(this).next('.qna-content-row').slideToggle(200);
  });
});
</script>

	<!-- 페이지 번호 클릭 시 실행되는 함수 -->
	<script type="text/javascript">
	function fn_egov_link_page(page) {
		$("#pageIndex").val(page);
		$("#listForm").attr("action", "<c:out value='/userMyQna.do' />").submit();
	}
</script>

	<!-- 페이징 처리 -->
	<script type="text/javascript">
	$('#pagination').twbsPagination({
		totalPages: ${paginationInfo.totalPageCount},
		startPage: ${paginationInfo.currentPageNo},
		visiblePages: ${paginationInfo.recordCountPerPage},
		initiateStartPageClick: false,
		onPageClick: function (event, page) {
			fn_egov_link_page(page);
		}
	});
</script>



</body>

</html>