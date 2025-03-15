FROM node:20-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
EXPOSE 5000
ENTRYPOINT [ "npm","run"]
CMD ["dev"]
