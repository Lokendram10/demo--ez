FROM node:22
 WORKDIR /ezapp
COPY . .
RUN npm install --force

EXPOSE 3000
CMD ["npm", "start"]