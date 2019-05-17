FROM alpine:3.7
RUN apk add --no-cache bash git openssh-client

ADD bin/bump_git_version.sh /usr/local/bin/

RUN mkdir /root/.ssh/ && chmod 700 /root/.ssh

ENV SSH_KEY_SCAN "gitlab.com"
ENV DEVOPS_PRIVATE_KEY_BASE64 ""

ENV GIT_AUTHOR_NAME "devops@amaxlab.ru"
ENV GIT_AUTHOR_EMAIL "devops@amaxlab.ru"

ADD container-entrypoint.sh /usr/sbin/

ENTRYPOINT ["/usr/sbin/container-entrypoint.sh"]
