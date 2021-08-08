

SUPERSET=$(docker ps | grep superset_1 | cut -f 1 -d " ")

docker exec -it $SUPERSET superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin

docker exec -it $SUPERSET superset db upgrade


docker exec -it $SUPERSET superset init
