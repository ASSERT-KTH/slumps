FROM node:12

# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install

RUN npm install -g anyproxy
RUN anyproxy-ca -g

ENV INSTRUMENTER_ADDRESS ''
ENV INSTRUMENTATION_TYPE 'wrapper_global.js'

COPY . .
EXPOSE 8080
EXPOSE 8002
EXPOSE 10000

CMD [ "node", "proxy.js" ]
