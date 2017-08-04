FROM justinshin/rpi_ruby:2.4.0
RUN apt-get update && apt-get install apt-transport-https
RUN echo "deb [arch=armhf] https://download.docker.com/linux/debian \
     jessie stable" | \
    tee /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get install docker-ce

COPY  mols_bot.rb Gemfile /

RUN apt-get update

RUN apt-get install build-essential

RUN bundle install

CMD ["bundle","exec","ruby","/mols_bot.rb"]
