FROM swipl

RUN apt-get update
RUN apt-get install -y git wget graphviz imagemagick

ENV LANG C.UTF-8

ENV CLIOPATRIA_DIR /opt/ClioPatria
RUN mkdir $CLIOPATRIA_DIR

ENV PROJECT_DIR /opt/project
RUN mkdir $PROJECT_DIR

WORKDIR $CLIOPATRIA_DIR

ENV CLIOPATRIA_REPO https://github.com/ClioPatria/ClioPatria.git
ENV CLIOPATRIA_REF  7b550ba4d4aba273a47bc2c44bbf08a5f0e86b9d
RUN \
	git clone --recursive $CLIOPATRIA_REPO $CLIOPATRIA_DIR; \
	git checkout $CLIOPATRIA_REF

WORKDIR $PROJECT_DIR

CMD /opt/ClioPatria/configure --with-localhost
