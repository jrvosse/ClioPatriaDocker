FROM swipl/swipl

RUN apt-get update
RUN apt-get install -y git

ENV CLIOPATRIA_USER cliopatria
ENV CLIOPATRIA_UID  3020
ENV CLIOPATRIA_DIR  /opt/ClioPatria

RUN useradd --uid $CLIOPATRIA_UID -M $CLIOPATRIA_USER
RUN mkdir $CLIOPATRIA_DIR
RUN chown $CLIOPATRIA_USER $CLIOPATRIA_DIR

EXPOSE 3020

USER $CLIOPATRIA_USER
WORKDIR $CLIOPATRIA_DIR

RUN git clone --depth 1 --recursive https://github.com/ClioPatria/ClioPatria.git $CLIOPATRIA_DIR



