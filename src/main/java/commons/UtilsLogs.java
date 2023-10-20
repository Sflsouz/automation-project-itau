package commons;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class UtilsLogs {

    private static final Logger log = LogManager.getLogger("itau-tests");

    public static void log(String text) {
        log.info(text);
    }

    public static void logErro(String text) {
        log.error(text);
    }

}
