FROM ruby:2.2.4

# Debian GNU/Linux 8 (jessie) w/ libzmq3 (4.0.5+dfsg-2+deb8u1)

RUN apt-get update && apt-get install -y libzmq3-dev
RUN gem install ffi-rzmq -v '2.0.4'

CMD ["ruby", "-e", "\"require 'ffi-rzmq'; ZMQ::Message.new\""]
