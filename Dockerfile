FROM swipl

LABEL maintainer "Jacco.van.Ossenbruggen@cwi.nl"

RUN \
 apt-get update && \
 apt-get install -y --no-install-recommends \
  ca-certificates \
  git \
  graphviz \
  imagemagick \
  wget && \
 rm -rf /var/lib/apt/lists/*

ENV CLIOPATRIA_DIR /opt/ClioPatria
ENV PROJECT_DIR /opt/project
RUN mkdir $CLIOPATRIA_DIR

WORKDIR $CLIOPATRIA_DIR

ENV CLIOPATRIA_REPO https://github.com/ClioPatria/ClioPatria.git
ENV CLIOPATRIA_REF  V3.1.1-18-g6a08c84
RUN \
 git clone --recursive $CLIOPATRIA_REPO $CLIOPATRIA_DIR; \
 git checkout $CLIOPATRIA_REF
ADD entrypoint.sh .

RUN mkdir $PROJECT_DIR && \
    chmod 777 $PROJECT_DIR
WORKDIR $PROJECT_DIR

ENTRYPOINT [ "/opt/ClioPatria/entrypoint.sh" ]
CMD [ "daemon" ]
