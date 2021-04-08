FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# Expose is NOT supported by Heroku
# use for dev support only
EXPOSE 8080

# Run the image as a non-root user
RUN adduser -D user
USER user

CMD [ "node", "index.js" ]
