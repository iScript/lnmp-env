ARG POSTGRES_VERSION
FROM postgres:${POSTGRES_VERSION}

RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
  sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
  sed -i 's/security-cdn.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list 


RUN apt-get update  && apt-get install -y build-essential git postgresql-server-dev-15
RUN cd /tmp && \
git clone --branch v0.4.1 https://github.com/pgvector/pgvector.git && \
cd pgvector &&  \
make && \
make install

# RUN mv /usr/local/share/postgresql/postgresql.conf.sample /usr/local/share/postgresql/postgresql.conf
# RUN echo "shared_preload_libraries = 'pgvector'" >> /usr/local/share/postgresql/postgresql.conf

CMD ["postgres"]

EXPOSE 5432