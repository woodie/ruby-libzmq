FROM ruby:2.2.4

# Debian GNU/Linux 8 (jessie) w/ libzmq-dev (2.2.0+dfsg-6)
RUN apt-get update && apt-get install -y libzmq-dev
RUN gem install ffi-rzmq -v '1.0.3'

CMD ["ruby", "-e", "\"require 'ffi-rzmq'; ZMQ::Message.new\""]
