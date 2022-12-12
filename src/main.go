package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

//@author: DevProblems(Sarang Kumar A Tak)

type Request struct {
	FirstName string
	LastName  string
}

type Response struct {
	FullName string
}

func lambdaHandler(request Request) (Response, error) {
	fmt.Println("request ", request)
	return Response{
		FullName: fmt.Sprint(request.FirstName, request.LastName),
	}, nil
}

func main() {
	lambda.Start(lambdaHandler)
}
