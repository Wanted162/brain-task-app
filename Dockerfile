# Step 1: Use node image
FROM node:18-alpine

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package.json (if exists) and install serve globally
COPY package*.json ./
RUN npm install -g serve

# Step 4: Copy app files
COPY . .

# Step 5: Expose port 3000
EXPOSE 3000

# Step 6: Run serve to serve dist folder
CMD ["serve", "-s", "dist", "-l", "3000"]
