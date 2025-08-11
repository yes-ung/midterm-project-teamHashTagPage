<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Document</title>
  <link rel="stylesheet" href="/css/00_style.css" />
  <link rel="stylesheet" href="/css/signup.css" />
</head>
<body>

<div class="signup-body">
    <a href="/"
        ><div class="signup-logo"><img src="/img/샵page.png" alt="page" /></div
      ></a>
  <div class="signup-container">
    <h2>무료 회원가입</h2>
    <form id="addForm" name="addForm"
                        action="/register/addition.do"
                        method="post">
      <input type="text" id="userName" name="userName" placeholder="사용자 이름" required />
      <div class="id-box">
      <input type="text" id="userId" name="userId" placeholder="아이디"  />
      <button type="button" id="checkIdBtn">중복 확인</button>
      </div>
      <div>
      <p id="idCheckMessage" style="display:none;"></p>
      </div>
	 
      
      <input type="email" id="userEmail" name="userEmail" placeholder="이메일 주소" required />
      <input type="password" id="userPw" name="userPw" placeholder="비밀번호" required />
      <input type="password" id="reuserPw" name="reuserPw" placeholder="비밀번호 확인" required />
       <div class="options">
        <label><input type="checkbox" /> 서비스이용약관(필수)에 동의합니다.</label>
        <label><input type="checkbox" /> 개인정보 보호정책(필수)에 동의합니다.</label>
        <label><input type="checkbox" /> #PAGE 소식, 혜택안내 등(선택)에 동의합니다.</label>
      </div>
      <button type="submit">가입하기</button>
    </form>

    <div class="login-link">
      이미 계정이 있으신가요? <a href="<c:url value='/hashtagpage/login.do' />">로그인</a>
    </div>
  </div>
  </div>
  
</body>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 유효성체크 플러그인 -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.21.0/dist/jquery.validate.min.js"></script>
<script src="/js/users/users-validation-config.js"></script>
<script>
  $(document).ready(function() {
    const $userId = $("#userId");
    const $msg = $("#idCheckMessage");

    // 1. 아이디 입력 유효성 실시간 검사
    $userId.on("input", function () {
      const userIdVal = $userId.val().trim();

      if (userIdVal === "") {
        $msg.text("아이디는 필수 입력 항목입니다.").css("color", "red").show();
      } else if (userIdVal.length < 2) {
        $msg.text("아이디는 두 글자 이상 입력해야 합니다.").css("color", "red").show();
      } else {
        $msg.text("").hide(); // 조건 충족 시 메시지 숨김
      }
    });

    // 2. 아이디 중복 확인 버튼 클릭
    $("#checkIdBtn").click(function () {
      const userIdVal = $userId.val().trim();

      if (userIdVal === "") {
        $msg.text("아이디는 필수 입력 항목입니다.").css("color", "red").show();
        return;
      }
      if (userIdVal.length < 2) {
        $msg.text("아이디는 두 글자 이상 입력해야 합니다.").css("color", "red").show();
        return;
      }

      // 조건을 만족했을 때만 AJAX 요청
      $.ajax({
        url: "/checkId.do",
        method: "GET",
        data: { userId: userIdVal },
        dataType: "json",
        success: function (data) {
          $msg.show();
          if (data.available) {
            $msg.text("사용 가능한 아이디입니다.").css("color", "green");
          } else {
            $msg.text("이미 사용 중인 아이디입니다.").css("color", "red");
          }
        },
        error: function () {
          alert("서버 오류가 발생했습니다.");
        }
      });
    });
  });
</script>



</html>
