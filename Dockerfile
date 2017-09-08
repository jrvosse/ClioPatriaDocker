FROM swipl

RUN apt-get update
RUN apt-get install -y git wget graphviz imagemagick

ENV LANG C.UTF-8

ENV CLIOPATRIA_DIR /opt/ClioPatria
RUN mkdir $CLIOPATRIA_DIR

ENV PROJECT_DIR /opt/project
RUN mkdir $PROJECT_DIR

ENV CLIOPATRIA_USER cliopatria
ENV CLIOPATRIA_UID  3020
RUN useradd --uid $CLIOPATRIA_UID -M $CLIOPATRIA_USER
RUN chown $CLIOPATRIA_USER $CLIOPATRIA_DIR
RUN chown $CLIOPATRIA_USER $PROJECT_DIR

USER $CLIOPATRIA_USER
WORKDIR $CLIOPATRIA_DIR

ENV CLIOPATRIA_REF  V3.1.1
ENV CLIOPATRIA_REPO https://github.com/ClioPatria/ClioPatria.git
RUN \
	git clone --recursive $CLIOPATRIA_REPO $CLIOPATRIA_DIR; \
	git checkout $CLIOPATRIA_REF

WORKDIR $PROJECT_DIR

USER root

CMD /opt/ClioPatria/configure --with-localhost
