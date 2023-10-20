package steps.Apibase;

import apiBase.ApiBaseValidation;
import io.cucumber.java8.Pt;

public class ApiBaseValidationSteps implements Pt {


    ApiBaseValidation apiBaseValidation = new ApiBaseValidation();
    public ApiBaseValidationSteps() {

        E("valido o schema {string} na pasta {string}", (String nameJson, String nameFolder) -> {
            apiBaseValidation.validateSchemaJson(nameJson,nameFolder);
        });

        E("valido status code {int}", (Integer statusCode) -> {
            apiBaseValidation.validateStatusCode(statusCode);
        });

        E("valido se o campo {string} contem o valor {string}", (String key, String expectedValue) -> {
            apiBaseValidation.validateString(key, expectedValue);
        });
    }
}
