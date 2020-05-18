FROM golang as protoc_builder

ENV GO111MODULE=on
RUN go get github.com/golang/protobuf/protoc-gen-go@v1.3.2

FROM alpine:latest

ENV GLIBC_VERSION=2.31-r0
ENV PROTOC_VERSION=3.12.0

RUN wget -q https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -O /etc/apk/keys/sgerrand.rsa.pub \
    && wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk -O glibc.apk \
    && apk add glibc.apk \
    && rm /etc/apk/keys/sgerrand.rsa.pub glibc.apk

RUN wget -q https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip -O protoc.zip \
    && unzip -o protoc.zip -d /usr/local bin/protoc \
    && unzip -o protoc.zip -d /usr/local 'include/*' \
    && rm protoc.zip

COPY --from=protoc_builder /go/bin/protoc-gen-go /usr/local/bin/

ENTRYPOINT ["protoc","-I/usr/local/include/google/protobuf","-I."]