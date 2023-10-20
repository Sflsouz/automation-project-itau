package apiBase;

import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.json.JSONObject;

import java.nio.file.Files;
import java.nio.file.Paths;

public class ApiBaseRequest {

    static RequestSpecification request;
    static Response response;
    static JSONObject body;

    public void setUrl(String url) {
        RestAssured.baseURI = url;
        request = RestAssured.given();
        request.relaxedHTTPSValidation();
        request.header("Content-Type", "application/json");
        request.header("Accept", "application/json");

    }

    public Response sendRequisition(String method) {
        switch (method) {
            case "POST":
                return request.log().all().post().then().log().all().extract().response();
            default:
                return request.log().all().get().then().log().all().extract().response();
        }
    }

    public void sendRequisitionAPI(String method) {
        response = sendRequisition(method);
    }

    public void setBodyFile(String nameFile, String namePath) {
        String filePath = "src/main/resources/bodys/" + namePath + "/" + nameFile;
        try {
            String jsonContent = new String(Files.readAllBytes(Paths.get(filePath)));
            body = new JSONObject(jsonContent);
            request.body(body.toString());
        } catch (Exception e) {
            throw new RuntimeException("Erro ao acessar arquivo json");
        }
    }

    public void setBody(String body) {
        request.body(body);
    }


    public String getValorJson(String key) {
        return response.jsonPath().getString(key);
    }

    public String getResponseAPI() {
        return response.asString();
    }

    public void updateBodyRequest(String key, Object value) {
        DocumentContext context = JsonPath.parse(body.toString());
        context.set("$." + key, value);
        JSONObject json = new JSONObject(context.jsonString());
        body = json;
        setBody(json.toString());
    }

    public String getKeyResponseBody(String key){
        DocumentContext context = JsonPath.parse(response.asString());
        return context.read("$." +key);
    }

}