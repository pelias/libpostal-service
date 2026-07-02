# build the libpostal-server binary separately
FROM pelias/libpostal_baseimage AS builder

RUN apt-get update && \
    apt-get install -y pkg-config build-essential git && \
    rm -rf /var/lib/apt/lists/*

# install Golang
ARG TARGETARCH
RUN wget -qO- "https://golang.org/dl/go1.26.4.linux-${TARGETARCH}.tar.gz" | tar -C /usr/local -xzf -
ENV GOROOT=/usr/local/go \
    GOPATH=/root/go \
    PATH=${PATH}:/usr/local/go/bin:/root/go/bin

# clone go-whosonfirst-libpostal at pinned commit and build with pinned Go modules
WORKDIR /code/go-whosonfirst-libpostal
RUN git clone https://github.com/whosonfirst/go-whosonfirst-libpostal.git . && \
    git checkout 2113ee5c78f98374b3b4cd7a5ecb2150a3b6fd2c && \
    rm -rf vendor
COPY go-whosonfirst-libpostal.mod go.mod
COPY go-whosonfirst-libpostal.sum go.sum
RUN go mod verify && \
    go build -o bin/wof-libpostal-server ./cmd/wof-libpostal-server.go

# start of main image
FROM pelias/libpostal_baseimage

COPY --from=builder /code/go-whosonfirst-libpostal/bin/wof-libpostal-server /bin/

RUN ldconfig

USER pelias

ENV PORT=4400

# set entrypoint to executable, ensuring the host is set so network requests will work
# additional parameters can be passed on the command line
ENTRYPOINT ["/bin/wof-libpostal-server", "-host", "0.0.0.0", "-port", "4400"]
