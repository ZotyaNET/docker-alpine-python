FROM python:alpine
LABEL maintainer="Z <z@44dev.com>"
LABEL version="1.0.0"

RUN apk add --no-cache gcc libc-dev python3 python3-dev

WORKDIR /src

COPY src/requirements.txt /src/requirements.txt
COPY src/main.py /src/main.py
COPY .docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN pip install --no-cache-dir -r requirements.txt

#RUN adduser -D -u 1000 vscode && \
#    mkdir -p /home/vscode && \
#    chown -R vscode:vscode /home/vscode
#
#USER vscode

ENTRYPOINT ["/entrypoint.sh"]