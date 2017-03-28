package com.hootsuite.example.lambda.environment;

import com.amazonaws.services.lambda.invoke.LambdaFunction;
import com.amazonaws.services.lambda.invoke.LambdaInvokerFactory;

class AWSLambdaEnvironmentInvoker {

    private LambdaType lambdaType;

    private StagingLambdaInterface stagingLambdaInterface;
    private ProductionLambdaInterface productionLambdaInterface;

    AWSLambdaEnvironmentInvoker(LambdaInvokerFactory.Builder lambdaInvokerFactory, LambdaType lambdaType) {
        this.lambdaType = lambdaType;
        switch (this.lambdaType) {
            case STAGING:
                stagingLambdaInterface = lambdaInvokerFactory.build(StagingLambdaInterface.class);
                productionLambdaInterface = null;
                break;
            case PRODUCTION:
                stagingLambdaInterface = null;
                productionLambdaInterface = lambdaInvokerFactory.build(ProductionLambdaInterface.class);
                break;
        }
    }

    /**
     * Invokes the AWS Lambda function in either the staging or production environment.
     */
    String invokeLambda(int input) {
        switch (lambdaType) {
            case STAGING:
                return stagingLambdaInterface.sampleLambda_staging(input);
            case PRODUCTION:
                return productionLambdaInterface.sampleLambda_production(input);
        }
        return null;
    }

    interface StagingLambdaInterface {

        @LambdaFunction
        String sampleLambda_staging(int input);
    }

    interface ProductionLambdaInterface {

        @LambdaFunction
        String sampleLambda_production(int input);
    }

    enum LambdaType {
        STAGING,
        PRODUCTION
    }
}
