FROM circleci/golang:1.11

RUN GO111MODULE=off go get github.com/jstemmer/go-junit-report

ARG GCLOUD_VERSION=231.0.0
RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCLOUD_VERSION-linux-x86_64.tar.gz | tar --absolute-names -z -x -C $HOME/ -f -

ENV PATH ${PATH}:/home/circleci/google-cloud-sdk/bin

RUN gcloud --quiet components install app-engine-go

