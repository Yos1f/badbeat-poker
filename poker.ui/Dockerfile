FROM node:14-bullseye
# ENV NODE_ENV=production
ENV mongoDBHost=polpodb
WORKDIR /app
COPY ["package.json", "./"]
# RUN rm node_modules -vfr

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libnotify-bin

RUN npm install -g npm@latest
RUN npm install -g typescript
RUN npm install -g gulp@^4.0.0 babel-register babel-polyfill
RUN npm install -g aurelia-cli
# RUN npm install aurelia-cli
RUN npm install 
# RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 9000
EXPOSE 3001 
RUN chown -R node /app
USER node
CMD ["npm", "start"]