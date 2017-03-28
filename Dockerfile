# Pull base image.
FROM ubuntu:16.04

ENV TERRAFORM_VERSION=0.9.2
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv bash ca-certificates git openssl unzip wget software-properties-common openssh-client nano && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  pip install boto3==1.4.4 && \
  pip install pyyaml==3.12 && \
  cd /tmp && \
  wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
  rm -rf /tmp/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
