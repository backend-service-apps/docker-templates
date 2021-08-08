# Get Config Data
. env

# Open encrypted device
sudo cryptsetup open /dev/loop0 encrypted_data

# Mount File System
sudo mkdir -p $STORAGE
sudo mount /dev/mapper/encrypted_data $STORAGE

# Start Compose
export STORAGE
docker-compose up --build --remove-orphans \
  backend-service-superset \
  backend-service-redis \
  backend-service-postgres \
  backend-service-clickhouse

sudo umount /dev/mapper/encrypted_data
sudo cryptsetup close encrypted_data
