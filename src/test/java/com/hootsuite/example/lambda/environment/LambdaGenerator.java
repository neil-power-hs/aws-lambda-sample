package com.hootsuite.example.lambda.environment;

import com.hootsuite.example.lambda.SampleLambdaRequest;

public interface LambdaGenerator {

    String invoke(SampleLambdaRequest input);
}