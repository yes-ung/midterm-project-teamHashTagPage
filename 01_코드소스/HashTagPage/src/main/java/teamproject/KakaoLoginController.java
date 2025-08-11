package teamproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.json.JSONObject; // 카카오 응답 JSON 파싱용

import teamproject.users.service.UsersService;
import teamproject.users.service.UsersVO;

@Controller
public class KakaoLoginController {

    private final String CLIENT_ID = "10f64f44255b5fdea9934c39d904037d";
    private final String REDIRECT_URI = "http://localhost:8080/login.do";

    
    
    @Autowired
    private UsersService usersService;
//	카카오 로그인
    @RequestMapping("/login.do")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
    	System.out.println("🔥🔥🔥 Kakao Callback 컨트롤러 탔음");

    	
    	String accessToken = getAccessToken(code);
        Map<String, Object> kakaoData = getUserInfo(accessToken);

        // 카카오에서 받아온 사용자 데이터
        String userEmail = (String) kakaoData.get("userEmail"); // ➜ VO에 저장될 필드명
        String userName = (String) kakaoData.get("userName");   // ➜ VO에 저장될 필드명

        // DB에서 조회 또는 신규 생성
        UsersVO user = usersService.findOrCreateKakaoUser(userEmail, userName);

        // 세션에 로그인 사용자 정보 저장
        session.setAttribute("usersVO", user);
     // **accessToken도 세션에 저장**
        session.setAttribute("access_token", accessToken);

        return "redirect:/";
    }

    private String getAccessToken(String code) throws Exception {
        String reqUrl = "https://kauth.kakao.com/oauth/token";

        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(reqUrl);

        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("grant_type", "authorization_code"));
        params.add(new BasicNameValuePair("client_id", CLIENT_ID));
        params.add(new BasicNameValuePair("redirect_uri", REDIRECT_URI));
        params.add(new BasicNameValuePair("code", code));

        post.setEntity(new UrlEncodedFormEntity(params));
        HttpResponse response = client.execute(post);
        String responseBody = EntityUtils.toString(response.getEntity());

        // 응답 출력 (디버깅용)
        System.out.println("===== 카카오 토큰 요청 응답 =====");
        System.out.println(responseBody);
        System.out.println("===============================");

        JSONObject json = new JSONObject(responseBody);

        // ✅ 에러 응답 처리
        if (json.has("error")) {
            String error = json.optString("error");
            String errorDesc = json.optString("error_description");
            System.out.println("❌ 카카오 토큰 요청 실패: " + error + " - " + errorDesc);
            throw new RuntimeException("카카오 로그인 실패: " + errorDesc); // 또는 return null 처리
        }

        // ✅ 정상 응답이면 access_token 반환
        return json.getString("access_token");
    }


    private Map<String, Object> getUserInfo(String accessToken) throws Exception {
        String reqUrl = "https://kapi.kakao.com/v2/user/me";

        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = new HttpGet(reqUrl);
        get.setHeader("Authorization", "Bearer " + accessToken);

        HttpResponse response = client.execute(get);
        String responseBody = EntityUtils.toString(response.getEntity());

        JSONObject json = new JSONObject(responseBody);
        JSONObject kakaoAccount = json.getJSONObject("kakao_account");
        JSONObject profile = kakaoAccount.getJSONObject("profile");

        Map<String, Object> userInfo = new HashMap<>();
        userInfo.put("userEmail", kakaoAccount.getString("email"));         // ➜ userEmail에 저장
        userInfo.put("userName", profile.getString("nickname"));            // ➜ userName에 저장

        return userInfo;
    }
}