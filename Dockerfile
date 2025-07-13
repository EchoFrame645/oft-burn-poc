# Use official Node.js LTS image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first (for layer caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy everything else (your contracts, tests, etc.)
COPY . .

# Compile contracts
RUN npx hardhat compile

# Set the default command
CMD ["npx", "hardhat", "test"]
