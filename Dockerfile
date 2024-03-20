# Use the official lightweigght Node.js 14 image
FROM node:18-alpine

# Setting WD in directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the app's source code from host to image fs
COPY . .

# Build the next.js app
RUN npm run build

#Expose port 3000 to the host, so we can access the container
EXPOSE 3000

# Run the Next.js start script
CMD ["npm", "start"]