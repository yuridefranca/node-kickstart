ARG IMAGE_VERSION=1.0.0
FROM okngroup/nginx-node-webserver:${IMAGE_VERSION}

ARG NODEJS_VERSION=current
RUN curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash -
RUN apt-get install -y nodejs
RUN npm install --location=global npm &&\
    npm install --location=global yarn

# Install zsh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- -t fino-time
RUN sudo rm /root/.zshrc

COPY oh-my-zsh/.zsh_history /root/.zsh_history
COPY oh-my-zsh/.zshrc /root/.zshrc

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]