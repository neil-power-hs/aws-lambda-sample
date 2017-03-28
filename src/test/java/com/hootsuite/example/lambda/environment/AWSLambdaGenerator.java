package com.hootsuite.example.lambda.environment;

import com.amazonaws.regions.Regions;
import com.amazonaws.services.lambda.AWSLambdaClientBuilder;
import com.amazonaws.services.lambda.invoke.LambdaInvokerFactory;

class AWSLambdaGenerator implements LambdaGenerator {

    private AWSLambdaEnvironmentInvoker AWSLambdaEnvironmentInvoker;

    AWSLambdaGenerator(AWSLambdaEnvironmentInvoker.LambdaType lambdaType) {
        LambdaInvokerFactory.Builder factory = LambdaInvokerFactory.builder()
                .lambdaClient(AWSLambdaClientBuilder
                        .standard()
                        .withRegion(Regions.US_EAST_1)
                        .withCredentials(new AWSLambdaCredentialsProvider())
                        .build());
        AWSLambdaEnvironmentInvoker = new AWSLambdaEnvironmentInvoker(factory, lambdaType);
    }

    @Override
    public String invoke(int input) {
        return AWSLambdaEnvironmentInvoker.invokeLambda(input);
    }
}
