docker-compose down
sudo mkdir -p ./db/{arbiter,primary,secondary}
sudo rm -rf ./db/*/*
sudo chown -R 1001:1001 ./db
docker-compose up
