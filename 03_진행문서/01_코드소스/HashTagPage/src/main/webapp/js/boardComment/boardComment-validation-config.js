/**
 *
 */ 
$("#addForm").validate({
  rules: {
    // 유효성 검사 규칙
    boardCommentId: {          // id별명
      required: true, // 필수 입력
      minlength: 1,   // 최소 입력 길이
    },
    postId: {          // id별명
      required: true, // 필수 입력
      minlength: 1,   // 최소 입력 길이
    },
    boardCommentContent: {          // id별명
      required: true, // 필수 입력
      minlength: 1,   // 최소 입력 길이
    },
    boardCommentCreatedAt: {          // id별명
      required: true, // 필수 입력
      minlength: 1,   // 최소 입력 길이
    },
    boardCommentIsDeleted: {          // id별명
      required: true, // 필수 입력
      minlength: 1,   // 최소 입력 길이
    },
    userId: {            // id별명
      required: true, // 필수 입력
      minlength: 1,   // 최소 입력 길이
    }
  },
  messages: {
    // 오류값 발생시 출력할 메시지 수동 지정
    boardCommentId: {   // id별명
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
    postId: {   // id별명
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
    boardCommentContent: {   // id별명
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
    boardCommentCreatedAt: {   // id별명
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
    boardCommentIsDeleted: {   // id별명
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
    userId: {
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    }
  }
});
