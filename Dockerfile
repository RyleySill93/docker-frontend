FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80 # just for elastic beanstalk - it is the port that gets mapped for incoming traffic
COPY --from=builder /app/build /usr/share/nginx/html