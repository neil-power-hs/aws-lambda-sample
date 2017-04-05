package com.hootsuite.example.lambda.environment;

import com.hootsuite.example.lambda.SampleLambda;
import com.hootsuite.example.lambda.SampleLambdaRequest;

class LocalStringGenerator implements LambdaGenerator {

    @Override
    @SuppressWarnings("Duplicates")
    public String invoke(SampleLambdaRequest input) {
        return SampleLambda.invokeFunction(input, null);
    }
}
