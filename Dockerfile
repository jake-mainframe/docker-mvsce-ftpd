## Now build the 
FROM mainframed767/hercules:4.4.1.10647-SDL
COPY MVSCE /home/docker/MVSCE
RUN apt-get update && apt-get -yq install --no-install-recommends socat && apt-get clean && \
    useradd -rm -s /bin/bash -u 1000 docker && \
    chown -R docker:docker /home/docker && \
    mkdir /config /dasd /printers /punchcards /logs /certs && \
    chown -R docker:docker /config /dasd /printers /punchcards /logs /certs
WORKDIR /home/docker/MVSCE
USER docker
VOLUME ["/config","/dasd","/printers","/punchcards","/logs", "/certs"]
EXPOSE 2121 3270 3505 3506
ENTRYPOINT ["./start_mvs.sh"]
