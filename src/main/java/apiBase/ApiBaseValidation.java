package apiBase;

import org.everit.json.schema.Schema;
import org.everit.json.schema.loader.SchemaLoader;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.junit.Assert;

import java.io.InputStream;

public class ApiBaseValidation extends ApiBaseRequest {

    public void validateStatusCode(int code) {
        Assert.assertEquals("Status code invalido", code, response.getStatusCode());
    }

    public void validateString(String key, String valueExpect){
        String value = getKeyResponseBody(key);
        Assert.assertEquals("Json com valor invalido campo: " + key, valueExpect, value);
    }

    public void validateSchemaJson(String nameFile, String namePath) {
        String filePath = "schemas/" + namePath + "/" + nameFile;
        InputStream schemaStream = this.getClass().getClassLoader().getResourceAsStream(filePath);
        JSONObject rawSchema = new JSONObject(new JSONTokener(schemaStream));
        Schema schema = SchemaLoader.load(rawSchema);
        try {
            JSONObject json = new JSONObject(response.asString());
            schema.validate(json);
        } catch (Exception e) {
            throw new RuntimeException("Erro ao validar schemaJson");
        }
    }
}

