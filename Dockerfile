# Use secure node base image
FROM node:current-stretch-slim

# Create app directory
WORKDIR /app

# Add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Copy package.json and package-lock.json into container
COPY package*.json ./

RUN npm config set unsafe-perm true

# Install node dependencies
RUN npm install --force

RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache

#RUN chown -R node:node /app/node_modules

# Copy current directory into container
COPY . ./

# Expose port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]

