# ---------- Build React ----------
FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install --ignore-scripts

COPY . .

RUN npm run build


# ---------- Runtime ----------
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json ./
RUN npm install --omit=dev --ignore-scripts

# backend
COPY server ./server

# frontend build to expected location
COPY --from=builder /app/build ./frontend/build

EXPOSE 3099

CMD ["npm","run","server"]
