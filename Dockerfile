FROM node:lts-alpine

RUN mkdir /app

COPY CM-memory-seller /app

WORKDIR /app/CM-memory-seller

# RUN git checkout dev

RUN npm install 

CMD ["npm", "start"]

EXPOSE 3000
