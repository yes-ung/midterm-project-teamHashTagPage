<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/event.css" />

</head>
 <body>
    <div class="event-body">
      <div class="wheel-container">
        <div class="event-container">
          <div class="gift"><img src="/img/11.png" alt="광고" /></div>
          <div class="gift"><img src="/img/22.png" alt="광고" /></div>
          <div class="gift"><img src="/img/33.png" alt="광고" /></div>
          <div class="pointer"></div>

          <!-- START 버튼을 wheel 밖에 배치 -->
          <div class="center-button" onclick="spin()">START</div>

          <div class="wheel" id="wheel">
            <div class="sector-label">
              <span>
                <div><img src="/img/10percent.png" alt="10%" /></div>
              </span>
            </div>
            <div class="sector-label">
              <span>
                <div><img src="/img/25percent.png" alt="25%" /></div>
              </span>
            </div>
            <div class="sector-label">
              <span>
                <div><img src="/img/50percent.png" alt="50%" /></div>
              </span>
            </div>
            <div class="sector-label">
              <span>
                <div><img src="/img/75percent 1.png" alt="75%" /></div>
              </span>
            </div>
            <div class="sector-label">
              <span>
                <div><img src="/img/100percent.png" alt="100%" /></div>
              </span>
            </div>
            <div class="sector-label">
              <span>
                <div><img src="/img/5percent.png" alt="5%" /></div>
              </span>
            </div>
          </div>
        </div>
      </div>

      <!-- 모달 팝업 -->
      <div id="resultModal" class="modal">
        <div class="modal-content">
          <span class="close-btn">&times;</span>
          <p id="resultText"></p>
          <a href="#"
            ><button
              id="goCouponBtn"
              style="
                margin-top: 20px;
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                background-color: #5d75ff;
                color: white;
                border-radius: 5px;
                cursor: pointer;
              "
            >
              쿠폰함으로 가기
            </button></a
          >
        </div>
      </div>
</div>
      <script>
        const wheel = document.getElementById("wheel");
        const prizes = [
          "10% 할인",
          "25% 할인",
          "50% 할인",
          "75% 할인",
          "100% 할인",
          "5% 할인",
        ];
        let isSpinning = false;
        let hasPlayed = false;
        let deg = 0;

        const modal = document.getElementById("resultModal");
        const resultText = document.getElementById("resultText");
        const closeBtn = document.querySelector(".close-btn");

        function spin() {
          if (isSpinning || hasPlayed) return;

          isSpinning = true;
          hasPlayed = true;

          const sectorAngle = 360 / prizes.length;
          const randomIndex = Math.floor(Math.random() * prizes.length);
          const extraSpins = 360 * 5;
          const targetDeg = 360 - randomIndex * sectorAngle - sectorAngle / 2;

          deg += extraSpins + targetDeg;
          wheel.style.transform = `rotate(\${deg}deg)`;

          const startBtn = document.querySelector(".center-button");
          startBtn.style.background = "#ddd";
          startBtn.style.color = "#aaa";
          startBtn.style.cursor = "not-allowed";
          startBtn.innerText = "!당첨!";

          setTimeout(() => {
            // alert 대신 모달에 결과 출력 후 보여주기
            resultText.textContent = `축하합니다! \${prizes[randomIndex]} 당첨!`;
            modal.style.display = "block";
            isSpinning = false;
          }, 5200);
        }

        // 모달 닫기 이벤트
        closeBtn.onclick = function () {
          modal.style.display = "none";
        };

        // 모달 바깥 클릭 시 닫기
        window.onclick = function (event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        };
      </script>
    
  </body>
</html>
