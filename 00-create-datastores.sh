
# Get Config Data
. env

# Install required packages
sudo apt-get install -y docker.io docker-compose git cryptsetup-bin

# Prepare encryption at rest
# https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions
sudo mkdir -p $STORAGE_RAW
head -c $STORAGE_SIZE /dev/zero > $STORAGE_RAW/luksfile               # create empty file
sudo losetup /dev/loop0 $STORAGE_RAW/luksfile                     # map file to /dev/loop0
sudo cryptsetup luksFormat --type luks2 /dev/loop0   # create LUKS2 container

# Open encrypted device and create file system
sudo cryptsetup open /dev/loop0 encrypted_data
sudo mkfs.ext4 /dev/mapper/encrypted_data

# Mount File System
sudo mkdir -p $STORAGE
sudo mount /dev/mapper/encrypted_data $STORAGE

# Postgres data
mkdir -p $STORAGE/pgdata

# Clickhouse data
mkdir -p $STORAGE/clickhouse

# Superset data
mkdir -p $STORAGE/data
mkdir -p $STORAGE/redis

# Other data
mkdir -p $STORAGE/jupyter
mkdir -p $STORAGE/vault
mkdir -p $STORAGE/nats

# Set Permissions
sudo chmod a+rwx -R $STORAGE

sudo umount /dev/mapper/encrypted_data
sudo cryptsetup close encrypted_data
