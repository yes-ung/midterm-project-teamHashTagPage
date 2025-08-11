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
            <li><a href="<c:url value='/userMyQna.do' />" >개인문의</a></li>
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
                      <span class="mr5"> 이메일 </span>
                      <span class="ml5"><c:out value="${users.userEmail}"/></span>
                      <p></p>
                    </div>

                    <div class="update-box">
                      <span class="mr5">닉네임</span>
                      <input class="ml5" type="text" placeholder="8자리 이하" id="nicknameInput" value="${users.userName}" />
                      <button class="ml1" id="nicknameUpdateBtn">변경하기</button>
                    </div>
                    
                    <div class="update-box">
                    <div class="update-box-pwc">
					<p>비밀번호 변경 시 현재 비밀번호 인증 필수</p>
					</div>
                      <span class="mr1">현재 비밀번호 </span><input type="password" id="currentPw" />
                      <button id="pwCheckBtn" class="ml1">인증하기</button>
                    </div>
					<!-- ✅ 변경 비밀번호와 재확인 영역 묶어서 숨기기 -->
					<div id="pw-change-section" style="display: none;">
                    <div class="update-box">
                      <span class="mr1"> 변경 비밀번호 </span>
                      <input type="password" id="newPassword" placeholder="변경 할 비밀번호" />
                    </div>

                    <div class="update-box">
                      <span class="mr1">변경 비밀번호</span>
                      <input type="password" id="confirmPassword" placeholder="재확인" />
                      <button id="changePasswordBtn" class="ml1">변경하기</button>
                    </div>
					</div>
                    <div class="update-box">
                      <span class="mr5"> 핸드폰 </span>
                      <input class="ml5" type="text" id="phoneInput" placeholder="010-XXXX-XXXX" value="${users.userPhone}"/>
                      <button  class="ml1" id="phoneUpdateBtn">등록하기</button>
                    </div>

                  </div>

                  <div class="logout2">
                  
                    <h5><a href="<c:url value='/logout.do'/>" >로그아웃</a></h5>
                  </div>

                  <div class="bye">
  				<form id="deleteForm" action="<c:url value='/user/delete.do' />" method="post">
    				<button type="button" onclick="confirmDelete()">회원탈퇴</button>
  					</form>
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
 <!-- 비밀번호 인등하기 -->
 <script>
document.addEventListener("DOMContentLoaded", function () {
  const checkBtn = document.getElementById("pwCheckBtn");
  const pwChangeSection = document.getElementById("pw-change-section");
  const changeBtn = document.getElementById("changePasswordBtn");
  /* 비번 인증 */
  checkBtn.addEventListener("click", function () {
    const currentPw = document.getElementById("currentPw").value;

    fetch("/checkPassword.do", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ password: currentPw }),
    })
    .then(response => response.json())
    .then(data => {
      if (data.valid === true) {
        alert("비밀번호가 확인되었습니다.");
        pwChangeSection.style.display = "block";
      } else {
        alert("비밀번호가 일치하지 않습니다.");
      }
    })
    .catch(error => {
      console.error("에러 발생:", error);
    });
  });
//변경 비밀번호 확인 및 변경
  changeBtn.addEventListener("click", function () {
    const newPw = document.getElementById("newPassword").value;
    const confirmPw = document.getElementById("confirmPassword").value;
    const currentPw = document.getElementById("currentPw").value;

    if (newPw === "" || confirmPw === "") {
      alert("비밀번호를 입력해주세요.");
      return;
    }

    if (newPw !== confirmPw) {
      alert("비밀번호가 일치하지 않습니다.");
      return;
    }

    fetch("<c:url value='/updatePassword.do' />", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        currentPassword: currentPw,
        newPassword: newPw,
        confirmPassword: confirmPw,
      }),
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.success) {
          alert("비밀번호가 성공적으로 변경되었습니다.");
          pwChangeSection.style.display = "none";
          // 초기화
          document.getElementById("currentPw").value = "";
          document.getElementById("newPassword").value = "";
          document.getElementById("confirmPassword").value = "";
        } else {
          alert(data.message);
        }
      })
      .catch((error) => {
        console.error("에러 발생:", error);
      });
  });
});

function confirmDelete() {
    if (confirm("정말 탈퇴하시겠습니까? 탈퇴 후 복구가 불가능합니다.")) {
      document.getElementById("deleteForm").submit();
    }
  }
  /* 닉네임 수정 */
  document.addEventListener("DOMContentLoaded", function () {
  const nicknameBtn = document.getElementById("nicknameUpdateBtn");

  nicknameBtn.addEventListener("click", function () {
    const newNickname = document.getElementById("nicknameInput").value.trim();

    if (newNickname === "") {
      alert("닉네임을 입력해주세요.");
      return;
    }

    fetch("<c:url value='/updateNickname.do' />", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ nickname: newNickname }),
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.success) {
          alert("닉네임이 성공적으로 변경되었습니다.");
        } else {
          alert("닉네임 변경 실패: " + data.message);
        }
      })
      .catch((err) => {
        console.error("에러 발생:", err);
      });
  });
});
  /* 핸드폰 등록 */
  document.addEventListener("DOMContentLoaded", function () {
  const phoneBtn = document.getElementById("phoneUpdateBtn");

  phoneBtn.addEventListener("click", function () {
    const phoneVal = document.getElementById("phoneInput").value.trim();

    if (phoneVal === "") {
      alert("핸드폰 번호를 입력해주세요.");
      return;
    }

    fetch("/updatePhone.do", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ phone: phoneVal }),
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.success) {
          alert("핸드폰 번호가 성공적으로 변경되었습니다.");
        } else {
          alert("변경 실패: " + data.message);
        }
      })
      .catch((err) => {
        console.error("에러 발생:", err);
      });
  });
});

</script>
 
 
</body>

</html>