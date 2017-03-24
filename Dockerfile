FROM ruby:2.2.4

# mysql Ver 14.14 Distrib 5.6.35, for Linux (x86_64)
ADD https://repo.mysql.com/RPM-GPG-KEY-mysql /tmp/
RUN apt-key add /tmp/RPM-GPG-KEY-mysql \
  && echo 'deb http://repo.mysql.com/apt/debian jessie mysql-5.6' > /etc/apt/sources.list.d/mysql.list \
  && apt-get update \
  && apt-get install -y mysql-community-client

# libzmq1 (2.2.0+dfsg-6)
RUN apt-get update && apt-get install -y libzmq-dev \
  && gem install ffi-rzmq -v '1.0.3'

CMD ["ruby", "-e", "\"require 'ffi-rzmq'; ZMQ::Message.new\""]
