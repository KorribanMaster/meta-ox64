FROM crops/yocto:ubuntu-22.04-builder

USER root

RUN set -x \
	&& apt-get update && apt-get install -y curl python3 python-is-python3
# Install dependencies
RUN curl -o /usr/bin/repo https://storage.googleapis.com/git-repo-downloads/repo && \
    chmod a+x /usr/bin/repo
