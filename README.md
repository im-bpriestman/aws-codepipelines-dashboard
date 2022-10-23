# AWS Codepipelines Dashboard

This is a spring boot app which serves a dashboard to see, the status
of your AWS Codepipelines.

It uses the AWS Java client to fetch data from AWS. Please follow the
policy instructions below to provide access. This means that the computer
running the spring boot app must have network access to AWS.

You can also run the application on your local computer. For example 
by running `mvn spring-boot:run` from the command line. There is also
docker files included to run the application in a container.

## Authenticating to AWS

In order to allow the application to access AWS pipelines, you'll need to populate the following environment variables in your shell:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

If using STS (recommended), you'll also need to provide a value for

* AWS_SESSION_TOKEN

The easiest way to do this locally, is to use [aws-vault](https://github.com/99designs/aws-vault) and configure a profile, which can access your pipelines.

## Getting started with Docker Compose

With the following command, you can run this application in a docker container:

```
aws-vault exec <profile> -- docker-compose up -d
```

This will start our application on a random port.
You can discover what this port is with

```
docker-compose port awscodepipelinesdashboard 8080
```

You can then access your dashboard on

```
http://localhost:<port>/
```

If you want to specify a fixed port to use each time, copy [/.env.example](/.env.example) to `/.env` and adjust the value of `AWSCODEPIPELINES_PORT` to meet your requirements.
