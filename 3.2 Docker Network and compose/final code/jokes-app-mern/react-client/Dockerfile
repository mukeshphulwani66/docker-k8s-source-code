FROM node:20-alpine


ARG VITE_API_BASE_URL
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
EXPOSE 3000
ENTRYPOINT [ "npm","run"]
CMD ["dev"]

