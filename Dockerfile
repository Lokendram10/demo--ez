# Stage 1 - Build React App
FROM node:22 as build

WORKDIR /app
COPY package*.json ./
RUN npm install --force
COPY . .
RUN npm run build  # Build the app for production

# Stage 2 - Serve with NGINX
FROM nginx:alpine

# Copy built React files to NGINX's web directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (default for NGINX)
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]