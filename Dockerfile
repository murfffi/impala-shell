# slim doesn't work because it doesn't have gcc
ARG PYTHON_VERSION=3.10-bookworm
FROM python:$PYTHON_VERSION
ARG VERSION
RUN apt update && \
  apt install libkrb5-dev libsasl2-dev -y && \
  apt clean
RUN pip install impala-shell${VERSION:+==${VERSION}} && \
    ln -s $(which impala-shell) /bin/impala-shell
ENTRYPOINT [ "/bin/impala-shell" ]