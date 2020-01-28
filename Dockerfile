FROM ruby:2.5

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN /bin/sh -c /bin/sh -c bundle install

COPY . .

# CMD ["./source/index.html.md"]

CMD ["source/index.html.md"]