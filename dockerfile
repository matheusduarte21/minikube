# Etapa 1: Build da aplicação React
FROM node:18 as build

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os arquivos de dependências do package.json e instalar dependências
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copiar o restante dos arquivos
COPY . .

# Compilar a aplicação React
RUN yarn build

# Etapa 2: Servir a aplicação usando o Nginx
FROM nginx:alpine

# Copiar os arquivos do build da etapa 1 para o Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expor a porta que o Nginx estará usando
EXPOSE 80

# Comando para rodar o Nginx
CMD ["nginx", "-g", "daemon off;"]
