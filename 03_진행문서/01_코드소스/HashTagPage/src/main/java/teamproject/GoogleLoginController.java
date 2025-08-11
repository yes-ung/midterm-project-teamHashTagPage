package teamproject;

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import teamproject.users.service.UsersService;
import teamproject.users.service.UsersVO;

@Controller
public class GoogleLoginController {

    private final String CLIENT_ID = "329613947953-2u9e01g5tauqesiedg7o38tbklkraqd0.apps.googleusercontent.com";
    private final String CLIENT_SECRET = "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";
    private final String REDIRECT_URI = "http://localhost:8080/google/login.do";

    @Autowired
    private UsersService usersService;

    @RequestMapping("/google/login.do")
    public String googleLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
        System.out.println("🔥🔥🔥 Google Callback 컨트롤러 탔음");

        String accessToken = getAccessToken(code);
        Map<String, Object> googleData = getUserInfo(accessToken);

        String userEmail = (String) googleData.get("userEmail");
        String userName = (String) googleData.get("userName");

        UsersVO user = usersService.findOrCreateGoogleUser(userEmail, userName);

        session.setAttribute("usersVO", user);

        return "redirect:/";
    }

    private String getAccessToken(String code) throws Exception {
        StringBuilder reqUrl = new StringBuilder("https://oauth2.googleapis.com/token");
        String params = "code=" + URLEncoder.encode(code, "UTF-8")
                + "&client_id=" + CLIENT_ID
                + "&client_secret=" + CLIENT_SECRET
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
                + "&grant_type=authorization_code";

        URL url = new URL(reqUrl.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        conn.getOutputStream().write(params.getBytes());

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder responseBuilder = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            responseBuilder.append(line);
        }

        JSONObject json = new JSONObject(responseBuilder.toString());

        if (json.has("error")) {
            throw new RuntimeException("❌ 구글 토큰 요청 실패: " + json.getString("error"));
        }

        return json.getString("access_token");
    }

    private Map<String, Object> getUserInfo(String accessToken) throws Exception {
        String reqUrl = "https://www.googleapis.com/oauth2/v2/userinfo";

        URL url = new URL(reqUrl + "?access_token=" + accessToken);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder responseBuilder = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            responseBuilder.append(line);
        }

        JSONObject json = new JSONObject(responseBuilder.toString());

        Map<String, Object> userInfo = new HashMap<>();
        userInfo.put("userEmail", json.getString("email"));
        userInfo.put("userName", json.optString("name", "GoogleUser"));

        return userInfo;
    }
}
