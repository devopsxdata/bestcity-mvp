# -------- Stage 1: Install dependencies --------
FROM node:20-alpine AS deps

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies WITHOUT running prepare/start scripts
RUN npm install --omit=dev --ignore-scripts


# -------- Stage 2: Runtime image --------
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

# Copy installed dependencies
COPY --from=deps /app/node_modules ./node_modules

# Copy backend code
COPY server ./server

WORKDIR /app/server

EXPOSE 3099

CMD ["node", "server.js"]
