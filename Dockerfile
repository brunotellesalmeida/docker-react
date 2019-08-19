FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#$AWS_SECRET_KEY - LCFacmX1Lj3DLk72Q9bOboycuZz9cGlLQrT+Vz9j