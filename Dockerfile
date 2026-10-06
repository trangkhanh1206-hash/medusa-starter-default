FROM node:22-alpine

WORKDIR /app

# Copy toàn bộ mã nguồn và các thư mục đã được cài đặt/build sẵn từ Codespaces
COPY package*.json ./
COPY node_modules ./node_modules
COPY .medusa ./.medusa
COPY dist ./dist
COPY src ./src
COPY medusa-config.js ./medusa-config.js

ENV NODE_ENV=production
EXPOSE 9000

CMD ["npm", "run", "start"]