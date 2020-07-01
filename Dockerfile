FROM golang:1.14

WORKDIR /opt/gitlab-pages
RUN git clone https://gitlab.com/gitlab-org/gitlab-pages.git . && \
    make

COPY bin/start /usr/sbin/
RUN chmod +x /usr/sbin/start

ENV PATH "/opt/gitlab-pages/bin:$PATH"

VOLUME /pages_root

CMD "/usr/sbin/start"