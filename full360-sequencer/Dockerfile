FROM jruby:9.1-jre-alpine

LABEL build.publish.majorversion="1"
LABEL build.publish.minorversion="0.1.1"
LABEL build.publish.imagebase="jruby"
LABEL build.publish.sequencergemversion="0.0.7"

ARG SEQUENCER_GEM_VERSION=0.0.7
ENV SEQUENCER_GEM_VERSION=${SEQUENCER_GEM_VERSION}

MAINTAINER Jeremy Winters jeremy.winters@full360.com

ENV AWSCLI_VER 1.11.47

RUN apk add --no-cache \
      bash \
      git \
      wget \
      curl \
      ca-certificates \
      gnupg \
      groff \
      make \
      openssl \
      python \
      py-pip

#install aws cli
RUN \
    mkdir -p /aws \
    # Install and upgrade Pip
    && pip install --upgrade pip  \
    # Install AWS cli
    && pip install awscli==${AWSCLI_VER}  \
    && apk --purge -v del py-pip

#set time zone
RUN mv /etc/localtime /etc/localtime.bak ; ln -s /usr/share/zoneinfo/UTC /etc/localtime

USER root

RUN gem install full360-sequencer -v ${SEQUENCER_GEM_VERSION}

# this is the entry point
ADD bash/runner.sh /usr/sbin/runner.sh
RUN chmod 755 /usr/sbin/runner.sh
ENTRYPOINT ["/usr/sbin/runner.sh"]

# should be more than sufficient for transforms without
# large recordset operations.
ENV JRUBY_OPTS=-J-Xmx1024m

RUN mkdir /
