#!/usr/bin/env sh

docker compose up --build db -d
docker compose up --build data_loading
docker compose up --build grafana -d
