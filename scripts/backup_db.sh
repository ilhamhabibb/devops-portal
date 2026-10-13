#!/bin/bash

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
CONTAINER_NAME="portal_db"
DB_NAME="portal_db"
DB_USER="portal_user"
DB_PASSWORD="userpassword_rahasia"

mkdir -p "$BACKUP_DIR"

echo "Memulai Proses backup database..."

docker exec -i "$CONTAINER_NAME" mysqldump -u "$DB_USER" -p "$DB_PASSWORD" "$DB_NAME" | gzip > "$BACKUP_DIR/db_backup_$TIMESTAMP.sql.gz"

if [ $? -eq 0 ]; then
    echo "Sukses! Backup berhasil disimpan di: $BACKUP_DIR/db_backup_$TIMESTAMP.sql.gz"
else
    echo "Gagal melakukan backup database!"
    exit 1
fi
