# youtube-dl-nas Server Dockerfile
# https://github.com/hyeonsangjeon/youtube-dl-nas.git

FROM ubuntu:18.04
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

# Install ffmpeg.
RUN apt update
RUN apt install -y ffmpeg vim dos2unix shadowsocks-libev python3 python3-pip python3-gevent

COPY /subber /usr/bin/subber 
COPY /run.sh /
COPY . /usr/src/app/
RUN chmod +x /usr/bin/subber && \
     dos2unix /usr/bin/subber && \
     ln -s /usr/src/app/downfolder / && \
     chmod +x /run.sh && \
     dos2unix /run.sh

RUN pip3 install -r /usr/src/app/requirements.txt

EXPOSE 8080

VOLUME ["/downfolder"]

CMD [ "/bin/bash", "/run.sh" ]
#CMD [ "python", "-u", "./youtube-dl-server.py" ]
