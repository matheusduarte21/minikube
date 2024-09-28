# Use a imagem oficial do Node.js como base
FROM node:18

# Crie e defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie o restante do código-fonte para o diretório de trabalho
COPY . .

# Construa o aplicativo React
RUN npm run build

# Configure o servidor da sua escolha (por exemplo, Nginx)
# Aqui, estamos usando o Nginx como servidor web
FROM nginx:alpine

# Copie os arquivos de build do React para o diretório de publicação do Nginx
COPY --from=0 /app/build /usr/share/nginx/html

# Exponha a porta 80 para acessar o aplicativo no navegador
EXPOSE 80

# Comando para iniciar o servidor Nginx
CMD ["nginx", "-g", "daemon off;"]
