FROM node:18                   
WORKDIR /app                   
COPY package.json /app/package.json
ENV PATH /app/node_modules/.bin:$PATH    
RUN npm install    
RUN npm install react-scripts -g             
COPY . .                       
EXPOSE 8080                    
CMD ["npm", "start"]           
