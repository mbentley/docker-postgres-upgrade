# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

# set build args to be able to override the versions
ARG OLDVER \
  NEWVER

# set env var based on build arg but with defaults
ENV OLDVER="${OLDVER:-15}" \
  NEWVER="${NEWVER:-16}"

# install the postgres packages requested
RUN apk add --no-cache postgresql${OLDVER} postgresql${NEWVER} &&\
  apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing gosu

COPY postgres_upgrade.sh /

CMD ["/postgres_upgrade.sh"]
