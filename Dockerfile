FROM ruby:3.3-slim

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libsqlite3-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock* ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bin/rails db:prepare && bin/rails server -b 0.0.0.0"]
