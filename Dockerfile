FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
# IMPORTANT FOR AWS DEPLOYMENT
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html