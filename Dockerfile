# Latest version of centos
FROM centos:centos7
MAINTAINER xuxiang <downloadxu@163.com>
WORKDIR /tmp

RUN yum update -y

# Java installation
ENV JDK_VERSION 8u112
ENV JDK_BUILD_VERSION b15

RUN \
      curl -LO "http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-$JDK_BUILD_VERSION/jdk-$JDK_VERSION-linux-x64.rpm" -H 'Cookie: oraclelicense=accept-securebackup-cookie' && \
      rpm -i jdk-$JDK_VERSION-linux-x64.rpm && \
	    rm -f jdk-$JDK_VERSION-linux-x64.rpm && \
      yum clean all && \
      yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm && \
      java -version

ENV JAVA_HOME /usr/java/latest
ENV JRE_HOME $JAVA_HOME/jre
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$PATH
