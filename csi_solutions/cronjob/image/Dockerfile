FROM alpine

RUN apk add --no-cache bash curl && \
    echo 'export PS1="[docker \u@\h:\[\e[34;1m\]\w\[\033[m\] \[\033[1m\]\[\033[m\]] # "' >> /root/.bashrc && \
    echo 'alias ls="ls --color=auto"' >> /root/.bashrc && \
    echo 'alias ll="ls -l"' >> /root/.bashrc && \
    # clean
	rm -rf /var/lib/apt/lists/* /var/cache/apk/* && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    mv kubectl /usr/bin/kubectl && \
    chmod 775 /usr/bin/kubectl

COPY backup.sh /backup.sh

RUN chmod 775 /backup.sh