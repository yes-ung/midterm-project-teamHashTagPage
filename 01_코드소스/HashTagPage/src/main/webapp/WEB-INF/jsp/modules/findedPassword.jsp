<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/findedPassword.css" />

</head>
<body>
    <div class="findid-body">
      <a href="/"
        ><div class="findid-logo"><img src="/img/샵page.png" alt="page" /></div
      ></a>
      <div class="findid-container">
        <div id="div_email" class="box_inn selected">
          <div class="box_inn_sub">
            <p class="dsc">
              본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를
              받을 수 있습니다.
            </p>
            <dl>
              <dd>
                <input
                  type="text"
                  id="emailNm"
                  name="emailNm"
                  maxlength="40"
                  class="input_txt"
                  placeholder="아이디"
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

              <dd class="ct">
                <span class="input_box2">
                  <input
                    type="text"
                    id="emailAuthNo"
                    name="emailAuthNo"
                    maxlength="6"
                    onkeydown="check_num('emailAuthNo', '1')"
                    onclick="hiddenObj('span_emailAuthNo')"
                    class="input_txt"
                    disabled=""
                    placeholder="인증번호6자리입력"
                  />
                </span>
                <div>
                  인증번호가 오지 않나요?
                  <a
                    href="javascript:showHelp('emailHelpTxt');"
                    onclick="clickcr(this,'eml.help','','',event);"
                    class="ico_help2"
                    ><span class="blind">도움말</span></a
                  >
                  <!-- [D]툴팁 활성화시 display:block , 비활성화시 display:none  -->
                  <div
                    id="emailHelpTxt"
                    class="help_tooltip2"
                    style="display: none"
                  >
                    <p>
                      발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해
                      주세요.<br />
                      스팸 메일함에도 메일이 없다면,<br />
                      다시 한 번 '인증번호 받기'를 눌러주세요.
                    </p>
                    <span class="edge"></span>
                  </div>
                </dd>
              </dl>
              <div class="btn_area">
                <button>다음</button>
              </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
