# Etapa 1: Build da aplicação React
FROM node:latest as build

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os arquivos de dependências do package.json e instalar dependências
COPY package*.json ./
RUN npm install

# Copiar o restante dos arquivos
COPY . .

# Compilar a aplicação React
RUN npm run build

# Etapa 2: Servir a aplicação usando Nginx
FROM nginx:alpine

# Copiar os arquivos do build da etapa 1 para o Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expor a porta que o Nginx estará usando
EXPOSE 80

# Comando para rodar o Nginx
CMD ["nginx", "-g", "daemon off;"]
