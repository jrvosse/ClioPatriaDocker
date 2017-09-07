FROM swipl

RUN apt-get update
RUN apt-get install -y git wget graphviz ImageMagick

ENV CLIOPATRIA_VER  V3.1.1
ENV CLIOPATRIA_USER cliopatria
ENV CLIOPATRIA_UID  3020
ENV CLIOPATRIA_DIR  /opt/ClioPatria
ENV PROJECT_DIR     /opt/project
ENV LANG en_US.UTF-8

RUN useradd --uid $CLIOPATRIA_UID -M $CLIOPATRIA_USER
RUN mkdir $CLIOPATRIA_DIR
RUN mkdir $PROJECT_DIR
RUN chown $CLIOPATRIA_USER $CLIOPATRIA_DIR
RUN chown $CLIOPATRIA_USER $PROJECT_DIR

EXPOSE 3020

USER $CLIOPATRIA_USER
WORKDIR $CLIOPATRIA_DIR
RUN git clone --recursive https://github.com/ClioPatria/ClioPatria.git $CLIOPATRIA_DIR; \
	git checkout $CLIOPATRIA_VER

WORKDIR $PROJECT_DIR

USER root

CMD /opt/ClioPatria/configure --with-localhost
