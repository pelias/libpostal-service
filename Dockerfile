FROM pelias/libpostal_baseimage

# install go
RUN curl https://dl.google.com/go/go1.11.linux-amd64.tar.gz | tar -C /usr/local -xz
ENV PATH="$PATH:/usr/local/go/bin"
ENV PORT 4400

# bring in and build project go code
WORKDIR /code/go-whosonfirst-libpostal
RUN git clone https://github.com/whosonfirst/go-whosonfirst-libpostal.git .
RUN make bin

USER pelias

# set entrypoint to executable, ensuring the host is set so network requests will work
# additional parameters can be passed on the command line
ENTRYPOINT [ "./bin/wof-libpostal-server", "-host", "0.0.0.0", "-port", "4400" ]
