# ─────────────────────────────────────────
# Stage 1: Build the React frontend
# ─────────────────────────────────────────
FROM node:18 AS frontend-build

WORKDIR /app/frontend

# Copy frontend package files and install dependencies
COPY frontend/package*.json ./
RUN npm install --legacy-peer-deps

# Copy the rest of the frontend source and build it
COPY frontend/ ./
RUN npm run build

# ─────────────────────────────────────────
# Stage 2: Run the Express backend
# ─────────────────────────────────────────
FROM node:18-slim

WORKDIR /app

# Copy root package files and install backend dependencies
COPY package*.json ./
RUN npm install --production --legacy-peer-deps

# Copy backend source code
COPY backend/ ./backend/
COPY server.js ./

# Copy the built React app from Stage 1
COPY --from=frontend-build /app/frontend/build ./frontend/build

# Expose the port the app runs on
EXPOSE 4000

# Start the app
CMD ["node", "server.js"]
