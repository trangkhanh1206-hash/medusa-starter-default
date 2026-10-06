FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --legacy-peer-deps

COPY . .
RUN npx medusa build

ENV NODE_ENV=production
EXPOSE 9000

CMD ["npm", "run", "start"]