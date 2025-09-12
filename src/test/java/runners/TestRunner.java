package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testSingle() {
        return Karate.run("classpath:Invoice/getInvoices.feature").relativeTo(getClass());
    }

}
