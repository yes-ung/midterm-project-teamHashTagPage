<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/findIdModal.css" />
</head>
<body>
<c:if test="${not empty message}">
<script>
    alert("${message}");
</script>
</c:if>


	<div class="login-body">
		<a href="/"><div class="login-logo">
				<img src="/img/샵page.png" alt="page" />
			</div></a>
		<div class="login-container">
			<h2>로그인</h2>
			<form id="addForm" name="addForm" action="/loginProcess.do"
				method="post">
				<input type="text" id="userId" name="userId" placeholder="아이디" /> <input
					type="password" id="userPw" name="userPw" placeholder="비밀번호" />

				<div class="options">
					<label><input type="checkbox" /> 아이디저장</label> <label><input
						type="checkbox" /> 자동로그인</label>
				</div>

				<button type="submit" class="login-btn">로그인</button>
			</form>
			<div class="links">
				<a href="#" onclick="openFindIdModal();">아이디찾기</a> | 
				<a href="#" onclick="openFindPwModal();">비밀번호찾기</a> | 
				<a href="<c:url value='/hashtagpage/signup.do' />">회원가입</a>
			</div>

			<div class="social-icons">
				<button id="kakaoLoginBtn"><img src="/img/KakaoTalk_20250714_124104515.png" alt="카카오 로그인" /></button>
				<img src="/img/KakaoTalk_20250714_124104620.png" alt="네이버 로그인" /> 
			   <button id="googleLoginBtn"><img src="/img/KakaoTalk_20250714_124104744.png" alt="구글 로그인" /></button>
			</div>
			
		</div>
		<c:if test="${not empty msg}">
			<script>
      alert("${msg}");
    </script>
		</c:if>
		<c:if test="${not empty msg2}">
			<script>
      alert("${msg2}");
    </script>
		</c:if>
		
		
		<!-- 아이디 찾기 모달 -->
<div id="findIdModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeFindIdModal()">&times;</span>
    <h2>아이디 찾기</h2>
    <form  id="findIdForm" action="/user/findId.do" method="post" onsubmit="return findId();">
      <input type="text" id="userName" name="userName" placeholder="사용자 이름" />
      <input type="email" id="userEmail" name="userEmail" placeholder="사용자 이메일" />
		<div class="find-id-box">
      <button type="submit"  class="find-id-btn">아이디 찾기</button>
      </div>
    </form>
  </div>
</div>

<!-- 비밀번호 찾기 모달 -->
<div id="findPwModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeFindPwModal()">&times;</span>
    <h2>비밀번호 찾기</h2>
    <form id="findPwForm" action="/user/findPw.do" method="post" onsubmit="return findPw();">
      
      <input type="text" id="userId" name="userId" placeholder="사용자 아이디">
      <input type="email" id="userEmail" name="userEmail" placeholder="사용자 이메일">
		<div class="find-pw-box">
      <button type="submit" class="find-pw-btn">비밀번호 찾기</button>
      </div>
    </form>
  </div>
</div>
		
		
		
	</div>

	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 부트스트랩 js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
<!-- 유효성체크 플러그인 -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.21.0/dist/jquery.validate.min.js"></script>
	<script src="/js/users/users-validation-config.js"></script>

	<!-- 카카오 로그인 -->
	<script>
  document.getElementById('kakaoLoginBtn').addEventListener('click', function() {
    window.location.href = 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=10f64f44255b5fdea9934c39d904037d&redirect_uri=http://localhost:8080/login.do';
  });
</script>
	<!-- 구글 로그인 -->
	<script>
  document.getElementById('googleLoginBtn').addEventListener('click', function() {
    window.location.href =
      'https://accounts.google.com/o/oauth2/v2/auth' +
      '?client_id=329613947953-2u9e01g5tauqesiedg7o38tbklkraqd0.apps.googleusercontent.com' + // 네가 발급받은 클라이언트 ID
      '&redirect_uri=http://localhost:8080/google/login.do' + // 이 URI는 구글 콘솔에도 등록되어 있어야 함
      '&response_type=code' +
      '&scope=email%20profile' + // 이메일과 프로필 정보 요청
      '&access_type=offline';
  });
</script>


	<script>
  // 아이디 찾기 모달 열기
  function openFindIdModal() {
    document.getElementById("findIdModal").style.display = "block";
  }

  // 아이디 찾기 모달 닫기
  function closeFindIdModal() {
    document.getElementById("findIdModal").style.display = "none";
  }

  // 아이디 찾기 요청
  function findId() {
    const formData = new FormData(document.getElementById("findIdForm"));

    fetch("/user/findId.do", {
      method: "POST",
      body: formData
    })
      .then(response => response.text())
      .then(userId => {
        if (userId) {
          alert("당신의 아이디는: " + userId + " 입니다.");
          location.href = "/hashtagpage/login.do";
        } else {
          alert("일치하는 정보가 없습니다.");
        }
      })
      .catch(err => {
        console.error(err);
        alert("에러가 발생했습니다.");
      });

    return false; // 폼이 실제 제출되는 것을 방지
  }

  // 비밀번호 찾기 모달 열기
  function openFindPwModal() {
    document.getElementById("findPwModal").style.display = "block";
  }

  // 비밀번호 찾기 모달 닫기
  function closeFindPwModal() {
    document.getElementById("findPwModal").style.display = "none";
  }

  // 비밀번호 찾기 요청
 function findPw() {
  const formData = new FormData(document.getElementById("findPwForm"));

  fetch("/user/findPw.do", {
    method: "POST",
    body: formData
  })
    .then(response => response.text())
    .then(msg => {
      if (msg.includes("전송")) {
        alert("임시 비밀번호가 전송되었습니다.");
        location.href = "/hashtagpage/login.do"; // 로그인 페이지로 이동
      } else {
        alert(msg); // 예: "아이디 또는 이메일이 일치하지 않습니다."
      }
    })
    .catch(err => {
      console.error(err);
      alert("에러가 발생했습니다.");
    });

  return false; // 폼 기본 제출 막기
}

  // 모달 외부 클릭 시 닫기
  window.onclick = function (event) {
    const idModal = document.getElementById("findIdModal");
    const pwModal = document.getElementById("findPwModal");
    if (event.target === idModal) {
      idModal.style.display = "none";
    }
    if (event.target === pwModal) {
      pwModal.style.display = "none";
    }
  };
</script>

</body>
</html>
