package com.hootsuite.example.lambda.environment;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;

/**
 * Provides the credentials provider to invoke the AWS Lambda Function
 */
class AWSLambdaCredentialsProvider implements AWSCredentialsProvider {

    /**
     * Gets the AWS Credentials from strings
     */
    public AWSCredentials getCredentials() {
        // TODO Get this from a config file
        return new BasicAWSCredentials("<id>", "<secret>");
    }

    /**
     * Does nothing, {@see AWSCredentialsProvider.refresh}
     */
    public void refresh() {
        // Does nothing as credentials are static
    }
}