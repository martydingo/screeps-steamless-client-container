FROM debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive
LABEL Name=screeps-steamless-client-container Version=0.0.1 Maintainer=martydingo
RUN apt update && apt install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt-get update && apt-get install -y nodejs
RUN mkdir -p /usr/local/lib/screeps-steamless-client
COPY resources/package.nw /usr/local/lib/screeps-steamless-client
RUN npm install -g screeps-steamless-client
COPY resources/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/bin/bash", "docker-entrypoint.sh" ]