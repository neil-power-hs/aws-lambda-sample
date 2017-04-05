package com.hootsuite.example.lambda;

import com.hootsuite.example.lambda.environment.LambdaGenerator;
import com.hootsuite.example.lambda.environment.LambdaGeneratorSelector;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class SampleTest {

    private static final String STRING_MISMATCH = "Test failed";

    private LambdaGenerator lambdaGenerator;

    @Before
    public void testSetup() {
        lambdaGenerator = LambdaGeneratorSelector.getLambdaGenerator();
    }

    @Test
    public void zeroTest() {
         assertEquals(STRING_MISMATCH, "ZERO", lambdaGenerator.invoke(new SampleLambdaRequest(0)));
    }

    @Test
    public void nonZeroTest() {
         assertEquals(STRING_MISMATCH, "GREATER THAN ZERO", lambdaGenerator.invoke(new SampleLambdaRequest(1)));
    }

    @Test
    public void twoTest() {
         assertEquals(STRING_MISMATCH, "TWO", lambdaGenerator.invoke(new SampleLambdaRequest(2)));
    }

    @Test
    public void threeTest() {
         assertEquals(STRING_MISMATCH, "THREE", lambdaGenerator.invoke(new SampleLambdaRequest(3)));
    }

    // TODO Uncomment to add a new test
//    @Test
//    public void fourTest() {
//        assertEquals(STRING_MISMATCH, "FOUR", lambdaGenerator.invoke(new SampleLambdaRequest(4)));
//    }
}
