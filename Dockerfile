FROM node:16-alpine
WORKDIR /app
COPY . .
COPY ./docker/config-template.json ./src/config.json
RUN npm -dd ci && npm run build

FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY --from=0 /app/build .

COPY --from=0 /app/docker/patch-env.sh /docker-entrypoint.d/patch-env.sh
RUN chmod +x /docker-entrypoint.d/*.sh

ENV OLLAMA_API_BASE_URL=http://localhost:11434/api
