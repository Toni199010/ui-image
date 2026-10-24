FROM registry.access.redhat.com/ubi9/nodejs-22-minimal:latest

USER 0

WORKDIR /app

RUN microdnf install -y gcc-c++ make python3 \
    && microdnf clean all

COPY package.json package-lock.json /app/

RUN npm ci

ENV NODE_PATH=/app/node_modules
ENV PATH="/app/node_modules/.bin:$PATH"

CMD ["node", "--version"]
