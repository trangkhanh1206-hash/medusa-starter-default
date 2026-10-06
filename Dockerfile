FROM node:20-alpine

WORKDIR /app

# Copy toàn bộ mã nguồn và thư mục đã chuẩn bị sẵn từ máy của Thầy vào container
COPY . .

ENV NODE_ENV=production
EXPOSE 9000

CMD ["npm", "run", "start"]