# Keep aligned with min SDK in pubspec.yaml and Dart test version in .travis.yml
FROM google/dart:2.4.1

# Remove the apt-index again to keep the
# docker image diff small.
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
 apt-get update && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/*

RUN npm install -g vulcanize

WORKDIR /app
ADD pubspec.* /app/
ADD third_party /app/third_party
RUN find -name "*" -print
RUN pub get
ADD . /app
RUN pub get --offline

#RUN pub run grinder build
RUN pub run build_runner build -r -o web:build

RUN chmod -R a+r ~/.pub-cache
EXPOSE 8000

# Clear out any arguments the base images might have set and ensure we start
# the Dart app using custom script enabling debug modes.
CMD []
ARG DARTPAD_BACKEND
ENTRYPOINT pub run grinder serve-custom-backend
