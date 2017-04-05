package com.hootsuite.example.lambda;

public class SampleLambdaRequest {

    private int input;

    @SuppressWarnings("unused")
    public SampleLambdaRequest() {
        // Required for Serialization
    }

    public SampleLambdaRequest(int input) {
        this.input = input;
    }

    int getInput() {
        return input;
    }

    @SuppressWarnings("unused")
    public void setInput(int input) {
        this.input = input;
    }
}
