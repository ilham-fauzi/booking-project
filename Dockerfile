FROM ruby:2.7.1
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client
RUN mkdir /test-sehatqu
WORKDIR /test-sehatqu
COPY .env /test-sehatqu/.env
COPY Gemfile /test-sehatqu/Gemfile
COPY Gemfile.lock /test-sehatqu/Gemfile.lock
RUN bundle install
RUN bundle exec rails webpacker:install
COPY . /test-sehatqu

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]