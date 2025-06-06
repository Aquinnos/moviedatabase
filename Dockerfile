# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7
FROM node:20-alpine

# Use development node environment to install all dependencies.
ENV NODE_ENV development

WORKDIR /app

# Copy package.json and package-lock.json into the image.
COPY package*.json ./

# Install all dependencies, including devDependencies.
RUN npm install

# Copy the rest of the source files into the image.
COPY . .

# Change ownership of the files to the node user.
RUN chown -R node:node /app

# Switch back to production node environment.
ENV NODE_ENV production

# Run the application as a non-root user.
USER node

# Expose the port that the application listens on.
EXPOSE 5173

# Run the application.
CMD ["npm", "run", "dev"]