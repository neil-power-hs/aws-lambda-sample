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
         assertEquals(STRING_MISMATCH, "ZERO", lambdaGenerator.invoke(0));
    }

    @Test
    public void nonZeroTest() {
         assertEquals(STRING_MISMATCH, "GREATER THAN ZERO", lambdaGenerator.invoke(1));
    }

    @Test
    public void secondZeroTest() {
         assertEquals(STRING_MISMATCH, "TWO", lambdaGenerator.invoke(2));
    }

    @Test
    public void secondNonZeroTest() {
         assertEquals(STRING_MISMATCH, "THREE", lambdaGenerator.invoke(3));
    }
}
