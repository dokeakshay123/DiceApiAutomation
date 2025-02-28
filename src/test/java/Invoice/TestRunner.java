package Invoice;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.DynamicNode;
import org.junit.jupiter.api.TestFactory;

public class TestRunner {

    @Karate.Test
    Karate testSingle() {
        return Karate.run("classpath:Invoice/getInvoices.feature").relativeTo(getClass());
    }

}
