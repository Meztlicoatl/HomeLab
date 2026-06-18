#!/usr/bin/env bash
set -e

mongosh --quiet --eval \
    -u "${MONGO_INITDB_ROOT_USERNAME}" \
    -p "${MONGO_INITDB_ROOT_PASSWORD}" \
    --authenticationDatabase "admin" <<EOF
db = db.getSiblingDB('${OPENSIGN_DB}');
db.dropUser('${OPENSIGN_USER}');

db.createUser({
    user: "${OPENSIGN_USER}",
    pwd: "${OPENSIGN_PASSWORD}",
    roles: [
        { role: "readWrite", db: "$OPENSIGN_DB" }
    ]
});

db.createCollection('setup_stub');
EOF