FROM node:16.13-alpine

# App folders
WORKDIR /src

# Node modules
COPY package*.jsonn ./
RUN npm install -g npm@9.5.1
RUN npm install --force
RUN npx tailwindcss init -p

COPY . /src

RUN chown -R node /src/node_modules

USER node

CMD ["npm", "run", "dev"]
