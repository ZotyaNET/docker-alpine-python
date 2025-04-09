FROM python:alpine
LABEL maintainer="Z <z@44dev.com>"
LABEL version="1.0.0"

RUN apk add --no-cache gcc libc-dev python3 python3-dev

WORKDIR /app

COPY app/requirements.txt /app/requirements.txt
COPY app/main.py /app/main.py

RUN pip install --no-cache-dir -r requirements.txt

# Create the vscode user
RUN adduser -D -u 1000 vscode && \
    mkdir -p /home/vscode && \
    chown -R vscode:vscode /home/vscode

# Set the default user
USER vscode

ENTRYPOINT ["python3", "main.py"]