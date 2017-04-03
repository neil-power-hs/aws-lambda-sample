package com.hootsuite.example.lambda.environment;

public class LambdaGeneratorSelector {

    private static final String SAMPLE_LAMBDA_ENV_VAR = "testEnvironment";
    private static final String LOCAL_ENV = "LOCAL";
    private static final String STAGING_ENV = "STAGING";
    private static final String PRODUCTION_ENV = "PRODUCTION";

    public static LambdaGenerator getLambdaGenerator() {
        String testEnvironment = System.getenv(SAMPLE_LAMBDA_ENV_VAR);
        if (testEnvironment == null) {
            return new LocalStringGenerator();
        }
        switch (testEnvironment) {
            case LOCAL_ENV:
                return new LocalStringGenerator();
            case STAGING_ENV:
                return new AWSLambdaInvoker(AWSLambdaInvoker.LambdaType.STAGING);
            case PRODUCTION_ENV:
                return new AWSLambdaInvoker(AWSLambdaInvoker.LambdaType.PRODUCTION);
            default:
                return new LocalStringGenerator();
        }
    }
}
