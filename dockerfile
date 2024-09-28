# Usar uma imagem base oficial do Node.js
FROM node:18

# Definir o diretório de trabalho na imagem
WORKDIR /usr/src/app

# Copiar os arquivos de package.json e package-lock.json
COPY package*.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante dos arquivos da aplicação
COPY . .

# Expôr a porta que a aplicação vai usar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "app.js"]  # Substitua "app.js" pelo arquivo de entrada da sua aplicação
