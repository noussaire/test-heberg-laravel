FROM php:8.2-cli

# Installer dépendances
RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    git \
    libsqlite3-dev

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Dossier de travail
WORKDIR /app

# Copier projet
COPY . .

# Installer Laravel
RUN composer install

# Donner permissions
RUN chmod -R 777 storage bootstrap/cache

# Créer SQLite
RUN touch database/database.sqlite

# Exposer port
EXPOSE 10000

# Lancer serveur
CMD php artisan serve --host=0.0.0.0 --port=10000