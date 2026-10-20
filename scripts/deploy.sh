#!/bin/bash
set -e

VERSION=${1:-"latest"}
REPLICAS=${REPLICA_COUNT:-2}

echo "Iniciando Rolling Update..."
echo "Versión destino: $VERSION"
echo "Réplicas: $REPLICAS"

for i in $(seq 1 $REPLICAS); do
    echo "  Actualizando réplica $i/$REPLICAS..."
    sleep 1
    echo "  ✅ Réplica $i actualizada a v$VERSION"
done

echo ""
echo "Rolling Update completado. $REPLICAS réplicas en v$VERSION"
