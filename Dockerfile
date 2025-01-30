# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.1.2
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails




# Set production environment
# ENV RAILS_ENV="production" \
#     BUNDLE_DEPLOYMENT="1" \
#     BUNDLE_PATH="/usr/local/bundle" \
#     BUNDLE_WITHOUT="development"

# CODIGO SUMINISTRADO OR CHATGPT

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"




# Ajusta los permisos del directorio de caché de bundler
RUN mkdir -p ${BUNDLE_PATH}/cache && chmod -R 777 ${BUNDLE_PATH}/cache


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config

# Install application gems
# COPY Gemfile Gemfile.lock ./
# RUN bundle install && \
#     rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
#     bundle exec bootsnap precompile --gemfile


# CODIGO SUMINISTRADO OR CHATGPT
# Install application gems
COPY Gemfile Gemfile.lock ./
RUN mkdir -p ${BUNDLE_PATH} && \
    chmod -R 777 ${BUNDLE_PATH} && \
    bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile




# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile


# Final stage for app image
FROM base

# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libsqlite3-0 libvips && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy built artifacts: gems, application
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]


# CODIGO SUMINISTRADO OR CHATGPT

# Usa una imagen base de Ruby (ajusta según tu versión)
FROM ruby:3.1.2

# Instala dependencias necesarias
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Copia los archivos de tu proyecto al contenedor
COPY . /Social-Network
WORKDIR /Social-Network

# Verifica las versiones de Ruby y Bundler
RUN ruby -v
RUN bundle -v

# Instala las gemas
RUN bundle install


RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

EXPOSE 10000

CMD ["rails", "server", "-b", "0.0.0.0"]
