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
ENV CLIOPATRIA_REF  01791d
RUN \
	git clone --recursive $CLIOPATRIA_REPO $CLIOPATRIA_DIR; \
	git checkout $CLIOPATRIA_REF
ADD entrypoint.sh .

WORKDIR $PROJECT_DIR

ENTRYPOINT /opt/ClioPatria/entrypoint.sh
