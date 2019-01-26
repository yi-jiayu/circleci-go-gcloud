FROM circleci/golang:1.11

RUN GO111MODULE=off go get github.com/jstemmer/go-junit-report

ARG GCLOUD_VERSION 231.0.0
RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCLOUD_VERSION-linux-x86_64.tar.gz | tar -z -x -C $HOME -f -
RUN echo 'source $HOME/google-cloud-sdk/path.bash.inc' >> $BASH_ENV

RUN gcloud --quiet components install app-engine-go

