FROM maven:3.8.5-eclipse-temurin-17 as build
WORKDIR /app

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

# WORKDIR /app
# COPY package.json package-lock.json ./
# RUN npm ci
# COPY . .
# RUN npm run build
#
# FROM nginx:1.21-alpine
# COPY --from=build /app/build /usr/share/nginx/html

#name: CI # как назвать - выбираете сами
#on:
#  push:
#    branches:
#      - master
#      - main
#jobs:
#  build:
#    runs-on: ubuntu-20.04
#    steps:
#      - uses: actions/checkout@v3
#      - uses: actions/setup-java@v3
#        with:
#          distribution: 'temurin' # See 'Supported distributions' for available options
#          java-version: '17'
#      - run: mvn package
#      - uses: actions/upload-artifact@v3
#        with:
#          name: app.jar
#          path: ./target/app.jar