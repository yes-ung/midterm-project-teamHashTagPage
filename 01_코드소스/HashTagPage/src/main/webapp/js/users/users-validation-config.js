/**
 *
 */ 
$("#addForm").validate({
  rules: {
    // 유효성 검사 규칙
    userId : {          // id별명
      required: true, // 필수 입력
      minlength: 2,   // 최소 입력 길이
    },
    userName: {            // id별명
      required: true, // 필수 입력
      minlength: 2,   // 최소 입력 길이
    },
    userEmail: {            // id별명
      required: true, // 필수 입력
      email: true, // 이메일 형식 검증
    },
    userPw: {            // id별명
      required: true, // 필수 입력
      minlength: 2,   // 최소 입력 길이
    },
    reuserPw: {            // id별명
       required: true, // 필수 입력
      minlength: 2, // 최소 입력 길이,
      equalTo: userPw, // 비밀번호 필드와 동일한 값을 가지도록
    }
    
  },
  messages: {
    // 오류값 발생시 출력할 메시지 수동 지정
    userId: {   // id별명
      required: "",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
    userName: {
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
     userEmail: {            // id별명
      required: "필수 입력 항목입니다.",
      email: "올바른 이메일 형식으로 입력하세요.",
    },
    userPw: {            // id별명
       required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
    reuserPw: {            // id별명
       required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
      equalTo: "동일한 비밀번호를 입력해 주세요.",
    }
  }
});
