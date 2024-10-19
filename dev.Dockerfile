# Use Node.js for development
FROM node:20-alpine AS dev

# Set the environment variable to increase Node.js memory limit
ENV NODE_OPTIONS="--max-old-space-size=4096"

# Install git for version control
RUN apk add --no-cache git

# Set the working directory
WORKDIR /usr/src/app

# Install Angular CLI globally
RUN npm install -g @angular/cli@14.2.12

# Copy only package.json and package-lock.json to leverage Docker cache
COPY package*.json ./

# Copy the entire project
COPY . .

# Install dependencies
RUN npm install

# Expose the default Angular dev server port
EXPOSE 4200

# Start Angular app in development mode
CMD ["npm", "run", "serve:dev"]
