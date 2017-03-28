package com.hootsuite.example.lambda.environment;

import com.hootsuite.example.lambda.SampleLambda;

class LocalStringGenerator implements LambdaGenerator {

    @Override
    @SuppressWarnings("Duplicates")
    public String invoke(int input) {
        return SampleLambda.invokeFunction(input, null);
    }
}
