FROM ubuntu AS build
WORKDIR /opt/facebooc
COPY . .
RUN apt-get update && \
    apt-get install -yq build-essential make libsqlite3-dev sqlite3 && \
    make all

FROM ubuntu AS run
COPY --from=build /opt/facebooc/bin/facebooc .
EXPOSE 16000
CMD facebooc
