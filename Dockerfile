FROM nginx:alpine

# Устанавливаем ping
RUN apk --no-cache add iputils

# Удаляем дефолтный конфиг
RUN rm /etc/nginx/conf.d/default.conf

# Копируем наш конфиг
COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/app.conf /etc/nginx/conf.d/app.conf
COPY conf.d/client_upstream.conf /etc/nginx/conf.d/client_upstream.conf
COPY conf.d/admin_upstream.conf /etc/nginx/conf.d/admin_upstream.conf
COPY .htpasswd /etc/nginx/.htpasswd

# Создаем директорию для логов
RUN mkdir -p /var/log/nginx

EXPOSE 80 443 3000
