#FastAPI with Poetry docker build OpenTelemetry

## Run Sequence
services/litr -> docker build --no-cache --label litr --tag litr --file docker/Dockerfile . --target development base directory -> docker-compose -f litr-compose.yaml up
