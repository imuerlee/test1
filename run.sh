#!/bin/sh
sed -i "s/8080/${PORT}/g" /app/cfg.json
exec /app/net -c /app/cfg.json
