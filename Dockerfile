FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
COPY node_modules ./node_modules
COPY .medusa ./.medusa
COPY src ./src
COPY medusa-config.js ./medusa-config.js

# Đồng bộ file admin sang mọi đường dẫn mà loader của Medusa v2 tìm kiếm
RUN mkdir -p .medusa/server/public/admin public/admin && \
    cp -r .medusa/admin/* .medusa/server/public/admin/ 2>/dev/null || true && \
    cp -r .medusa/admin/* public/admin/ 2>/dev/null || true

ENV NODE_ENV=production
EXPOSE 9000

CMD npm run start