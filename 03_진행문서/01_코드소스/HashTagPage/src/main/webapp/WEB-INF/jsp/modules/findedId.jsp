<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#Page Find Id</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/findid.css" />

</head>
<body>
    <div class="findid-body">
  <a href="#">
    <div class="findid-logo"><img src="/img/샵page.png" alt="page" /></div>
  </a>
  <div class="findid-container">
    <div id="div_email" class="box_inn selected">
      <div class="box_inn_sub">
        <dl>
          <dd>
            <input
              type="text"
              id="emailNm"
              name="emailNm"
              maxlength="40"
              class="input_txt"
              placeholder="이름"
            />
          </dd>
          <dd>
            <input
              type="text"
              id="email"
              name="email"
              maxlength="100"
              class="input_txt"
              placeholder="이메일 주소"
            />
          </dd>
        </dl>
        <div class="btn_area">
          <button onclick="findId()">다음</button>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  function findId() {
    const name = document.getElementById("emailNm").value.trim();
    const email = document.getElementById("email").value.trim();
    if (!name || !email) {
      alert("이름과 이메일을 모두 입력해 주세요.");
      return;
    }
    const formData = new FormData();
    formData.append("emailNm", name);
    formData.append("email", email);
    fetch("/user/findId.do", {
      method: "POST",
      body: formData,
    })
      .then((res) => res.text())
      .then((userId) => {
        if (userId && userId.trim() !== "") {
          // 결과 페이지로 이동하면서 URL에 userId 전달
          location.href = "/resultid.html?userId=" + encodeURIComponent(userId);
        } else {
          alert("일치하는 아이디가 없습니다.");
        }
      })
      .catch((err) => {
        console.error(err);
        alert("서버 오류가 발생했습니다.");
      });
  }
</script>
  </body>
</html>
