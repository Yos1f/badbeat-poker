FROM node:14-bullseye

# ENV NODE_ENV=production
# RUN wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -
# RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list

ENV mongoDBHost=polpodb

RUN apt-get update
# RUN apt-get install -y mongodb-org
# RUN mongod
RUN apt-get install -y --no-install-recommends libnotify-bin
RUN  apt-get install -y --no-install-recommends python
RUN  apt-get install -y --no-install-recommends python3
    

RUN npm install -g typescript
RUN npm install -g aurelia-cli
RUN npm install -g npm@latest
RUN npm install -g node-sass

WORKDIR /app/poker.ui

COPY poker.ui/package*.json ./

RUN npm install

COPY poker.ui/. ./

WORKDIR /app/poker.admin.ui.angular

COPY poker.admin.ui.angular/. ./

WORKDIR /app/poker.payments

COPY poker.payments/. ./

WORKDIR /app/poker.engine

COPY poker.engine/package*.json ./

RUN npm install

COPY poker.engine/. ./

RUN tsc

EXPOSE 8111
RUN chown -R node /app

USER node

CMD ["npm", "start"]


# COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

# COPY ["poker.engine/package.json", "./"]
# RUN apt-get update 

# RUN npm install --production --silent && mv node_modules ../

# RUN npm install

# COPY . .
# EXPOSE 8111
# RUN chown -R node /app
# USER node
# RUN tsc
# CMD ["npm", "start"]
