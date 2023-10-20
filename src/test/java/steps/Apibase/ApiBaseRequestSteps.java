package steps.Apibase;
import apiBase.ApiBaseRequest;
import io.cucumber.java8.Pt;

public class ApiBaseRequestSteps implements Pt {

    ApiBaseRequest apiBaseRequest = new ApiBaseRequest();
    public ApiBaseRequestSteps() {
        Dado("que informo a url de requisicao {string}", (String url) -> {
            apiBaseRequest.setUrl(url);
        });

        E("informo o body json {string} na pasta {string}", (String nameJson, String nameFolder) -> {
            apiBaseRequest.setBodyFile(nameJson,nameFolder);
        });

        E("envio a requisicao {string}", (String method) -> {
            apiBaseRequest.sendRequisitionAPI(method);
        });

        E("altero o campo {string} para o valor {string}", (String key, String value) -> {
            apiBaseRequest.updateBodyRequest(key,value);
        });

        E("altero o campo {string} para o valor {int}", (String key, Integer value) -> {
            apiBaseRequest.updateBodyRequest(key,value);
        });
    }
}