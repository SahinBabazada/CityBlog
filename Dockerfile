# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy backend package.json and package-lock.json (if available)
COPY backend/package.json ./backend/
# COPY backend/package-lock.json ./backend/

# Install backend dependencies
# This is where Express.js will be installed
RUN cd backend && npm install

# Copy the rest of the backend code
COPY backend/ ./backend/

# Copy frontend files
COPY index.html .
COPY main.css .
COPY test.html .
# Add any other static assets like images if they were part of the project

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define environment variables (if any needed in future)
# ENV NODE_ENV production

# Run the app when the container launches
CMD ["node", "backend/server.js"]
